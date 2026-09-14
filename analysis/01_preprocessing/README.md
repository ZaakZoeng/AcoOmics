# 原始与公共数据预处理

按当前文件名和编号阅读；参见 [流程说明](../../docs/workflow.md) 和 [代码索引](../../docs/code_index.md)。

| 文件 | 用途 | 内核 | 说明 |
| --- | --- | --- | --- |
| [01.01_get_Auco_CycloneSeq_fq.sh](01.01_get_Auco_CycloneSeq_fq.sh) | 解压 CycloneSeq FASTQ | bash | 当前仅处理 Auco；运行前创建 AU_CycloneSeq 输出目录。 |
| [01.02_merge_Auco_DNBeLabC4_fqgz.sh](01.02_merge_Auco_DNBeLabC4_fqgz.sh) | 合并 DNBeLab C4 测序批次 | bash | 保留当前正文和参数 |
| [01.03_process_Auco_raw_gff.sh](01.03_process_Auco_raw_gff.sh) | 补全原始 GFF gene/exon 特征 | bash | 保留当前正文和参数 |
| [01.04_processing_2024NematostellaVectensis.ipynb](01.04_processing_2024NematostellaVectensis.ipynb) | 整理 Nematostella vectensis 数据 | python | 保留当前正文和参数 |
| [01.05_processing_2021Clytia.ipynb](01.05_processing_2021Clytia.ipynb) | 整理 Clytia 数据与细胞元数据 | python | 保留当前正文和参数 |
| [01.06_processing_2023Placozoa.ipynb](01.06_processing_2023Placozoa.ipynb) | 整理四种扁盘动物数据 | python | 输入 sc_Tadh/sc_TrH2/sc_Hhon/sc_HoiH23.h5ad 来自公共数据转换；相关八个前处理 notebooks 已收入 support/Data/01.RawData/PublicData/2023Placozoa。 |
| [01.07_processing_2021Sponges.ipynb](01.07_processing_2021Sponges.ipynb) | 整理 Spongilla 数据 | python | 保留当前正文和参数 |
| [01.08_processing_2018Zebrafish.ipynb](01.08_processing_2018Zebrafish.ipynb) | 整理斑马鱼数据与基因名 | python | 保留当前正文和参数 |
