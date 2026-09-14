#!/bin/bash
#SBATCH -D /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/
#SBATCH -o 06.17_CAFE5_specific_analysis.%j.out
#SBATCH -p big
#SBATCH -J 06.17_CAFE5_specific_analysis
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32


# 激活环境
source ~/anaconda3/bin/activate
conda activate of3_env

# Step3. 提取节点<11>基因ID
# 事先复制Orthogroups.txt：/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/OrthoFinder_Inference/OrthoFinder_input/OrthoFinder/Results_Jul21/Orthogroups/Orthogroups.txt

# 提取家族内所有基因
grep -w -f /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/DNB_analysis/DNB_enrich/DNB_OGs_List_Final.txt \
/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_input/Orthogroups.txt \
| sed 's/ /\n/g' \
| grep -v '^OG' \
| sort | uniq \
> /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/DNB_analysis/DNB_enrich/DNB_OGs_genes.txt

conda deactivate