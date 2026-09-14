#!/bin/bash
#SBATCH -D /share/home/zhangze/zz/NeuralOrigin/Data/01.RawData/
#SBATCH -o 01.03_process_raw_gff.%j.out
#SBATCH -p big
#SBATCH -J 01.03_process_raw_gff
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32


# 水母原始的gff无法进行DNBC4tools比对，需要进行预处理
# 处理QD（AureliaCoerulea_new_with_gff）水母的gff，复制得到gene和exon
# awk 'BEGIN{OFS="\t"} 
#      $3 == "mRNA" {
#         # 提取 mRNA ID（去除最后分号）
#         match($9, /ID=([^;]+)/, arr);
#         transcript_id = arr[1];
#         gene_id = "gene_" transcript_id;

#         # 输出 gene 注释
#         print $1, "GLEAN", "gene", $4, $5, ".", $7, ".", "ID="gene_id";";

#         # 输出修正过的 mRNA 注释（加 Parent）
#         print $1, $2, "mRNA", $4, $5, $6, $7, $8, "ID="transcript_id";Parent="gene_id";";
#         next;
#      }

#      $3 == "CDS" {
#         # 提取 parent ID
#         split($9, a, "=");
#         parent_id = arr[1];

#         # 输出 exon 注释
#         print $1, "GLEAN", "exon", $4, $5, ".", $7, ".", "Parent=" parent_id";";

#         # 输出原始 CDS 行
#         print $0;
#         next;
#      }

#      { print }' \
#      /share/home/zhangze/zz/NeuralOrigin/Data/01.RawData/ReferenceGenome/AureliaCoerulea_new_with_gff/A.gene.gff \
#      > /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ReferenceGenome_processed/AU_ReferenceGenome/au.coerulea.QD.gff


# 处理QDv2（AcoGenome）水母的gff，复制得到gene和exon
awk 'BEGIN{OFS="\t"} 
     $3 == "mRNA" {
        # 提取 mRNA ID（去除最后分号）
        match($9, /ID=([^;]+)/, arr);
        transcript_id = arr[1];
        gene_id = "gene_" transcript_id;

        # 输出 gene 注释
        print $1, "GLEAN", "gene", $4, $5, ".", $7, ".", "ID="gene_id";";

        # 输出修正过的 mRNA 注释（加 Parent）
        print $1, $2, "mRNA", $4, $5, $6, $7, $8, "ID="transcript_id";Parent="gene_id";";
        next;
     }

     $3 == "CDS" {
        # 提取 parent ID
        match($9, /Parent=([^;]+)/, arr);
        parent_id = arr[1];

        # 输出 exon 注释
        print $1, "GLEAN", "exon", $4, $5, ".", $7, ".", "Parent=" parent_id";";

        # 输出原始 CDS 行
        print $0;
        next;
     }

     { print }' \
     /share/home/zhangze/zz/NeuralOrigin/Data/01.RawData/ReferenceGenome/AcoGenome/chr_coerulea.gff \
     > /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ReferenceGenome_processed/AU_ReferenceGenome/au.coerulea.QDv2.gff
