# 基因组注释与蛋白序列

按当前文件名和编号阅读；参见 [流程说明](../../docs/workflow.md) 和 [代码索引](../../docs/code_index.md)。

| 文件 | 用途 | 内核 | 说明 |
| --- | --- | --- | --- |
| [02.01_generate_or_optimize_gff.sh](02.01_generate_or_optimize_gff.sh) | 检查并消解优化 GFF3 中的重复条目 | bash | 保留当前正文和参数 |
| [02.02_rename_annotation_gff3.sh](02.02_rename_annotation_gff3.sh) | 重命名注释中的基因标识 | bash | 保留当前正文和参数 |
| [02.03_gffread_to_get_protein_fasta.sh](02.03_gffread_to_get_protein_fasta.sh) | 用 gffread 提取蛋白序列 | bash | 保留当前正文和参数 |
| [02.04_rename_protein_fasta.sh](02.04_rename_protein_fasta.sh) | 统一九物种蛋白标识 | bash | 保留当前正文和参数 |
| [02.05_unique_protein_fasta.sh](02.05_unique_protein_fasta.sh) | 去重蛋白标识 | bash | 保留当前正文和参数 |
| [02.06_get_protein_ids.sh](02.06_get_protein_ids.sh) | 导出蛋白 ID 列表 | bash | 保留当前正文和参数 |
