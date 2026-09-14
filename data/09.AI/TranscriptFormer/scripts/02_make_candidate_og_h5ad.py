#!/usr/bin/env python3

import os
import pandas as pd
import scanpy as sc


# =========================
# 0. Paths
# =========================

input_dir = "/share/home/zhangze/zz/NeuralOrigin/Data/09.AI/TranscriptFormer/input_h5ad"

out_dir = "/share/home/zhangze/zz/NeuralOrigin/Data/09.AI/TranscriptFormer/input_h5ad_candidate"
os.makedirs(out_dir, exist_ok=True)

candidate_ogs = [
    "OG0000112",
    "OG0000036",
    "OG0000203",
    "OG0000133",
    "OG0000166",
    "OG0000260",
]

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


# =========================
# 1. Process h5ad
# =========================

summary_records = []

for species in species_order:
    in_path = os.path.join(input_dir, f"{species}.OG.TF_input.h5ad")
    out_path = os.path.join(out_dir, f"{species}.candidate_OGs.TF_input.h5ad")

    print(f"\nProcessing {species}")
    print("Input:", in_path)

    adata = sc.read_h5ad(in_path)
    adata.var_names = adata.var_names.astype(str)

    present_ogs = [og for og in candidate_ogs if og in adata.var_names]
    missing_ogs = [og for og in candidate_ogs if og not in adata.var_names]

    if len(present_ogs) == 0:
        raise ValueError(f"No candidate OGs found in {species}")

    adata_sub = adata[:, present_ogs].copy()

    # Ensure required var columns exist
    adata_sub.var["og_id"] = adata_sub.var_names.astype(str)
    adata_sub.var["ensembl_id"] = adata_sub.var_names.astype(str)
    adata_sub.var["gene_id"] = adata_sub.var_names.astype(str)
    adata_sub.var["is_candidate_OG"] = True

    # Ensure CellTypes exists
    if "CellTypes" not in adata_sub.obs.columns:
        raise ValueError(f"{species} does not contain obs['CellTypes'].")

    # Keep normalized adata.X directly
    adata_sub.write_h5ad(out_path)

    summary_records.append({
        "species": species,
        "n_cells": adata_sub.n_obs,
        "n_candidate_ogs_present": len(present_ogs),
        "candidate_ogs_present": ",".join(present_ogs),
        "candidate_ogs_missing": ",".join(missing_ogs),
        "output_path": out_path,
    })

    print("Saved:", out_path)
    print("Present:", present_ogs)
    print("Missing:", missing_ogs)


summary_df = pd.DataFrame(summary_records)
summary_path = os.path.join(out_dir, "candidate_og_h5ad_summary.tsv")
summary_df.to_csv(summary_path, sep="\t", index=False)

print("\nSaved summary:", summary_path)