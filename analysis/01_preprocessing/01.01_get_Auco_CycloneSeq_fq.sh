#!/bin/bash
#SBATCH -D /share/home/zhangze/zz/NeuralOrigin/Data/01.RawData/CycloneSeqData/202401batch_processed/
#SBATCH -o 01.01_get_CycloneSeq_fq.%j.out
#SBATCH -p big
#SBATCH -J 01.01_get_CycloneSeq_fq
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32

echo "gunzip Begin"

# AU_CycloneSeq
gunzip -c ../202401batch/TB200022CF/TB200022CF-202401031955000_read.fq.gz > AU_CycloneSeq/au.coerulea.CycloneSeq1.fq
gunzip -c ../202401batch/TB200024E6/TB200024E6-202401032003570_read.fq.gz > AU_CycloneSeq/au.coerulea.CycloneSeq2.fq

echo "gunzip End"