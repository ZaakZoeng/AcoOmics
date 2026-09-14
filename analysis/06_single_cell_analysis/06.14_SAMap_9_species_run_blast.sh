#!/bin/bash
#SBATCH -D /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis
#SBATCH -o 06.11_SAMap_9_species_run_blast.%j.out
#SBATCH -p compute
#SBATCH -J 06.11_SAMap_9_species_run_blast
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32


# Spla-ClH23-HoH13-TrH2-TrH1-Auco-Clhe-Neve-Dare

# # 针对 Spla 和 ClH23
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 Spla 和 ClH23'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Spla.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='Spla'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/ClH23.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='ClH23'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# # 针对 Spla 和 HoH13
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 Spla 和 HoH13'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Spla.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='Spla'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/HoH13.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='HoH13'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# # 针对 Spla 和 TrH2
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 Spla 和 TrH2'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Spla.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='Spla'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/TrH2.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='TrH2'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# # 针对 Spla 和 TrH1
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 Spla 和 TrH1'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Spla.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='Spla'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/TrH1.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='TrH1'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# # 针对 Spla 和 Auco
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 Spla 和 Auco'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Spla.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='Spla'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Auco.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='Auco'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# # 针对 Spla 和 Clhe
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 Spla 和 Clhe'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Spla.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='Spla'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Clhe.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='Clhe'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# # 针对 Spla 和 Neve
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 Spla 和 Neve'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Spla.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='Spla'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Neve.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='Neve'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# 针对 Spla 和 Dare
# 定义输入文件和参数，运行 map_genes.sh 脚本
echo '针对 Spla 和 Dare'
echo job start time is $(date)
cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Spla.protein.fasta'
type1='prot'  # 'nucl' if file1 is a transcriptome
id1='Spla'      # n-character ID
file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Dare.protein.fasta'
type2='prot'  # 'prot' if file2 is a proteome
id2='Dare'      # n-character ID
bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
echo 'Finished'
echo job end time is $(date)

# # ##########################################################################################

# # 针对 ClH23 和 HoH13
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 ClH23 和 HoH13'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/ClH23.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='ClH23'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/HoH13.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='HoH13'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# # 针对 ClH23 和 TrH2
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 ClH23 和 TrH2'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/ClH23.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='ClH23'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/TrH2.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='TrH2'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# # 针对 ClH23 和 TrH1
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 ClH23 和 TrH1'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/ClH23.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='ClH23'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/TrH1.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='TrH1'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# # 针对 ClH23 和 Auco
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 ClH23 和 Auco'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/ClH23.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='ClH23'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Auco.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='Auco'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# # 针对 ClH23 和 Clhe
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 ClH23 和 Clhe'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/ClH23.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='ClH23'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Clhe.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='Clhe'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# # 针对 ClH23 和 Neve
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 ClH23 和 Neve'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/ClH23.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='ClH23'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Neve.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='Neve'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# 针对 ClH23 和 Dare
# 定义输入文件和参数，运行 map_genes.sh 脚本
echo '针对 ClH23 和 Dare'
echo job start time is $(date)
cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/ClH23.protein.fasta'
type1='prot'  # 'nucl' if file1 is a transcriptome
id1='ClH23'      # n-character ID
file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Dare.protein.fasta'
type2='prot'  # 'prot' if file2 is a proteome
id2='Dare'      # n-character ID
bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
echo 'Finished'
echo job end time is $(date)

# # ##########################################################################################

# # 针对 HoH13 和 TrH2
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 HoH13 和 TrH2'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/HoH13.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='HoH13'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/TrH2.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='TrH2'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# # 针对 HoH13 和 TrH1
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 HoH13 和 TrH1'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/HoH13.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='HoH13'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/TrH1.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='TrH1'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# # 针对 HoH13 和 Auco
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 HoH13 和 Auco'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/HoH13.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='HoH13'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Auco.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='Auco'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# # 针对 HoH13 和 Clhe
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 HoH13 和 Clhe'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/HoH13.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='HoH13'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Clhe.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='Clhe'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# # 针对 HoH13 和 Neve
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 HoH13 和 Neve'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/HoH13.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='HoH13'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Neve.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='Neve'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# 针对 HoH13 和 Dare
# 定义输入文件和参数，运行 map_genes.sh 脚本
echo '针对 HoH13 和 Dare'
echo job start time is $(date)
cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/HoH13.protein.fasta'
type1='prot'  # 'nucl' if file1 is a transcriptome
id1='HoH13'      # n-character ID
file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Dare.protein.fasta'
type2='prot'  # 'prot' if file2 is a proteome
id2='Dare'      # n-character ID
bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
echo 'Finished'
echo job end time is $(date)

# # ##########################################################################################

