#!/bin/bash
#SBATCH -D /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/
#SBATCH -o 05.02.OrthoFinder_analysis.%j.out
#SBATCH -p big
#SBATCH -J 05.02.OrthoFinder_analysis
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32


# 修改 PATH，优先调用 diamond 2.0.15
diamond_dir=/share/home/zhangze/zz/Software/diamond
export PATH=$diamond_dir:$PATH

# 激活环境
source ~/anaconda3/bin/activate
# conda activate orthofinder_env
conda activate of3_env

# 测试数据
# orthofinder -f /share/home/zhangze/zz/Software/OrthoFinder/ExampleData

# 8个真实数据：Neve-Clhe-Auco-TrH1-TrH2-HoH13-ClH23-Spla
orthofinder -f /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/OrthoFinder_Inference/OrthoFinder_input

# 遇到的问题1：22630 Blank
# Auco.prot.fasta的第22630行序列缺失id，手动删除
# >
# MVVKTVVAMIEMVATSVVFTREMVVKTVVFTREMVVKTVVAVREMVVKVVVFTREMVVKMVVFTREMVVK
# TVVAVREMVVKVVVFTREMVVKMVVFTREMVVKTVVFMREMVVKTVVAMIEMLARSVVFTREMVVKTVVF
# TREMVVKTVVAMIEMVATSVVFTREMVVKTVVAMIEMLARSVVFTREMVVKTVVFTREIVVKTVVFTREM
# VVKTVVFTREMVVKTVVAMREMVAKRGSFCRLRGRSMMFRPI
# 
# 遇到的问题2：Error reading input stream at line 83913: Invalid character (.) in sequence
# Auco.prot.fasta部分氨基酸序列存在非法字符，手动修改，将.替换为X
# >gene-evm.model.ptg000017l.1588#NAL4F-MOUSE#Q66X05
# MKFSSRYAWMLQDFLGVCFCCSLIKLIKLPNLKVSALLLMSLLVYDIFFVFITPLFSARGKSVMVEVATE
# K.TNRKLPRINTSWK.Q.TRRRS.TRRDKAAITTRYNQ.PKL
# >gene-evm.model.ptg000010l.216-1#RHG12-HUMAN#Q8IWW6
# MSTRQVLQGGCSMGTRTNWTSHT.ACKSSGRSECASKTSKHLSRN.IIRRPANQNKESSEKRSSEVYPFA
# SLRTSLAQRTAKYLETCCSPVCKSIAS.R.SKEIVCYEWRTEKDTRNQSGPWIEHSRVHQYYQ.FISRRN
# RQVL

conda deactivate