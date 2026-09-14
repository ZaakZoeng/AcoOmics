#!/bin/bash
#SBATCH -D /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/
#SBATCH -o 05.05_CAFE5_specific_analysis.%j.out
#SBATCH -p big
#SBATCH -J 05.05_CAFE5_specific_analysis
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32


# 激活环境
source ~/anaconda3/bin/activate
conda activate of3_env

# 显著扩张/收缩的基因家族在每个节点的收缩与扩增数目
# cat Gamma_family_results.txt |grep "y"|cut -f 1 > p0.05.significant
# grep -f p0.05.significant Gamma_change.tab > Gamma_p0.05change.tab
cat /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output/Gamma_family_results.txt \
|grep "y"|cut -f 1 \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output/Gamma_Significant_families.txt

grep -f /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output/Gamma_Significant_families.txt \
/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output/Gamma_change.tab \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output/Gamma_p0.05change.tab



# 节点<11>##############################################################################################
# Step1. 找到自己想提取的节点<11>，扩张(>= 1)和收缩（< 0）基因提取【非Significant】
# 扩张
awk '$12 >= 1 {print $1}' /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output/Gamma_change.tab \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node11.expand
# 收缩
awk '$12 < 0 {print $1}' /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output/Gamma_change.tab \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node11.contract

# Step2. 找到自己想提取的节点<11>，扩张(>= 1)和收缩（< 0）基因提取
# 扩张
awk '$12 >= 1 {print $1}' /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output/Gamma_p0.05change.tab \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node11significant.expand
# 收缩
awk '$12 < 0 {print $1}' /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output/Gamma_p0.05change.tab \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node11significant.contract

# Step3. 提取节点<11>基因ID
# 事先复制Orthogroups.txt：/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/OrthoFinder_Inference/OrthoFinder_input/OrthoFinder/Results_Jul21/Orthogroups/Orthogroups.txt
# 扩张
grep -w -f /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node11significant.expand \
/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_input/Orthogroups.txt \
| sed 's/ /\n/g' \
| grep -v '^OG' \
| sort | uniq \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node11significant.expand.genes.txt
# 收缩
grep -w -f /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node11significant.contract \
/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_input/Orthogroups.txt \
| sed 's/ /\n/g' \
| grep -v '^OG' \
| sort | uniq \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node11significant.contract.genes.txt

# Step 4：获取背景基因集合
# 获取 node11 存在拷贝数的基因家族
awk 'NR>1 && $12 > 0 {print $1}' \
/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output/Gamma_count.tab \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node11.orthogroups
# 提取家族内所有基因
grep -w -f /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node11.orthogroups \
/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_input/Orthogroups.txt \
| sed 's/ /\n/g' \
| grep -v '^OG' \
| sort | uniq \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node11.genes.txt




# 节点<12>##############################################################################################
# Step1. 找到自己想提取的节点<12>，扩张(>= 1)和收缩（< 0）基因提取【非Significant】
# 扩张
awk '$13 >= 1 {print $1}' /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output/Gamma_change.tab \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node12.expand
# 收缩
awk '$13 < 0 {print $1}' /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output/Gamma_change.tab \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node12.contract

# Step2. 找到自己想提取的节点<12>，扩张(>= 1)和收缩（< 0）基因提取
# 扩张
awk '$13 >= 1 {print $1}' /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output/Gamma_p0.05change.tab \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node12significant.expand
# 收缩
awk '$13 < 0 {print $1}' /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output/Gamma_p0.05change.tab \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node12significant.contract

# Step3. 提取节点<12>基因ID
# 事先复制Orthogroups.txt：/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/OrthoFinder_Inference/OrthoFinder_input/OrthoFinder/Results_Jul21/Orthogroups/Orthogroups.txt
# 扩张
grep -w -f /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node12significant.expand \
/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_input/Orthogroups.txt \
| sed 's/ /\n/g' \
| grep -v '^OG' \
| sort | uniq \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node12significant.expand.genes.txt
# 收缩
grep -w -f /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node12significant.contract \
/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_input/Orthogroups.txt \
| sed 's/ /\n/g' \
| grep -v '^OG' \
| sort | uniq \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node12significant.contract.genes.txt

