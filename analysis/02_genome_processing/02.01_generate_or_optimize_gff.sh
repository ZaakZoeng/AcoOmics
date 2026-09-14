#!/bin/bash
#SBATCH -D /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/
#SBATCH -o 02.01_generate_or_optimize_gff.%j.out
#SBATCH -p big
#SBATCH -J 02.01_generate_or_optimize_gff
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32


# 输入 /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ReferenceGenome_processed/AU_ReferenceGenome/au.coerulea.QDv2.gff
# 输出 /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ReferenceGenome_processed/AU_ReferenceGenome/au.coerulea.QDv2.CycloneSeq.opt.gff3

source ~/anaconda3/bin/activate
conda activate zhangze

WORKDIR="/share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ReferenceGenome"
INPUT="/share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ReferenceGenome/Aco.CycloneSeq.opt.gff3"

cd "$WORKDIR"

# 1.检查初始的 gff3 文件
gffread "$INPUT" -E 2> Aco.CycloneSeq.opt.gff3.gffread_check.log

# 2.统计完全重复的行
awk 'a[$0]++>=1' "$INPUT" > Aco.CycloneSeq.opt.duplicates.gff3

# 3.统计起止位置、ID完全相同的行
awk -F'\t' '
$3=="gene" && match($9, /ID=([^;]+)/, id) {
    key = $1"\t"$4"\t"$5"\t"id[1]
    count[key]++
    if(count[key]>1) print $0
}
' "$INPUT" > Aco.CycloneSeq.opt.repeated_gene_entries.gff3

# 4.对优化后的gff3进行去重、重编号等unique操作
# 遇到重复 gene ID 时，
# 如果区间完全一样就整块删除，
#   其中，优先保留 transdecoder 来源的 block，
#   如果有 transdecoder 就只保留这块，
#   没有再保留其它来源中的第一个。
# 否则就为重复 gene 及其所有下游 feature 重新编号
python ./resolve_optimized_gff3.py

# 5.检查处理后的 gff3 文件
gffread Aco.CycloneSeq.optimized.gff3 -E 2> Aco.CycloneSeq.optimized.gff3.gffread_check.log
