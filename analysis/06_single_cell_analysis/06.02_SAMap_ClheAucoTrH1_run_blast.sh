#!/bin/bash
#SBATCH -D /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis
#SBATCH -o 06.02.SAMap_ClheAucoTrH1_run_blast.%j.out
#SBATCH -p big
#SBATCH -J 06.02.SAMap_ClheAucoTrH1_run_blast
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32


# 针对 Clhe 和 Auco
# 定义输入文件和参数，运行 map_genes.sh 脚本
echo '针对 Clhe 和 Auco'
echo job start time is $(date)

cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_Clhe_Auco_TrH1/SAMap_output

file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_Clhe_Auco_TrH1/SAMap_input/transcriptomes/Clhe.protein.fasta'
type1='prot'  # 'nucl' if file1 is a transcriptome
id1='Clhe'      # 4-character ID

file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_Clhe_Auco_TrH1/SAMap_input/transcriptomes/Auco.protein.fasta'
type2='prot'  # 'prot' if file2 is a proteome
id2='Auco'      # 4-character ID

bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_Clhe_Auco_TrH1/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2

echo 'Finished'
echo job end time is $(date)



# 针对 Clhe 和 TrH1
# 定义输入文件和参数，运行 map_genes.sh 脚本
echo '针对 Clhe 和 TrH1'
echo job start time is $(date)

cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_Clhe_Auco_TrH1/SAMap_output

file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_Clhe_Auco_TrH1/SAMap_input/transcriptomes/Clhe.protein.fasta'
type1='prot'  # 'nucl' if file1 is a transcriptome
id1='Clhe'      # 4-character ID

file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_Clhe_Auco_TrH1/SAMap_input/transcriptomes/TrH1.protein.fasta'
type2='prot'  # 'prot' if file2 is a proteome
id2='TrH1'      # 4-character ID

bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_Clhe_Auco_TrH1/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2

echo 'Finished'
echo job end time is $(date)



# 针对 Auco 和 TrH1
# 定义输入文件和参数，运行 map_genes.sh 脚本
echo '针对 Auco 和 TrH1'
echo job start time is $(date)

cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_Clhe_Auco_TrH1/SAMap_output

file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_Clhe_Auco_TrH1/SAMap_input/transcriptomes/Auco.protein.fasta'
type1='prot'  # 'nucl' if file1 is a transcriptome
id1='Auco'      # 4-character ID

file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_Clhe_Auco_TrH1/SAMap_input/transcriptomes/TrH1.protein.fasta'
type2='prot'  # 'prot' if file2 is a proteome
id2='TrH1'      # 4-character ID

bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_Clhe_Auco_TrH1/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2

echo 'Finished'
echo job end time is $(date)