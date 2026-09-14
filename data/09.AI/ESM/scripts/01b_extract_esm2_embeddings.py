#!/usr/bin/env python3
import argparse
import os
from pathlib import Path

import torch
import esm
from tqdm import tqdm


def read_fasta(fasta_path):
    records = []
    name = None
    seqs = []

    with open(fasta_path) as f:
        for line in f:
            line = line.rstrip()
            if not line:
                continue
            if line.startswith(">"):
                if name is not None:
                    records.append((name, "".join(seqs)))
                name = line[1:].split()[0]
                seqs = []
            else:
                seqs.append(line)

    if name is not None:
        records.append((name, "".join(seqs)))

    return records


def load_model(model_name):
    if model_name == "esm2_t12_35M_UR50D":
        model, alphabet = esm.pretrained.esm2_t12_35M_UR50D()
        layer = 12
    elif model_name == "esm2_t30_150M_UR50D":
        model, alphabet = esm.pretrained.esm2_t30_150M_UR50D()
        layer = 30
    elif model_name == "esm2_t33_650M_UR50D":
        model, alphabet = esm.pretrained.esm2_t33_650M_UR50D()
        layer = 33
    else:
        raise ValueError(f"Unsupported model name: {model_name}")

    return model, alphabet, layer


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--model-name", default="esm2_t12_35M_UR50D")
    parser.add_argument("--fasta", required=True)
    parser.add_argument("--out-dir", required=True)
    parser.add_argument("--batch-size", type=int, default=4)
    parser.add_argument("--truncation-seq-length", type=int, default=4096)
    parser.add_argument("--device", default="auto", choices=["auto", "cuda", "cpu"])
    args = parser.parse_args()

    os.makedirs(args.out_dir, exist_ok=True)

    records = read_fasta(args.fasta)
    print(f"Loaded {len(records)} sequences from {args.fasta}")

    model, alphabet, repr_layer = load_model(args.model_name)
    batch_converter = alphabet.get_batch_converter()

    if args.device == "auto":
        device = "cuda" if torch.cuda.is_available() else "cpu"
    else:
        device = args.device

    model = model.to(device)
    model.eval()

    print(f"Using model: {args.model_name}")
    print(f"Representation layer: {repr_layer}")
    print(f"Device: {device}")

    # Truncate sequences if needed
    processed_records = []
    for name, seq in records:
        seq = seq.replace("*", "")
        if len(seq) > args.truncation_seq_length:
            seq = seq[:args.truncation_seq_length]
        processed_records.append((name, seq))

    with torch.no_grad():
        for i in tqdm(range(0, len(processed_records), args.batch_size)):
            batch = processed_records[i:i + args.batch_size]
            labels, strs, toks = batch_converter(batch)
            toks = toks.to(device)

            results = model(
                toks,
                repr_layers=[repr_layer],
                return_contacts=False
            )

            token_representations = results["representations"][repr_layer]

            for batch_idx, label in enumerate(labels):
                seq_len = len(strs[batch_idx])

                # Mean over amino acid tokens only, excluding BOS and EOS
                mean_rep = token_representations[batch_idx, 1:seq_len + 1].mean(0).cpu()

                out_path = Path(args.out_dir) / f"{label}.pt"

                torch.save(
                    {
                        "label": label,
                        "mean_representations": {
                            repr_layer: mean_rep
                        }
                    },
                    out_path
                )

    print(f"Saved embeddings to {args.out_dir}")


if __name__ == "__main__":
    main()