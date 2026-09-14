#!/usr/bin/env python3
import argparse
import os
import pandas as pd


def read_fasta(path):
    records = {}
    header = None
    seqs = []

    with open(path) as f:
        for line in f:
            line = line.rstrip()
            if not line:
                continue
            if line.startswith(">"):
                if header is not None:
                    records[header] = "".join(seqs)
                header = line[1:].split()[0]
                seqs = []
            else:
                seqs.append(line)

    if header is not None:
        records[header] = "".join(seqs)

    return records


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--orthogroups", required=True)
    parser.add_argument("--species-metadata", required=True)
    parser.add_argument("--candidate-ogs", required=True)
    parser.add_argument("--fasta-dir", required=True)
    parser.add_argument("--out-prefix", required=True)
    args = parser.parse_args()

    og_df = pd.read_csv(args.orthogroups, sep="\t")
    sp_meta = pd.read_csv(args.species_metadata, sep=r"\s+", engine="python")

    with open(args.candidate_ogs) as f:
        candidate_ogs = [x.strip() for x in f if x.strip()]

    species_info = {
        row["species"]: {
            "phylum": row["phylum"],
            "display_order": row["display_order"]
        }
        for _, row in sp_meta.iterrows()
    }

    candidate_df = og_df[og_df["Orthogroup"].isin(candidate_ogs)].copy()

    records = []

    for _, row in candidate_df.iterrows():
        og = row["Orthogroup"]

        for col in og_df.columns:
            if col == "Orthogroup":
                continue

            # Example: Auco.protein -> Auco
            species = col.replace(".protein", "")

            if species not in species_info:
                raise ValueError(f"Species {species} not found in species_metadata.tsv")

            cell = row[col]

            if pd.isna(cell) or str(cell).strip() == "":
                continue

            protein_ids = [x.strip() for x in str(cell).replace(",", " ").split() if x.strip()]

            for pid in protein_ids:
                esm_id = f"{species}__{pid}"

                records.append({
                    "Orthogroup_ID": og,
                    "species": species,
                    "phylum": species_info[species]["phylum"],
                    "display_order": species_info[species]["display_order"],
                    "protein_id": pid,
                    "esm_id": esm_id
                })

    map_df = pd.DataFrame(records)

    if map_df.empty:
        raise ValueError("No candidate proteins were extracted. Please check candidate OG IDs and Orthogroups.tsv.")

    all_fasta = {}

    for species in species_info:
        fasta_path = os.path.join(args.fasta_dir, f"{species}.protein.fasta")
        if not os.path.exists(fasta_path):
            raise FileNotFoundError(f"Missing FASTA file: {fasta_path}")

        print(f"Reading {fasta_path}")
        all_fasta[species] = read_fasta(fasta_path)

    fasta_out = f"{args.out_prefix}.candidate_proteins.fasta"
    map_out = f"{args.out_prefix}.protein_to_og.tsv"

    missing = []

    with open(fasta_out, "w") as out:
        for _, r in map_df.iterrows():
            species = r["species"]
            pid = r["protein_id"]
            esm_id = r["esm_id"]

            if pid not in all_fasta[species]:
                missing.append((species, pid, r["Orthogroup_ID"]))
                continue

            seq = all_fasta[species][pid]
            out.write(f">{esm_id}\n")
            for i in range(0, len(seq), 60):
                out.write(seq[i:i + 60] + "\n")

    map_df.to_csv(map_out, sep="\t", index=False)

    print(f"Saved mapping table: {map_out}")
    print(f"Saved candidate FASTA: {fasta_out}")
    print(f"Total candidate protein records in table: {len(map_df)}")
    print(f"Missing protein sequences: {len(missing)}")

    if missing:
        missing_out = f"{args.out_prefix}.missing_proteins.tsv"
        pd.DataFrame(missing, columns=["species", "protein_id", "Orthogroup_ID"]).to_csv(
            missing_out, sep="\t", index=False
        )
        print(f"Saved missing proteins: {missing_out}")


if __name__ == "__main__":
    main()