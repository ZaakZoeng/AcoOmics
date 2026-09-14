#!/usr/bin/env python3

import os
import numpy as np
import pandas as pd
import anndata as ad


# =========================
# 0. Config
# =========================

inference_dir = (
    "/share/home/zhangze/zz/NeuralOrigin/Data/09.AI/TranscriptFormer/"
    "inference_cge_candidate"
)

out_dir = (
    "/share/home/zhangze/zz/NeuralOrigin/Data/09.AI/TranscriptFormer/"
    "cge_aggregated"
)

os.makedirs(out_dir, exist_ok=True)

species_order = [
    "Spla",
    "ClH23",
    "HoH13",
    "TrH2",
    "TrH1",
    "Auco",
    "Clhe",
    "Neve",
    "Dare",
]

candidate_ogs = [
    "OG0000112",
    "OG0000036",
    "OG0000203",
    "OG0000133",
    "OG0000166",
    "OG0000260",
]


# =========================
# 1. Helper
# =========================

def to_str_array(x):
    arr = np.asarray(x)
    if arr.dtype.kind in {"S", "O"}:
        return np.array([
            v.decode("utf-8") if isinstance(v, bytes) else str(v)
            for v in arr
        ])
    return arr.astype(str)


# =========================
# 2. Aggregate CGE
# =========================

metadata_records = []
embedding_list = []

for species in species_order:
    path = os.path.join(
        inference_dir,
        species,
        f"{species}.candidate_OGs.cge.h5ad"
    )

    print(f"\nProcessing {species}")
    print("Input:", path)

    if not os.path.exists(path):
        print(f"Warning: missing file for {species}, skipped.")
        continue

    adata = ad.read_h5ad(path)

    if "CellTypes" not in adata.obs.columns:
        raise ValueError(f"{species}: obs['CellTypes'] not found.")

    if "species" not in adata.obs.columns:
        adata.obs["species"] = species

    if "phylum" not in adata.obs.columns:
        adata.obs["phylum"] = "NA"

    if "display_order" not in adata.obs.columns:
        adata.obs["display_order"] = -1

    cge_embeddings = np.asarray(adata.uns["cge_embeddings"])
    cge_cell_indices = np.asarray(adata.uns["cge_cell_indices"]).astype(int)
    cge_gene_names = to_str_array(adata.uns["cge_gene_names"])

    candidate_mask = np.isin(cge_gene_names, candidate_ogs)

    if candidate_mask.sum() == 0:
        print(f"Warning: no candidate OG CGE found for {species}.")
        continue

    sub_embeddings = cge_embeddings[candidate_mask]
    sub_cell_indices = cge_cell_indices[candidate_mask]
    sub_ogs = cge_gene_names[candidate_mask]

    obs_df = adata.obs.reset_index(drop=False).rename(columns={"index": "cell_id"})

    sub_celltypes = obs_df.loc[sub_cell_indices, "CellTypes"].astype(str).to_numpy()
    sub_species = obs_df.loc[sub_cell_indices, "species"].astype(str).to_numpy()
    sub_phylum = obs_df.loc[sub_cell_indices, "phylum"].astype(str).to_numpy()
    sub_display_order = obs_df.loc[sub_cell_indices, "display_order"].to_numpy()
    sub_cell_ids = obs_df.loc[sub_cell_indices, "cell_id"].astype(str).to_numpy()

    instance_df = pd.DataFrame({
        "species": sub_species,
        "phylum": sub_phylum,
        "display_order": sub_display_order,
        "CellTypes": sub_celltypes,
        "Orthogroup_ID": sub_ogs,
        "cell_id": sub_cell_ids,
    })

    group_cols = [
        "Orthogroup_ID",
        "species",
        "phylum",
        "display_order",
        "CellTypes",
    ]

    grouped = instance_df.groupby(group_cols, sort=False)

    for key, idx in grouped.indices.items():
        og, sp, phylum, display_order, cell_type = key

        idx = np.asarray(idx, dtype=int)
        mean_vec = sub_embeddings[idx].mean(axis=0)

        metadata_records.append({
            "Orthogroup_ID": og,
            "species": sp,
            "phylum": phylum,
            "display_order": display_order,
            "CellTypes": cell_type,
            "n_cge_instances": int(len(idx)),
            "n_cells": int(instance_df.iloc[idx]["cell_id"].nunique()),
        })

        embedding_list.append(mean_vec.astype(np.float32))

    print(f"Aggregated groups for {species}: {len(grouped)}")


# =========================
# 3. Save outputs
# =========================

if len(embedding_list) == 0:
    raise ValueError("No aggregated CGE embeddings were generated.")

metadata_df = pd.DataFrame(metadata_records)
embeddings = np.vstack(embedding_list).astype(np.float32)

metadata_path = os.path.join(
    out_dir,
    "candidate_ogs_species_celltype_cge_metadata.tsv"
)

embedding_path = os.path.join(
    out_dir,
    "candidate_ogs_species_celltype_cge_embeddings.npy"
)

metadata_df.to_csv(metadata_path, sep="\t", index=False)
np.save(embedding_path, embeddings)

print("\nSaved metadata:", metadata_path)
print("Saved embeddings:", embedding_path)
print("Embedding matrix shape:", embeddings.shape)
print("Metadata rows:", len(metadata_df))

# Also save a compact summary table
summary = (
    metadata_df
    .groupby(["Orthogroup_ID", "species"], as_index=False)
    .agg(
        n_celltypes=("CellTypes", "nunique"),
        n_total_cells=("n_cells", "sum"),
        n_total_cge_instances=("n_cge_instances", "sum")
    )
)

summary_path = os.path.join(
    out_dir,
    "candidate_ogs_species_celltype_cge_summary.tsv"
)

summary.to_csv(summary_path, sep="\t", index=False)
print("Saved summary:", summary_path)