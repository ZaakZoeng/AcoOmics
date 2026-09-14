#!/bin/bash
#SBATCH -D /share/home/zhangze/zz/NeuralOrigin/Data/09.AI/TranscriptFormer/
#SBATCH -o 09.05_TF.%j.out
#SBATCH -p gpu
#SBATCH -J 09.05_TF
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8
#SBATCH --gres=gpu:1
#SBATCH --mem=64G

echo "Begin"
# 0. 安装并运行TF， 并新建目录结构
# conda create -n transcriptformer python=3.11 -y
# pip install transcriptformer
source ~/anaconda3/bin/activate
conda activate transcriptformer

mkdir -p checkpoints
mkdir -p scripts
mkdir -p input_h5ad_candidate
mkdir -p OG_embeddings_user/species_pkl
mkdir -p inference_cge_candidate
mkdir -p cge_aggregated

# 1. 脚本一：将已有ESM2候选OG embedding转换成每个物种一个pkl
python scripts/01_make_species_candidate_og_embedding_pkl.py

# 2. 脚本二：构建只包含6个候选OG的测试h5ad
python scripts/02_make_candidate_og_h5ad.py

# 3. 脚本三：SLURM批量运行TranscriptFormer CGE inference
python - <<'PY'
import torch
print("torch:", torch.__version__)
print("torch cuda:", torch.version.cuda)
print("cuda available:", torch.cuda.is_available())
if torch.cuda.is_available():
    print("gpu:", torch.cuda.get_device_name(0))
PY

CHECKPOINT="/share/home/zhangze/zz/NeuralOrigin/Data/09.AI/TranscriptFormer/checkpoints/tf_metazoa"
INPUT_DIR="/share/home/zhangze/zz/NeuralOrigin/Data/09.AI/TranscriptFormer/input_h5ad_candidate"
EMBED_DIR="/share/home/zhangze/zz/NeuralOrigin/Data/09.AI/TranscriptFormer/OG_embeddings_user/species_pkl"
OUT_DIR="/share/home/zhangze/zz/NeuralOrigin/Data/09.AI/TranscriptFormer/inference_cge_candidate"

mkdir -p "${OUT_DIR}"

for species in Spla ClH23 HoH13 TrH2 TrH1 Auco Clhe Neve Dare
do
    echo "Running TranscriptFormer CGE for ${species}"

    mkdir -p "${OUT_DIR}/${species}"

    transcriptformer inference \
        --checkpoint-path "${CHECKPOINT}" \
        --data-file "${INPUT_DIR}/${species}.candidate_OGs.TF_input.h5ad" \
        --output-path "${OUT_DIR}/${species}" \
        --output-filename "${species}.candidate_OGs.cge.h5ad" \
        --gene-col-name og_id \
        --pretrained-embedding "${EMBED_DIR}/${species}.candidate_ogs.esm2_embedding.pkl" \
        --emb-type cge \
        --batch-size 1 \
        --num-gpus 1 \
        --device cuda \
        --use-raw False \
        --precision 16-mixed \
        --oom-dataloader \
        --config-override model.data_config.filter_to_vocabs=False

    echo "Finished ${species}"
done
echo "End time: $(date)"

# 4. 脚本四：检查CGE输出是否包含候选OG
python scripts/04_check_cge_outputs.py

# 5. 脚本五：聚合成candidate OG × species × CellTypes的平均CGE
python scripts/05_aggregate_candidate_og_cge_by_celltype.py

echo "finished"

