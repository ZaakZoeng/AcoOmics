#!/bin/bash
#SBATCH -D /share/home/zhangze/zz/NeuralOrigin/Data/09.AI/ESM/
#SBATCH -o 09.02_ESM.%j.out
#SBATCH -p gpu
#SBATCH -J 09.02_ESM
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --gres=gpu:1
#SBATCH --mem=64G

echo "Begin"
# Step 0：安装并运行ESM2
# conda create -n esm2 python=3.10 -y
# conda activate esm2
# pip install torch
# pip install fair-esm pandas numpy scipy matplotlib
source ~/anaconda3/bin/activate
conda activate esm2






# Step 1：从OrthoFinder结果中提取候选OG对应protein序列
# 数据预处理
python scripts/01_prepare_candidate_fasta.py \
  --orthogroups input/Orthogroups.tsv \
  --species-metadata input/species_metadata.tsv \
  --candidate-ogs input/candidate_ogs.txt \
  --fasta-dir /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/OrthoFinder_Inference/OrthoFinder_input \
  --out-prefix output/candidate_ogs








# Step 2：运行ESM2
# 登录节点联网先执行下面命令再在计算节点执行后续代码（小模型）
# python - <<'PY'
# import esm
# model, alphabet = esm.pretrained.esm2_t12_35M_UR50D()
# print("download and load ok")
# PY

# 登录节点联网先执行下面命令再在计算节点执行后续代码（正式模型）
# python - <<'PY'
# import esm
# model, alphabet = esm.pretrained.esm2_t33_650M_UR50D()
# print("esm2_t33_650M_UR50D download and load ok")
# PY

python - <<'PY'
import torch
import esm
print("torch:", torch.__version__)
print("cuda:", torch.cuda.is_available())
print("esm:", esm.__file__)
PY

# # 小模型esm2_t12_35M_UR50D
# python scripts/01b_extract_esm2_embeddings.py \
#   --model-name esm2_t12_35M_UR50D \
#   --fasta output/candidate_ogs.candidate_proteins.fasta \
#   --out-dir embeddings/esm2_t12_35M_candidate_ogs \
#   --batch-size 4 \
#   --truncation-seq-length 4096 \
#   --device auto

# 正式模型esm2_t33_650M_UR50D
python scripts/01b_extract_esm2_embeddings.py \
  --model-name esm2_t33_650M_UR50D \
  --fasta output/candidate_ogs.candidate_proteins.fasta \
  --out-dir embeddings/esm2_t33_650M_candidate_ogs \
  --batch-size 1 \
  --truncation-seq-length 4096 \
  --device auto








# Step 3：计算species-specific OG embedding和跨物种距离热图
# # 使用的是小模型esm2_t12_35M_UR50D
# python scripts/02_candidate_og_distance_heatmap.py \
#   --protein-to-og output/candidate_ogs.protein_to_og.tsv \
#   --species-metadata input/species_metadata.tsv \
#   --candidate-ogs input/candidate_ogs.txt \
#   --esm-dir embeddings/esm2_t12_35M_candidate_ogs \
#   --repr-layer 12 \
#   --matrix-dir matrices/esm2_t12_35M \
#   --figure-dir figures/esm2_t12_35M \
#   --out-prefix candidate_ogs_esm2_t12_35M

# 使用的是正式模型esm2_t33_650M_UR50D
python scripts/02_candidate_og_distance_heatmap.py \
  --protein-to-og output/candidate_ogs.protein_to_og.tsv \
  --species-metadata input/species_metadata.tsv \
  --candidate-ogs input/candidate_ogs.txt \
  --esm-dir embeddings/esm2_t33_650M_candidate_ogs \
  --repr-layer 33 \
  --matrix-dir matrices/esm2_t33_650M \
  --figure-dir figures/esm2_t33_650M \
  --out-prefix candidate_ogs_esm2_t33_650M
echo "finished"

