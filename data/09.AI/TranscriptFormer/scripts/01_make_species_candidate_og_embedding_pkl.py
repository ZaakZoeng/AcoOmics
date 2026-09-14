#!/usr/bin/env python3

import os
import pickle
import numpy as np
import pandas as pd


# =========================
# 0. Paths
# =========================

embedding_dict_path = (
    "/share/home/zhangze/zz/NeuralOrigin/Data/09.AI/TranscriptFormer/"
    "OG_embeddings_user/candidate_ogs_species_specific_embeddings_dict.npy"
)

metadata_path = (
    "/share/home/zhangze/zz/NeuralOrigin/Data/09.AI/TranscriptFormer/"
    "OG_embeddings_user/candidate_ogs_species_specific_embeddings_metadata.csv"
)

out_dir = (
    "/share/home/zhangze/zz/NeuralOrigin/Data/09.AI/TranscriptFormer/"
    "OG_embeddings_user/species_pkl"
)

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
# 1. Load dict
# =========================

obj = np.load(embedding_dict_path, allow_pickle=True).item()
metadata = pd.read_csv(metadata_path)

print("Loaded embedding dict:", embedding_dict_path)
print("Loaded metadata:", metadata_path)
print("Number of entries:", len(obj))


# =========================
# 2. Save one pkl per species
# =========================

summary_records = []

for species in species_order:
    species_embedding = {}

    for og in candidate_ogs:
        key = (og, species)

        if key not in obj:
            print(f"Warning: missing embedding for {key}")
            continue

        species_embedding[og] = np.asarray(obj[key], dtype=np.float32)

    out_path = os.path.join(
        out_dir,
        f"{species}.candidate_ogs.esm2_embedding.pkl"
    )

    with open(out_path, "wb") as f:
        pickle.dump(species_embedding, f)

    summary_records.append({
        "species": species,
        "n_ogs": len(species_embedding),
        "ogs": ",".join(species_embedding.keys()),
        "embedding_dim": (
            len(next(iter(species_embedding.values())))
            if len(species_embedding) > 0 else None
        ),
        "output_path": out_path,
    })

    print(f"Saved {species}: {out_path}, n_ogs={len(species_embedding)}")


summary_df = pd.DataFrame(summary_records)
summary_path = os.path.join(out_dir, "species_candidate_og_embedding_summary.tsv")
summary_df.to_csv(summary_path, sep="\t", index=False)

print("Saved summary:", summary_path)