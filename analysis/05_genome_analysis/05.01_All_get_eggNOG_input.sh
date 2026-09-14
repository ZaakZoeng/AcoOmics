#!/bin/bash
#SBATCH -D /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/
#SBATCH -o 05.01_get_eggNOG_input.%j.out
#SBATCH -p big
#SBATCH -J 05.01_get_eggNOG_input
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32

echo "Begin"

# 针对斑马鱼 Dare ，获取protein.fasta.gz
gzip -k -c /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/Dare.protein.fasta \
     > /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/eggNOG_FunctionalAnnotation/eggNOG_input/Dare.protein.fasta.gz

# 针对海葵 Neve ，获取protein.fasta.gz
gzip -k -c /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/Neve.protein.fasta \
     > /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/eggNOG_FunctionalAnnotation/eggNOG_input/Neve.protein.fasta.gz

# 针对半球美螅水母 Clhe ，获取protein.fasta.gz
gzip -k -c /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/Clhe.protein.fasta \
     > /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/eggNOG_FunctionalAnnotation/eggNOG_input/Clhe.protein.fasta.gz

# 针对水母 Auco ，获取protein.fasta.gz
gzip -k -c /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/Auco.protein.fasta \
     > /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/eggNOG_FunctionalAnnotation/eggNOG_input/Auco.protein.fasta.gz

# 针对丝盘虫 Trad ，获取protein.fasta.gz
gzip -k -c /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/Trad.protein.fasta \
     > /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/eggNOG_FunctionalAnnotation/eggNOG_input/Trad.protein.fasta.gz

# 针对丝盘虫 TrH1 （Tadh） ，获取protein.fasta.gz
gzip -k -c /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/TrH1.protein.fasta \
     > /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/eggNOG_FunctionalAnnotation/eggNOG_input/TrH1.protein.fasta.gz

# 针对丝盘虫 TrH2 ，获取protein.fasta.gz
gzip -k -c /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/TrH2.protein.fasta \
     > /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/eggNOG_FunctionalAnnotation/eggNOG_input/TrH2.protein.fasta.gz

# 针对丝盘虫 HoH13 ，获取protein.fasta.gz
gzip -k -c /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/HoH13.protein.fasta \
     > /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/eggNOG_FunctionalAnnotation/eggNOG_input/HoH13.protein.fasta.gz

# 针对丝盘虫 ClH23 ，获取protein.fasta.gz
gzip -k -c /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/ClH23.protein.fasta \
     > /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/eggNOG_FunctionalAnnotation/eggNOG_input/ClH23.protein.fasta.gz

# 针对海绵 Spla ，获取protein.fasta.gz
gzip -k -c /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/Spla.protein.fasta \
     > /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/eggNOG_FunctionalAnnotation/eggNOG_input/Spla.protein.fasta.gz

echo "finished"