# Step 4：获取背景基因集合
# 获取 node12 存在拷贝数的基因家族
awk 'NR>1 && $13 > 0 {print $1}' \
/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output/Gamma_count.tab \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node12.orthogroups
# 提取家族内所有基因
grep -w -f /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node12.orthogroups \
/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_input/Orthogroups.txt \
| sed 's/ /\n/g' \
| grep -v '^OG' \
| sort | uniq \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node12.genes.txt




# 节点<15>##############################################################################################
# Step1. 找到自己想提取的节点<15>，扩张(>= 1)和收缩（< 0）基因提取【非Significant】
# 扩张
awk '$16 >= 1 {print $1}' /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output/Gamma_change.tab \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node15.expand
# 收缩
awk '$16 < 0 {print $1}' /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output/Gamma_change.tab \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node15.contract

# Step2. 找到自己想提取的节点<15>，扩张(>= 1)和收缩（< 0）基因提取
# 扩张
awk '$16 >= 1 {print $1}' /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output/Gamma_p0.05change.tab \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node15significant.expand
# 收缩
awk '$16 < 0 {print $1}' /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output/Gamma_p0.05change.tab \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node15significant.contract

# Step3. 提取节点<15>基因ID
# 事先复制Orthogroups.txt：/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/OrthoFinder_Inference/OrthoFinder_input/OrthoFinder/Results_Jul21/Orthogroups/Orthogroups.txt
# 扩张
grep -w -f /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node15significant.expand \
/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_input/Orthogroups.txt \
| sed 's/ /\n/g' \
| grep -v '^OG' \
| sort | uniq \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node15significant.expand.genes.txt
# 收缩
grep -w -f /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node15significant.contract \
/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_input/Orthogroups.txt \
| sed 's/ /\n/g' \
| grep -v '^OG' \
| sort | uniq \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node15significant.contract.genes.txt

# Step 4：获取背景基因集合
# 获取 node15 存在拷贝数的基因家族
awk 'NR>1 && $16 > 0 {print $1}' \
/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output/Gamma_count.tab \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node15.orthogroups
# 提取家族内所有基因
grep -w -f /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node15.orthogroups \
/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_input/Orthogroups.txt \
| sed 's/ /\n/g' \
| grep -v '^OG' \
| sort | uniq \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node15.genes.txt


#########################################################################
# 联合分析：取节点12显著扩张基因和节点15显著收缩的基因作为目标基因
#########################################################################
# 取节点12显著扩张OG和节点15显著收缩OG交集
sort /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node12significant.expand \
| uniq > /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node12significant.expand.sorted

sort /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node15significant.contract \
| uniq > /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node15significant.contract.sorted

comm -12 /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node12significant.expand.sorted \
/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node15significant.contract.sorted \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/nodeCommon_12_15_significant.intersect

# 获取OG交集对应的基因
grep -w -f /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/nodeCommon_12_15_significant.intersect \
/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_input/Orthogroups.txt \
| sed 's/ /\n/g' \
| grep -v '^OG' \
| sort | uniq \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/nodeCommon_12_15_significant.intersect.genes.txt

# 取节点12存在拷贝数和节点15存在拷贝数的OG并集
cat /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node12.orthogroups \
/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/node15.orthogroups \
| sort | uniq > /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/nodeCommon_12_15.orthogroups

# 获取OG并集对应的基因
grep -w -f /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/nodeCommon_12_15.orthogroups \
/share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_input/Orthogroups.txt \
| sed 's/ /\n/g' \
| grep -v '^OG' \
| sort | uniq \
> /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/Nodes_analysis/nodeCommon_12_15.genes.txt


conda deactivate