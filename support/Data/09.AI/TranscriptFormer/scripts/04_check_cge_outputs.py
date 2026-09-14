#!/usr/bin/env python3

import os
import numpy as np
import pandas as pd
import anndata as ad


out_dir = "/share/home/zhangze/zz/NeuralOrigin/Data/09.AI/TranscriptFormer/inference_cge_candidate"

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

records = []

for species in species_order:
    path = os.path.join(out_dir, species, f"{species}.candidate_OGs.cge.h5ad")

    print(f"\nChecking {species}")
    print(path)

    if not os.path.exists(path):
        print("Missing output.")
        records.append({
            "species": species,
            "output_exists": False,
            "n_cge_instances": None,
            "n_unique_genes": None,
            "candidate_ogs_found": "",
            "candidate_ogs_missing": ",".join(candidate_ogs),
        })
        continue

    adata = ad.read_h5ad(path)

    required_keys = [
        "cge_embeddings",
        "cge_cell_indices",
        "cge_gene_names",
    ]

    for key in required_keys:
        if key not in adata.uns:
            raise KeyError(f"{species}: missing adata.uns['{key}']")

    gene_names = np.asarray(adata.uns["cge_gene_names"]).astype(str)
    unique_genes = sorted(set(gene_names.tolist()))

    found = [og for og in candidate_ogs if og in unique_genes]
    missing = [og for og in candidate_ogs if og not in unique_genes]

    print("n_cge_instances:", len(gene_names))
    print("unique genes:", unique_genes)
    print("found:", found)
    print("missing:", missing)

    records.append({
        "species": species,
        "output_exists": True,
        "n_cge_instances": len(gene_names),
        "n_unique_genes": len(unique_genes),
        "candidate_ogs_found": ",".join(found),
        "candidate_ogs_missing": ",".join(missing),
    })

summary = pd.DataFrame(records)
summary_path = os.path.join(out_dir, "candidate_OG_CGE_output_check.tsv")
summary.to_csv(summary_path, sep="\t", index=False)

print("\nSaved:", summary_path)