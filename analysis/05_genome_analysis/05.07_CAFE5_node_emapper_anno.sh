#!/bin/bash
#SBATCH -D /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/
#SBATCH -o 05.07_CAFE5_node_emapper_anno.%j.out
#SBATCH -p big
#SBATCH -J 05.07_CAFE5_node_emapper_anno
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32

cd /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis

# 按node11.genes.txt基因ID筛选出目标注释
head -1 /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/eggNOG_FunctionalAnnotation/eggNOG_output_processed/all_species.emapper.annotations \
> node11.emapper.annotations

grep -w -F -f node11.genes.txt \
/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/eggNOG_FunctionalAnnotation/eggNOG_output_processed/all_species.emapper.annotations \
>> node11.emapper.annotations

# 按node12.genes.txt基因ID筛选出目标注释
head -1 /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/eggNOG_FunctionalAnnotation/eggNOG_output_processed/all_species.emapper.annotations \
> node12.emapper.annotations

grep -w -F -f node12.genes.txt \
/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/eggNOG_FunctionalAnnotation/eggNOG_output_processed/all_species.emapper.annotations \
>> node12.emapper.annotations

# 按node15.genes.txt基因ID筛选出目标注释
head -1 /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/eggNOG_FunctionalAnnotation/eggNOG_output_processed/all_species.emapper.annotations \
> node15.emapper.annotations

grep -w -F -f node15.genes.txt \
/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/eggNOG_FunctionalAnnotation/eggNOG_output_processed/all_species.emapper.annotations \
>> node15.emapper.annotations

# 按nodeCommon_12_15.genes.txt基因ID筛选出目标注释
head -1 /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/eggNOG_FunctionalAnnotation/eggNOG_output_processed/all_species.emapper.annotations \
> nodeCommon_12_15.emapper.annotations

grep -w -F -f nodeCommon_12_15.genes.txt \
/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/eggNOG_FunctionalAnnotation/eggNOG_output_processed/all_species.emapper.annotations \
>> nodeCommon_12_15.emapper.annotations