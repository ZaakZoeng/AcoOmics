#!/bin/bash
#SBATCH -D /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/
#SBATCH -o 02.03_gffread_to_get_protein_fasta.%j.out
#SBATCH -p big
#SBATCH -J 02.03_gffread_to_get_protein_fasta
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32

echo "load env"
source ~/anaconda3/bin/activate
conda activate zhangze

echo "gffread Begin"
gffread \
-y /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence/Auco.raw.protein.fasta \
-g /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ReferenceGenome_processed/AU_ReferenceGenome/au.coerulea.QDv2.fasta \
-M /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ReferenceGenome_processed/AU_ReferenceGenome/au.coerulea.QDv2.CycloneSeq.opt.renamed.gff3

echo "gffread finished"