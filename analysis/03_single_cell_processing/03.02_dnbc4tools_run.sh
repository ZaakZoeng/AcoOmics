#!/bin/bash
#SBATCH -D /share/home/zhangze/zz/NeuralOrigin/Data/03.SingleCellProcessing/scDnbc4tools/
#SBATCH -o 03.02_dnbc4tools_run.%j.out
#SBATCH -p big
#SBATCH -J 03.02_dnbc4tools_run
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32

# 定义变量
RAW_DATA_DIR="/share/home/zhangze/zz/NeuralOrigin/Data/01.RawData/DNBeLabC4Data/202312batch_processed"
STAR_INDEX_DIR="/share/home/zhangze/zz/NeuralOrigin/Data/03.SingleCellProcessing/StarIndex_sc"

# 激活环境
source ~/anaconda3/bin/activate
conda activate dnbc4tools

# 水母的单细胞流程
# ################################################################################
mkdir dnbc4tools_au.coerulea.Yantai
cd dnbc4tools_au.coerulea.Yantai
echo "dnbc4tools run au.coerulea.Yantai Begin"
dnbc4tools rna run \
	--cDNAfastq1 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.01.cDNAfastq1.fq.gz \
	--cDNAfastq2 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.01.cDNAfastq2.fq.gz \
	--oligofastq1 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.01.oligofastq1.fq.gz \
	--oligofastq2 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.01.oligofastq2.fq.gz \
	--genomeDir $STAR_INDEX_DIR/star_index_au.coerulea.Yantai  \
	--name au.coerulea.Yantai.202312batch.01 --threads 32

dnbc4tools rna run \
	--cDNAfastq1 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.02.cDNAfastq1.fq.gz \
	--cDNAfastq2 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.02.cDNAfastq2.fq.gz \
	--oligofastq1 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.02.oligofastq1.fq.gz \
	--oligofastq2 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.02.oligofastq2.fq.gz \
	--genomeDir $STAR_INDEX_DIR/star_index_au.coerulea.Yantai  \
	--name au.coerulea.Yantai.202312batch.02 --threads 32

dnbc4tools rna run \
	--cDNAfastq1 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.03.cDNAfastq1.fq.gz \
	--cDNAfastq2 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.03.cDNAfastq2.fq.gz \
	--oligofastq1 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.03.oligofastq1.fq.gz \
	--oligofastq2 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.03.oligofastq2.fq.gz \
	--genomeDir $STAR_INDEX_DIR/star_index_au.coerulea.Yantai  \
	--name au.coerulea.Yantai.202312batch.03 --threads 32
echo "dnbc4tools run au.coerulea.Yantai End"


# ################################################################################
mkdir dnbc4tools_au.coerulea.QDv2
cd dnbc4tools_au.coerulea.QDv2
echo "dnbc4tools run au.coerulea.QDv2 Begin"
dnbc4tools rna run \
	--cDNAfastq1 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.01.cDNAfastq1.fq.gz \
	--cDNAfastq2 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.01.cDNAfastq2.fq.gz \
	--oligofastq1 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.01.oligofastq1.fq.gz \
	--oligofastq2 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.01.oligofastq2.fq.gz \
	--genomeDir $STAR_INDEX_DIR/star_index_au.coerulea.QDv2  \
	--name au.coerulea.QDv2.202312batch.01 --threads 32

dnbc4tools rna run \
	--cDNAfastq1 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.02.cDNAfastq1.fq.gz \
	--cDNAfastq2 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.02.cDNAfastq2.fq.gz \
	--oligofastq1 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.02.oligofastq1.fq.gz \
	--oligofastq2 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.02.oligofastq2.fq.gz \
	--genomeDir $STAR_INDEX_DIR/star_index_au.coerulea.QDv2  \
	--name au.coerulea.QDv2.202312batch.02 --threads 32

dnbc4tools rna run \
	--cDNAfastq1 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.03.cDNAfastq1.fq.gz \
	--cDNAfastq2 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.03.cDNAfastq2.fq.gz \
	--oligofastq1 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.03.oligofastq1.fq.gz \
	--oligofastq2 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.03.oligofastq2.fq.gz \
	--genomeDir $STAR_INDEX_DIR/star_index_au.coerulea.QDv2  \
	--name au.coerulea.QDv2.202312batch.03 --threads 32
echo "dnbc4tools run au.coerulea.QDv2 End"


# ################################################################################
mkdir dnbc4tools_au.coerulea.QDv2.CycloneSeq.opt
cd dnbc4tools_au.coerulea.QDv2.CycloneSeq.opt
echo "dnbc4tools run au.coerulea.QDv2.CycloneSeq.opt Begin"
dnbc4tools rna run \
	--cDNAfastq1 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.01.cDNAfastq1.fq.gz \
	--cDNAfastq2 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.01.cDNAfastq2.fq.gz \
	--oligofastq1 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.01.oligofastq1.fq.gz \
	--oligofastq2 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.01.oligofastq2.fq.gz \
	--genomeDir $STAR_INDEX_DIR/star_index_au.coerulea.QDv2.CycloneSeq.opt  \
	--name au.coerulea.QDv2.CycloneSeq.opt.202312batch.01 --threads 32

dnbc4tools rna run \
	--cDNAfastq1 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.02.cDNAfastq1.fq.gz \
	--cDNAfastq2 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.02.cDNAfastq2.fq.gz \
	--oligofastq1 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.02.oligofastq1.fq.gz \
	--oligofastq2 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.02.oligofastq2.fq.gz \
	--genomeDir $STAR_INDEX_DIR/star_index_au.coerulea.QDv2.CycloneSeq.opt  \
	--name au.coerulea.QDv2.CycloneSeq.opt.202312batch.02 --threads 32

dnbc4tools rna run \
	--cDNAfastq1 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.03.cDNAfastq1.fq.gz \
	--cDNAfastq2 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.03.cDNAfastq2.fq.gz \
	--oligofastq1 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.03.oligofastq1.fq.gz \
	--oligofastq2 $RAW_DATA_DIR/AU_DNBeLabC4/au.coerulea.202312batch.03.oligofastq2.fq.gz \
	--genomeDir $STAR_INDEX_DIR/star_index_au.coerulea.QDv2.CycloneSeq.opt  \
	--name au.coerulea.QDv2.CycloneSeq.opt.202312batch.03 --threads 32
echo "dnbc4tools run au.coerulea.QDv2.CycloneSeq.opt End"