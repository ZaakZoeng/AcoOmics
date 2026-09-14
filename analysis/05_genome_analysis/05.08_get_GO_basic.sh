#!/bin/bash
#SBATCH -D /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/
#SBATCH -o 05.08_get_GO_basic.%j.out
#SBATCH -p big
#SBATCH -J 05.08_get_GO_basic
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=32


# 获取GO的注释信息,GO注释库构建
# wget http://purl.obolibrary.org/obo/go/go-basic.obo
cd /share/home/zhangze/zz/NeuralOrigin/Data/05.GenomeAnalysis/GO_and_KEGG
grep "^id:" go-basic.obo |awk '{print $2}' > GO.id
grep "^name:" go-basic.obo |awk '{print $2}' > GO.name 
grep "^namespace:" go-basic.obo |awk '{print $2}' > GO.class
paste GO.id GO.name GO.class -d "\t" > GO.library