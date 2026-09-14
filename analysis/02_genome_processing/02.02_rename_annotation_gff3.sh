#!/bin/bash
#SBATCH -D /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/
#SBATCH -o 02.02_rename_annotation_gff3.%j.out
#SBATCH -p big
#SBATCH -J 02.02_rename_annotation_gff3
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32

echo "gunzip Begin"

# 输入：…;ID=X;Name=Y
# 输出：…;ID=X;Name=X#Y
sed '/\tgene\t/ s/ID=\([^;]*\);Name=\([^;]*\)/ID=\1;Name=\1#\2/' \
    /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ReferenceGenome_processed/AU_ReferenceGenome/au.coerulea.QDv2.CycloneSeq.opt.gff3 \
     > /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ReferenceGenome_processed/AU_ReferenceGenome/au.coerulea.QDv2.CycloneSeq.opt.renamed.gff3

echo "gunzip End"