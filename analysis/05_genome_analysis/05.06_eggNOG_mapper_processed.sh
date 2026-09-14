#!/bin/bash
#SBATCH -D /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/
#SBATCH -o 05.06_eggNOG_mapper_processed.%j.out
#SBATCH -p big
#SBATCH -J 05.06_eggNOG_mapper_processed
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32

# 合并全部注释文件（去掉多余表头，仅保留一个）
cd /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/eggNOG_FunctionalAnnotation/eggNOG_output_processed
head -1 Auco.emapper.annotations.tsv > all_species.emapper.annotations  # 只保留一份表头
tail -n +2 -q *.emapper.annotations.tsv >> all_species.emapper.annotations  # 所有注释去重叠表头后合并