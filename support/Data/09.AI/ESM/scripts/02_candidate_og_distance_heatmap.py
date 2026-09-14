#!/usr/bin/env python3
import argparse
import os
import numpy as np
import pandas as pd
import torch
import matplotlib.pyplot as plt


def cosine_distance_matrix(X):
    X = np.asarray(X, dtype=np.float64)
    norm = np.linalg.norm(X, axis=1, keepdims=True)
    norm[norm == 0] = np.nan
    Xn = X / norm
    sim = np.matmul(Xn, Xn.T)
    dist = 1.0 - sim
    dist[np.abs(dist) < 1e-12] = 0.0
    return dist


def load_esm_embedding(pt_path, layer):
    obj = torch.load(pt_path, map_location="cpu")
    vec = obj["mean_representations"][layer].numpy()
    return vec


def plot_heatmap(mat_df, title, out_pdf):
    fig, ax = plt.subplots(figsize=(7, 6))

    data = mat_df.values.astype(float)
    masked = np.ma.masked_invalid(data)

    im = ax.imshow(masked, interpolation="nearest")

    ax.set_xticks(np.arange(mat_df.shape[1]))
    ax.set_yticks(np.arange(mat_df.shape[0]))
    ax.set_xticklabels(mat_df.columns, rotation=90)
    ax.set_yticklabels(mat_df.index)

    ax.set_title(title)
    cbar = fig.colorbar(im, ax=ax)
    cbar.set_label("Cosine distance")

    fig.tight_layout()
    fig.savefig(out_pdf)
    plt.close(fig)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--protein-to-og", required=True)
    parser.add_argument("--species-metadata", required=True)
    parser.add_argument("--candidate-ogs", required=True)
    parser.add_argument("--esm-dir", required=True)
    parser.add_argument("--repr-layer", type=int, required=True)
    parser.add_argument("--matrix-dir", required=True)
    parser.add_argument("--figure-dir", required=True)
    parser.add_argument("--out-prefix", required=True)
    args = parser.parse_args()

    os.makedirs(args.matrix_dir, exist_ok=True)
    os.makedirs(args.figure_dir, exist_ok=True)

    map_df = pd.read_csv(args.protein_to_og, sep="\t")
    sp_meta = pd.read_csv(args.species_metadata, sep=r"\s+", engine="python")
    sp_meta = sp_meta.sort_values("display_order")

    species_order = sp_meta["species"].tolist()
    phylum_map = dict(zip(sp_meta["species"], sp_meta["phylum"]))
    order_map = dict(zip(sp_meta["species"], sp_meta["display_order"]))

    with open(args.candidate_ogs) as f:
        candidate_ogs = [x.strip() for x in f if x.strip()]

    # Load protein-level embeddings
    embedding_dict = {}
    missing_pt = []

    for _, r in map_df.iterrows():
        esm_id = r["esm_id"]
        pt_path = os.path.join(args.esm_dir, f"{esm_id}.pt")

        if not os.path.exists(pt_path):
            missing_pt.append(esm_id)
            continue

        embedding_dict[esm_id] = load_esm_embedding(pt_path, args.repr_layer)

    if missing_pt:
        missing_path = os.path.join(args.matrix_dir, f"{args.out_prefix}.missing_esm_embeddings.txt")
        with open(missing_path, "w") as f:
            for x in missing_pt:
                f.write(x + "\n")
        print(f"Warning: missing {len(missing_pt)} ESM embeddings. See {missing_path}")

    map_df = map_df[map_df["esm_id"].isin(embedding_dict)].copy()

    if map_df.empty:
        raise ValueError("No valid ESM embeddings were found.")

    # Build species-specific OG embeddings
    records = []
    vectors = []

    for (og, species), sub in map_df.groupby(["Orthogroup_ID", "species"]):
        esm_ids = sub["esm_id"].tolist()
        vecs = np.vstack([embedding_dict[x] for x in esm_ids])
        mean_vec = vecs.mean(axis=0)

        records.append({
            "Orthogroup_ID": og,
            "species": species,
            "phylum": phylum_map.get(species, "NA"),
            "display_order": order_map.get(species, 999),
            "n_proteins": len(esm_ids)
        })
        vectors.append(mean_vec)

    species_og_meta = pd.DataFrame(records)
    species_og_meta.to_csv(
        os.path.join(args.matrix_dir, f"{args.out_prefix}.species_specific_og_embedding_metadata.tsv"),
        sep="\t",
        index=False
    )

    np.save(
        os.path.join(args.matrix_dir, f"{args.out_prefix}.species_specific_og_embeddings.npy"),
        np.vstack(vectors)
    )

    # A dictionary for easy access
    species_og_vec = {}
    for i, r in species_og_meta.iterrows():
        species_og_vec[(r["Orthogroup_ID"], r["species"])] = vectors[i]

    all_matrices = []

    # Individual candidate OG heatmaps
    for og in candidate_ogs:
        present_species = [sp for sp in species_order if (og, sp) in species_og_vec]

        full_mat = pd.DataFrame(
            np.nan,
            index=species_order,
            columns=species_order,
            dtype=float
        )

        if len(present_species) >= 2:
            X = np.vstack([species_og_vec[(og, sp)] for sp in present_species])
            dist = cosine_distance_matrix(X)
            sub_mat = pd.DataFrame(dist, index=present_species, columns=present_species)

            for sp1 in present_species:
                for sp2 in present_species:
                    full_mat.loc[sp1, sp2] = sub_mat.loc[sp1, sp2]

        elif len(present_species) == 1:
            sp = present_species[0]
            full_mat.loc[sp, sp] = 0.0

        matrix_path = os.path.join(args.matrix_dir, f"{og}.cosine_distance_matrix.tsv")
        fig_path = os.path.join(args.figure_dir, f"{og}.cross_species_cosine_distance_heatmap.pdf")

        full_mat.to_csv(matrix_path, sep="\t")
        plot_heatmap(full_mat, f"{og} cross-species ESM2 distance", fig_path)

        all_matrices.append(full_mat.values.astype(float))

        print(f"Saved {og}: {matrix_path}, {fig_path}")

    # Average matrix across six candidate OGs
    stacked = np.stack(all_matrices, axis=0)
    avg_mat = np.nanmean(stacked, axis=0)

    avg_df = pd.DataFrame(avg_mat, index=species_order, columns=species_order)

    avg_matrix_path = os.path.join(args.matrix_dir, f"{args.out_prefix}.average_candidate_ogs.cosine_distance_matrix.tsv")
    avg_fig_path = os.path.join(args.figure_dir, f"{args.out_prefix}.average_candidate_ogs.cross_species_cosine_distance_heatmap.pdf")

    avg_df.to_csv(avg_matrix_path, sep="\t")
    plot_heatmap(avg_df, "Average cross-species ESM2 distance of six candidate OGs", avg_fig_path)

    print(f"Saved average matrix: {avg_matrix_path}")
    print(f"Saved average heatmap: {avg_fig_path}")


if __name__ == "__main__":
    main()