# 单细胞数据处理

按当前文件名和编号阅读；参见 [流程说明](../../docs/workflow.md) 和 [代码索引](../../docs/code_index.md)。

| 文件 | 用途 | 内核 | 说明 |
| --- | --- | --- | --- |
| [03.01_dnbc4tools_mkref.sh](03.01_dnbc4tools_mkref.sh) | 构建 dnbc4tools 参考索引 | bash | 用户版本启用了多个 Auco 参考方案。连续 mkdir/cd 会沿当前目录嵌套；请核对与 03.02 的索引目录是否一致，正文保持用户版本。 |
| [03.02_dnbc4tools_run.sh](03.02_dnbc4tools_run.sh) | 运行 dnbc4tools 单细胞处理 | bash | 用户版本启用了多个 Auco 比对方案。连续 mkdir/cd 的工作目录需逐段核对，正文与参数保持用户版本。 |
| [03.03_Auco_seurat_analysis_R.ipynb](03.03_Auco_seurat_analysis_R.ipynb) | Auco CycloneSeq 参考方案的 Seurat 质控、聚类和标记基因分析 | R | 保留当前正文和参数 |
| [03.04_Auco_rds_to_h5_R.ipynb](03.04_Auco_rds_to_h5_R.ipynb) | Seurat RDS 转 H5 与元数据 | R | 当前文件名含 Auco，正文仍包含 Auco/Trad 转换小节；按实际数据选择小节，未按新文件名删除代码。 |
| [03.05_Auco_h5_to_h5ad_Python.ipynb](03.05_Auco_h5_to_h5ad_Python.ipynb) | H5 与元数据转 AnnData | python | 当前文件名含 Auco，正文仍包含 Auco/Trad 转换小节；按实际数据选择小节，未按新文件名删除代码。 |
| [03.06_sc_public_umap_Python.ipynb](03.06_sc_public_umap_Python.ipynb) | 公共物种 UMAP 检查与绘图 | python | 保留当前正文和参数 |

对应结果图片见 [结果目录](../../results/03_single_cell_processing/README.md)；重要中间数据见 [数据说明](../../data.md)。
