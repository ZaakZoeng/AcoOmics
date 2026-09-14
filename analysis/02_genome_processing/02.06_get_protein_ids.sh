#!/bin/bash
#SBATCH -D /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/
#SBATCH -o 02.06_get_protein_ids.%j.out
#SBATCH -p big
#SBATCH -J 02.06_get_protein_ids
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32

echo "Begin"
# 针对斑马鱼Dare，提取protein.fasta的ID并保存为Dare.protein.ids.txt
grep "^>" \
     /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/Dare.protein.fasta \
     | sed 's/^>//' \
     > /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/Dare.protein.ids.txt

# 针对海葵Neve，提取protein.fasta的ID并保存为Neve.protein.ids.txt
grep "^>" \
     /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/Neve.protein.fasta \
     | sed 's/^>//' \
     > /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/Neve.protein.ids.txt

# 针对Clhe，提取protein.fasta的ID并保存为Clhe.protein.ids.txt
grep "^>" \
     /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/Clhe.protein.fasta \
     | sed 's/^>//' \
     > /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/Clhe.protein.ids.txt

# 针对水母Auco，提取protein.fasta的ID并保存为Auco.protein.ids.txt
grep "^>" \
     /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/Auco.protein.fasta \
     | sed 's/^>//' \
     > /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/Auco.protein.ids.txt

# 针对丝盘虫Trad，提取protein.fasta的ID并保存为Trad.protein.ids.txt
grep "^>" \
     /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/Trad.protein.fasta \
     | sed 's/^>//' \
     > /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/Trad.protein.ids.txt

# 针对丝盘虫TrH1（Tadh），提取protein.fasta的ID并保存为TrH1.protein.ids.txt
grep "^>" \
     /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/TrH1.protein.fasta \
     | sed 's/^>//' \
     > /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/TrH1.protein.ids.txt

# 针对丝盘虫TrH2，提取protein.fasta的ID并保存为TrH2.protein.ids.txt
grep "^>" \
     /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/TrH2.protein.fasta \
     | sed 's/^>//' \
     > /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/TrH2.protein.ids.txt

# 针对丝盘虫HoH13，提取protein.fasta的ID并保存为HoH13.protein.ids.txt
grep "^>" \
     /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/HoH13.protein.fasta \
     | sed 's/^>//' \
     > /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/HoH13.protein.ids.txt

# 针对丝盘虫ClH23，提取protein.fasta的ID并保存为ClH23.protein.ids.txt
grep "^>" \
     /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/ClH23.protein.fasta \
     | sed 's/^>//' \
     > /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/ClH23.protein.ids.txt

# 针对海绵Spla，提取protein.fasta的ID并保存为Spla.protein.ids.txt
grep "^>" \
     /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/Spla.protein.fasta \
     | sed 's/^>//' \
     > /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/Spla.protein.ids.txt

echo "finished"

