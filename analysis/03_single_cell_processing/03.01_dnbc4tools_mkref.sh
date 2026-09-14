#!/bin/bash
#SBATCH -D /share/home/zhangze/zz/NeuralOrigin/Data/03.SingleCellProcessing/StarIndex_sc/
#SBATCH -o 03.01_dnbc4tools_mkref.%j.out
#SBATCH -p big
#SBATCH -J 03.01_dnbc4tools_mkref
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32

# 定义变量
REF_DIR="/share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ReferenceGenome_processed"

source ~/anaconda3/bin/activate
conda activate dnbc4tools

echo "star_index_au.coerulea.Yantai begin"
mkdir star_index_au.coerulea.Yantai
cd star_index_au.coerulea.Yantai
dnbc4tools rna mkref \
	--ingtf $REF_DIR/AU_ReferenceGenome/au.coerulea.Yantai.generated.gff3 \
	--fasta $REF_DIR/AU_ReferenceGenome/au.coerulea.Yantai.fna \
	--threads 32 \
	--species au.coerulea.Yantai
echo "star_index_au.coerulea.Yantai end"



echo "star_index_au.coerulea.QDv2 begin"
mkdir star_index_au.coerulea.QDv2
cd star_index_au.coerulea.QDv2
dnbc4tools rna mkref \
	--ingtf $REF_DIR/AU_ReferenceGenome/au.coerulea.QDv2.gff \
	--fasta $REF_DIR/AU_ReferenceGenome/au.coerulea.QDv2.fasta \
	--threads 32 \
	--species au.coerulea.QDv2
echo "star_index_au.coerulea.QDv2 end"


echo "star_index_au.coerulea.QDv2.CycloneSeq.opt begin"
mkdir star_index_au.coerulea.QDv2.CycloneSeq.opt
cd star_index_au.coerulea.QDv2.CycloneSeq.opt
dnbc4tools rna mkref \
	--ingtf $REF_DIR/AU_ReferenceGenome/au.coerulea.QDv2.CycloneSeq.opt.renamed.gff3 \
	--fasta $REF_DIR/AU_ReferenceGenome/au.coerulea.QDv2.fasta \
	--threads 32 \
	--species au.coerulea.QDv2.CycloneSeq.opt
echo "star_index_au.coerulea.QDv2.CycloneSeq.opt end"