# # 针对 TrH2 和 TrH1
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 TrH2 和 TrH1'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/TrH2.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='TrH2'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/TrH1.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='TrH1'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# # 针对 TrH2 和 Auco
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 TrH2 和 Auco'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/TrH2.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='TrH2'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Auco.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='Auco'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# # 针对 TrH2 和 Clhe
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 TrH2 和 Clhe'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/TrH2.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='TrH2'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Clhe.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='Clhe'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# # 针对 TrH2 和 Neve
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 TrH2 和 Neve'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/TrH2.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='TrH2'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Neve.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='Neve'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# 针对 TrH2 和 Dare
# 定义输入文件和参数，运行 map_genes.sh 脚本
echo '针对 TrH2 和 Dare'
echo job start time is $(date)
cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/TrH2.protein.fasta'
type1='prot'  # 'nucl' if file1 is a transcriptome
id1='TrH2'      # n-character ID
file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Dare.protein.fasta'
type2='prot'  # 'prot' if file2 is a proteome
id2='Dare'      # n-character ID
bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
echo 'Finished'
echo job end time is $(date)

# # ##########################################################################################

# # 针对 TrH1 和 Auco
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 TrH1 和 Auco'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/TrH1.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='TrH1'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Auco.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='Auco'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# # 针对 TrH1 和 Clhe
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 TrH1 和 Clhe'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/TrH1.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='TrH1'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Clhe.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='Clhe'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# # 针对 TrH1 和 Neve
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 TrH1 和 Neve'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/TrH1.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='TrH1'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Neve.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='Neve'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# 针对 TrH1 和 Dare
# 定义输入文件和参数，运行 map_genes.sh 脚本
echo '针对 TrH1 和 Dare'
echo job start time is $(date)
cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/TrH1.protein.fasta'
type1='prot'  # 'nucl' if file1 is a transcriptome
id1='TrH1'      # n-character ID
file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Dare.protein.fasta'
type2='prot'  # 'prot' if file2 is a proteome
id2='Dare'      # n-character ID
bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
echo 'Finished'
echo job end time is $(date)

# # ##########################################################################################

# # 针对 Auco 和 Clhe
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 Auco 和 Clhe'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Auco.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='Auco'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Clhe.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='Clhe'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# # 针对 Auco 和 Neve
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 Auco 和 Neve'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Auco.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='Auco'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Neve.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='Neve'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# 针对 Auco 和 Dare
# 定义输入文件和参数，运行 map_genes.sh 脚本
echo '针对 Auco 和 Dare'
echo job start time is $(date)
cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Auco.protein.fasta'
type1='prot'  # 'nucl' if file1 is a transcriptome
id1='Auco'      # n-character ID
file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Dare.protein.fasta'
type2='prot'  # 'prot' if file2 is a proteome
id2='Dare'      # n-character ID
bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
echo 'Finished'
echo job end time is $(date)

# # ##########################################################################################

# # 针对 Clhe 和 Neve
# # 定义输入文件和参数，运行 map_genes.sh 脚本
# echo '针对 Clhe 和 Neve'
# echo job start time is $(date)
# cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
# file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Clhe.protein.fasta'
# type1='prot'  # 'nucl' if file1 is a transcriptome
# id1='Clhe'      # n-character ID
# file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Neve.protein.fasta'
# type2='prot'  # 'prot' if file2 is a proteome
# id2='Neve'      # n-character ID
# bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
# echo 'Finished'
# echo job end time is $(date)

# 针对 Clhe 和 Dare
# 定义输入文件和参数，运行 map_genes.sh 脚本
echo '针对 Clhe 和 Dare'
echo job start time is $(date)
cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Clhe.protein.fasta'
type1='prot'  # 'nucl' if file1 is a transcriptome
id1='Clhe'      # n-character ID
file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Dare.protein.fasta'
type2='prot'  # 'prot' if file2 is a proteome
id2='Dare'      # n-character ID
bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
echo 'Finished'
echo job end time is $(date)

# # ##########################################################################################

# 针对 Neve 和 Dare
# 定义输入文件和参数，运行 map_genes.sh 脚本
echo '针对 Neve 和 Dare'
echo job start time is $(date)
cd /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output
file1='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Neve.protein.fasta'
type1='prot'  # 'nucl' if file1 is a transcriptome
id1='Neve'      # n-character ID
file2='/share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/SAMap_input/transcriptomes/Dare.protein.fasta'
type2='prot'  # 'prot' if file2 is a proteome
id2='Dare'      # n-character ID
bash /share/home/zhangze/zz/NeuralOrigin/Data/06.SingleCellAnalysis/SAMap_9_species/map_genes.sh --tr1 $file1 --t1 $type1 --n1 $id1 --tr2 $file2 --t2 $type2 --n2 $id2
echo 'Finished'
echo job end time is $(date)

# # ##########################################################################################