#!/bin/bash
#SBATCH -D /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/
#SBATCH -o 02.04_rename_protein_fasta.%j.out
#SBATCH -p big
#SBATCH -J 02.04_rename_protein_fasta
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32

echo "Begin"
# 针对斑马鱼Dare，需要renam，然后下一步unique
sed -E 's/^(>[^ ]*).*/\1/' \
     /share/home/zhangze/zz/NeuralOrigin/Data/01.RawData/PublicData/2018Zebrafish/ncbi_dataset/ncbi_dataset/data/GCF_000002035.6/protein.faa \
     > /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence/Dare.renamed.protein.fasta

# 针对海葵Neve，不需要rename，直接下一步unique

# 针对半球美螅水母Clhe
sed 's/^\(>[^.]*\)\..*/\1/' \
     /share/home/zhangze/zz/NeuralOrigin/Data/01.RawData/PublicData/2021Clytia/20201030_cdhit_95.fasta.transdecoder.pep \
     > /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence/Clhe.renamed.protein.fasta


# 针对水母Auco，获取>ProteinID@GeneName
awk 'BEGIN {FS="\t"} 
     NR==FNR && $3 == "gene" {split($9, a, ";"); for (i in a) if (a[i] ~ /ID=/) gene_id=substr(a[i],4); if (a[2] ~ /Name=/) gene_name=substr(a[2],6); gene_map[gene_id] = gene_name; next} 
     NR==FNR && $3 == "mRNA" {split($9, a, ";"); for (i in a) if (a[i] ~ /ID=/) mrna_id=substr(a[i],4); for (i in a) if (a[i] ~ /Parent=/) parent_gene=substr(a[i],8); mrna_map[mrna_id] = parent_gene; next}
     FNR==NR {next} 
     {if ($1 ~ /^>/) { 
          split($1, b, "|"); 
          mrna_id = substr(b[1], 2); 
          new_id = mrna_id "@" gene_map[mrna_map[mrna_id]]; 
          print ">" new_id; 
     } else { 
          print; 
     }}' \
    /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ReferenceGenome_processed/AU_ReferenceGenome/au.coerulea.QDv2.CycloneSeq.opt.renamed.gff3 \
    /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence/Auco.raw.protein.fasta \
    > /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence/Auco.protein.genename.fasta
# 仅保留>GeneName
sed 's/.*@\([^ ]*\)/>\1/' /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence/Auco.protein.genename.fasta \
    > /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence/Auco.renamed.protein.fasta


# 针对丝盘虫Trad，获取>ProteinID@GeneName
awk 'BEGIN {FS="\t"} 
     NR==FNR && $3 == "gene" {split($9, a, ";"); for (i in a) if (a[i] ~ /ID=/) gene_id=substr(a[i],4); if (a[2] ~ /Name=/) gene_name=substr(a[2],6); gene_map[gene_id] = gene_name; next} 
     NR==FNR && $3 == "mRNA" {split($9, a, ";"); for (i in a) if (a[i] ~ /ID=/) mrna_id=substr(a[i],4); for (i in a) if (a[i] ~ /Parent=/) parent_gene=substr(a[i],8); mrna_map[mrna_id] = parent_gene; next}
     FNR==NR {next} 
     {if ($1 ~ /^>/) { 
          split($1, b, "|"); 
          mrna_id = substr(b[1], 2); 
          new_id = mrna_id "@" gene_map[mrna_map[mrna_id]]; 
          print ">" new_id; 
     } else { 
          print; 
     }}' \
    /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ReferenceGenome_processed/TR_ReferenceGenome/tr.adhaerens.JGI.optimized.gff3 \
    /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence/Trad.raw.protein.fasta \
    > /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence/Trad.protein.genename.fasta
# 仅保留>GeneName
sed 's/.*@\([^ ]*\)/>\1/' /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence/Trad.protein.genename.fasta \
    > /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ProteinSequence/Trad.renamed.protein.fasta


# 针对丝盘虫TrH1（Tadh），不需要rename，直接下一步unique

# 针对丝盘虫TrH2，不需要rename，直接下一步unique

# 针对丝盘虫HoH13，不需要rename，直接下一步unique

# 针对丝盘虫ClH23，不需要rename，直接下一步unique

# 针对海绵Spla，不需要rename，直接下一步unique

echo "finished"

