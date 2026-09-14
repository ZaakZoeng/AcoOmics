#!/bin/bash
#SBATCH -D /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/
#SBATCH -o 02.05_unique_protein_fasta.%j.out
#SBATCH -p big
#SBATCH -J 02.05_unique_protein_fasta
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32


# 去重只保留第1次出现的ID及其序列，并把header中的下划线改为连字符

echo "Begin"

# 针对斑马鱼Dare，获取最终的protein.fasta
awk '
  /^>/ {
    if (seen[$0]++) { skip=1; next }
    skip=0
    gsub(/_/, "-", $0)
    print
    next
  }
  !skip { print }
' \
  /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence/Dare.renamed.protein.fasta \
> /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/Dare.protein.fasta

# 针对海葵Neve，获取最终的protein.fasta
awk '
  /^>/ {
    if (seen[$0]++) { skip=1; next }
    skip=0
    gsub(/_/, "-", $0)
    print
    next
  }
  !skip { print }
' \
  /share/home/zhangze/zz/NeuralOrigin/Data/01.RawData/PublicData/2024NematostellaVectensis/Nematostella_2_proteins.fasta \
> /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/Neve.protein.fasta

# 针对半球美螅水母Clhe，获取最终的protein.fasta
awk '
  /^>/ {
    if (seen[$0]++) { skip=1; next }
    skip=0
    gsub(/_/, "-", $0)
    print
    next
  }
  !skip { print }
' \
  /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence/Clhe.renamed.protein.fasta \
> /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/Clhe.protein.fasta

# 针对水母Auco，获取最终的protein.fasta
awk '
  /^>/ {
    if (seen[$0]++) { skip=1; next }
    skip=0
    gsub(/_/, "-", $0)
    print
    next
  }
  !skip { print }
' \
  /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence/Auco.renamed.protein.fasta \
> /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/Auco.protein.fasta

# 针对丝盘虫Trad，获取最终的protein.fasta
awk '
  /^>/ {
    if (seen[$0]++) { skip=1; next }
    skip=0
    gsub(/_/, "-", $0)
    print
    next
  }
  !skip { print }
' \
  /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence/Trad.renamed.protein.fasta \
> /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/Trad.protein.fasta

# 针对丝盘虫TrH1（Tadh），获取最终的protein.fasta
awk '
  /^>/ {
    if (seen[$0]++) { skip=1; next }
    skip=0
    gsub(/_/, "-", $0)
    print
    next
  }
  !skip { print }
' \
  /share/home/zhangze/zz/NeuralOrigin/Data/01.RawData/PublicData/2023Placozoa/Tadh/Tadh_proteins.fasta \
> /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/TrH1.protein.fasta

# 针对丝盘虫TrH2，获取最终的protein.fasta
awk '
  /^>/ {
    if (seen[$0]++) { skip=1; next }
    skip=0
    gsub(/_/, "-", $0)
    print
    next
  }
  !skip { print }
' \
  /share/home/zhangze/zz/NeuralOrigin/Data/01.RawData/PublicData/2023Placozoa/TrH2/TrH2_proteins.fasta \
> /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/TrH2.protein.fasta

# 针对丝盘虫HoH13，获取最终的protein.fasta
awk '
  /^>/ {
    if (seen[$0]++) { skip=1; next }
    skip=0
    gsub(/_/, "-", $0)
    print
    next
  }
  !skip { print }
' \
  /share/home/zhangze/zz/NeuralOrigin/Data/01.RawData/PublicData/2023Placozoa/Hhon/Hhon_proteins.fasta \
> /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/HoH13.protein.fasta

# 针对丝盘虫ClH23，获取最终的protein.fasta
awk '
  /^>/ {
    if (seen[$0]++) { skip=1; next }
    skip=0
    gsub(/_/, "-", $0)
    print
    next
  }
  !skip { print }
' \
  /share/home/zhangze/zz/NeuralOrigin/Data/01.RawData/PublicData/2023Placozoa/HoiH23/HoiH23_proteins.fasta \
> /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/ClH23.protein.fasta

# 针对海绵Spla，获取最终的protein.fasta
awk '
  /^>/ {
    if (seen[$0]++) { skip=1; next }
    skip=0
    gsub(/_/, "-", $0)
    print
    next
  }
  !skip { print }
' \
  /share/home/zhangze/zz/NeuralOrigin/Data/01.RawData/PublicData/2021Sponges/Spongilla_protein.fasta \
> /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence_processed/Spla.protein.fasta

echo "finished"

