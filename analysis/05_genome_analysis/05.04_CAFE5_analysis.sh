#!/bin/bash
#SBATCH -D /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_input/
#SBATCH -o 05.04_CAFE5_analysis.%j.out
#SBATCH -p big
#SBATCH -J 05.04_CAFE5_analysis
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32


# 激活环境
source ~/anaconda3/bin/activate
conda activate of3_env

# 获取输入数据
# 手动复制05.GenomeAnalysis/OrthoFinder_Inference/OrthoFinder_output/Step1_QualityControl/SpeciesTree_rooted.txt
# 手动修改名称
# 手动复制05.GenomeAnalysis/OrthoFinder_Inference/OrthoFinder_output/Step3_OrthogroupsGeneCount/Orthogroups.GeneCount.tsv
# 手动修改列名
# python处理过滤
# python clade_and_size_filter.py \
#  -s -i Orthogroups.GeneCount.renamed.txt \
#  -o Metazoa_gene_family.txt

# 输入数据
# cafe5 -i mammal_gene_families.txt -t mammal_tree.txt -k 3
cafe5 -i Metazoa_gene_family.txt -t Metazoa_tree.txt -k 3 -o ../CAFE_output

# 获取Significant_trees.tre，存在星号*
cd ../CAFE_output
echo $'#nexus\nbegin trees;'>Significant_trees.tre
grep "*" Gamma_asr.tre >>Significant_trees.tre
echo "end;">>Significant_trees.tre

# 绘制结果图
cd ../CAFE_output
python ../CAFE_input/cafe5_draw_tree.py \
  -i Gamma_clade_results.txt \
  -d Gamma_report.cafe \
  -y Increase \
  -o CAFE5_expansions_tree.png

cd ../CAFE_output
python ../CAFE_input/cafe5_draw_tree.py \
  -i Gamma_clade_results.txt \
  -d Gamma_report.cafe \
  -y Decrease \
  -o CAFE5_contractions_tree.png

# cafeplotter
cafeplotter -i /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output -o /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/cafeplotter_res --ignore_branch_length

conda deactivate