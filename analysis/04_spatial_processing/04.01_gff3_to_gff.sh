#!/bin/bash
#SBATCH -D /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/
#SBATCH -o 04.01_gff3_to_gff.%j.out
#SBATCH -p big
#SBATCH -J 04.01_gff3_to_gff
#SBATCH --nodes=1 
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32


# 第一步：获取 SAW-ST-V8 流程所需要的注释信息，先进行 gff3 转换为 gff
# 第二步：需要手动替换 # 为 _，注意 five_prime_UTR 和 three_prime_UTR


awk '
BEGIN{FS=OFS="\t"}
{
    if($0 ~ /^#/){print; next}
    
    # 移除字段中的潜在换行符（特别是$9）
    gsub(/\r/, "", $9)
    gsub(/\n/, "", $9)

    split($9, a, / *; */)
    id=""
    name_exists=0
    for(i in a){
        if(a[i] ~ /^ID=/){
            id_val = a[i]
            sub(/^ID=/, "", id_val)
            id = id_val
        }
        if(a[i] ~ /^Name=/) name_exists=1
    }

    if($3=="gene" || $3=="mRNA"){
        if($9 !~ /;$/) $9 = $9 ";"
        print
    } else {
        if(!name_exists && id!=""){
            if($9 !~ /;$/) $9 = $9 ";"
            $9 = $9 "Name=" id ";"
        }
        print
    }
}
' /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ReferenceGenome_processed/AU_ReferenceGenome/au.coerulea.QDv2.CycloneSeq.opt.renamed.gff3 \
> /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ReferenceGenome_processed/AU_ReferenceGenome/au.coerulea.QDv2.CycloneSeq.opt.renamed.SAW.gff


# # au.aurita.Gold.optimized.gff3
# awk '
# BEGIN{FS=OFS="\t"}
# {
#     if($0 ~ /^#/){print; next}
#     split($9, a, ";");
#     id="";
#     name_exists=0;
#     for(i in a){
#         if(a[i] ~ /^ID=/) id=substr(a[i],4);
#         if(a[i] ~ /^Name=/) name_exists=1;
#     }
#     # gene和mRNA保持原状
#     if($3=="gene" || $3=="mRNA"){
#         # 若没有分号结尾就加上
#         if($9 !~ /;$/) $9 = $9 ";"
#         print;
#     } else {
#         # 其他类型，若没有Name属性则加上
#         if(!name_exists && id!=""){
#             if($9 !~ /;$/) $9 = $9 ";"
#             $9 = $9 "Name=" id ";"
#         }
#         print;
#     }
# }
# ' /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ReferenceGenome_processed/AU_ReferenceGenome/au.aurita.Gold.optimized.gff3 \
# > /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ReferenceGenome_processed/AU_ReferenceGenome/au.aurita.Gold.optimized.SAW.gff


# # au.coerulea.QD.optimized.gff3
# awk '
# BEGIN{FS=OFS="\t"}
# {
#     if($0 ~ /^#/){print; next}
#     split($9, a, ";");
#     id="";
#     name_exists=0;
#     for(i in a){
#         if(a[i] ~ /^ID=/) id=substr(a[i],4);
#         if(a[i] ~ /^Name=/) name_exists=1;
#     }
#     # gene和mRNA保持原状
#     if($3=="gene" || $3=="mRNA"){
#         # 若没有分号结尾就加上
#         if($9 !~ /;$/) $9 = $9 ";"
#         print;
#     } else {
#         # 其他类型，若没有Name属性则加上
#         if(!name_exists && id!=""){
#             if($9 !~ /;$/) $9 = $9 ";"
#             $9 = $9 "Name=" id ";"
#         }
#         print;
#     }
# }
# ' /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ReferenceGenome_processed/AU_ReferenceGenome/au.coerulea.QD.optimized.gff3 \
# > /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ReferenceGenome_processed/AU_ReferenceGenome/au.coerulea.QD.optimized.SAW.gff


# # au.coerulea.QDv2.optimized.gff3
# awk '
# BEGIN{FS=OFS="\t"}
# {
#     if($0 ~ /^#/){print; next}
#     split($9, a, ";");
#     id="";
#     name_exists=0;
#     for(i in a){
#         if(a[i] ~ /^ID=/) id=substr(a[i],4);
#         if(a[i] ~ /^Name=/) name_exists=1;
#     }
#     # gene和mRNA保持原状
#     if($3=="gene" || $3=="mRNA"){
#         # 若没有分号结尾就加上
#         if($9 !~ /;$/) $9 = $9 ";"
#         print;
#     } else {
#         # 其他类型，若没有Name属性则加上
#         if(!name_exists && id!=""){
#             if($9 !~ /;$/) $9 = $9 ";"
#             $9 = $9 "Name=" id ";"
#         }
#         print;
#     }
# }
# ' /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ReferenceGenome_processed/AU_ReferenceGenome/au.coerulea.QDv2.optimized.gff3 \
# > /share/home/zhangze/zz/NeuralOrigin/Data/02.GenomicProcessing/ReferenceGenome_processed/AU_ReferenceGenome/au.coerulea.QDv2.optimized.SAW.gff
