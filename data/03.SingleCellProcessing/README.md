# 03 · 单细胞处理、矩阵与标准化对象

保存 Auco 三批次的处理报告、过滤矩阵、Seurat 中间对象及多物种标准化 AnnData。

[数据总览](../data.md) · [分析代码](../../analysis/)

## 当前收录情况

三套参考方案各有三个 HTML 报告，共九份。Auco 的三个 filter_matrix 均包含矩阵、条码和特征文件；保留 Auco.seurat.rds。标准化目录有 10 个 h5ad 及对应基因列表，包含 Trad。

核查日期：2026-09-14。以下路径相对于本目录；说明依据当前文件清单和已有文档，不代表已完成数值复现。本轮仅补充汇总说明。

## 数据文件与目录

| 数据文件或数据目录 | 说明 |
| --- | --- |
| [scMatrix](scMatrix) | 当前只保留 AU_scMatrix_CycloneSeq 分支；包含三个过滤矩阵、H5、元数据、降维坐标和分析图表。 |
| [scMatrix/AU_scMatrix_CycloneSeq](scMatrix/AU_scMatrix_CycloneSeq) | 三个批次 01/02/03 的 filter_matrix 均含 barcodes.tsv.gz、features.tsv.gz 和 matrix.mtx.gz；供 Read10X 使用，另有 sc_Auco.matrix.raw.h5 和细胞元数据/降维坐标。 |
| [scMatrix/AU_scMatrix_CycloneSeq/analysis_results/Auco.seurat.rds](scMatrix/AU_scMatrix_CycloneSeq/analysis_results/Auco.seurat.rds) | 当前 03.03 输出的 Auco Seurat 对象；用于 03.04 格式转换及 06.01 差异基因/GO 分析，是关键中间对象。 |
| [SingleCellDataH5ad_processed](SingleCellDataH5ad_processed) | 当前标准化表达目录（旧路径名为 SingleCellDataH5ad），有 10 个 normalized.h5ad 和对应 genes.txt：九物种主集合及 Trad。 |
| [SingleCellDataH5ad_processed/Auco.normalized.h5ad](SingleCellDataH5ad_processed/Auco.normalized.h5ad) | Auco 标准化 AnnData；与 06.SingleCellAnalysis/SingleCellAnnotation 中的细胞类型注释版本区分使用。 |
| [DNBeLabC4_Reports](DNBeLabC4_Reports) | 三套注释方案 QD_gff、QD_gff_refined、YT_gff_refined 各三个批次的 scRNA_report.html，共 9 份报告。报告用于比较比对/质控结果，不等同于表达矩阵。 |
| [scMatrix/AU_scMatrix_CycloneSeq/sc_Auco.matrix.raw.h5](scMatrix/AU_scMatrix_CycloneSeq/sc_Auco.matrix.raw.h5) | Auco 的 H5 格式表达矩阵导出，配套 sc_Auco.metadata.csv 及 PCA/tSNE/UMAP 坐标。文件名标记为 raw，使用时仍应核对内部矩阵与生成步骤。 |
| [scMatrix/AU_scMatrix_CycloneSeq/analysis_results](scMatrix/AU_scMatrix_CycloneSeq/analysis_results) | 当前有 Auco.seurat.rds、质控/聚类/marker 图表、颜色 CSV 和交互 marker 表。10.marker.dt_files 与 lib 是 HTML 配套资源，不是新的分析数据集。 |

## 上下游关系

Auco 过滤矩阵进入 Seurat 分析；H5/细胞元数据可用于格式转换。标准化 h5ad 与 Seurat 对象供 06 注释、OG 映射、整合与功能分析。

## 尚未收录与使用说明

参考索引和完整比对输出未在此阶段收录。SingleCellDataH5ad_processed 是当前目录名，与旧代码的 SingleCellDataH5ad 路径不同。HTML 表的 lib 与 *_files 是显示依赖，不能当作分析数据集。
