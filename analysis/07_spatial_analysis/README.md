# 空间映射与细胞通讯

按当前文件名和编号阅读；参见 [流程说明](../../docs/workflow.md) 和 [代码索引](../../docs/code_index.md)。

| 文件 | 用途 | 内核 | 说明 |
| --- | --- | --- | --- |
| [07.01_Auco_scanpy_AucoSpatial_Python.ipynb](07.01_Auco_scanpy_AucoSpatial_Python.ipynb) | 空间数据预处理及 TACCO 注释迁移 | python | 保留当前正文和参数 |
| [07.02_Auco_seurat_analysis_AucoSpatial_R.ipynb](07.02_Auco_seurat_analysis_AucoSpatial_R.ipynb) | Seurat 分支（实际输入为单细胞矩阵） | R | 文件名含 Spatial，但实际读取 AU_scMatrix_CycloneSeq 单细胞矩阵，并写出其 analysis_results/Auco.seurat.rds；按待核实的单细胞分支阅读。 |
| [07.03_Scanpy_Auco_ST_Analysis_Python.ipynb](07.03_Scanpy_Auco_ST_Analysis_Python.ipynb) | TACCO 空间映射、绘图与下游输入导出 | python | 保留当前正文和参数 |
| [07.04_Scanpy_AureliaMarginST_MDIC3_Python.ipynb](07.04_Scanpy_AureliaMarginST_MDIC3_Python.ipynb) | 空间组织 GRNBoost2 / MDIC3 | python | 保留当前正文和参数 |
| [07.05_Scanpy_AureliaSC_MDIC3_Python.ipynb](07.05_Scanpy_AureliaSC_MDIC3_Python.ipynb) | 单细胞 GRNBoost2 / MDIC3 | python | 原 kernel 误标为 R，已依据 Python 正文修正元数据；代码保持原样。 |

对应结果图片见 [结果目录](../../results/07_spatial_analysis/README.md)；重要中间数据见 [数据说明](../../data.md)。
