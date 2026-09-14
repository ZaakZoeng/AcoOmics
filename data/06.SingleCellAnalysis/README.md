# 06 · 细胞注释、跨物种整合与神经功能

保存细胞类型注释、OG 表达矩阵、整合对象、SAMap 映射结果、神经功能和 DNB 中间数据。

[数据总览](../data.md) · [分析代码](../../analysis/)

## 当前收录情况

九物种 OG h5ad、RDS 与 Matrix Market 交接文件均已收录；RPCA 对象及 AnnData 交付版本已保留。SAMap 当前仅有分数表和可视化：三物种九个文件、九物种三个文件。

核查日期：2026-09-14。以下路径相对于本目录；说明依据当前文件清单和已有文档，不代表已完成数值复现。本轮仅补充汇总说明。

## 数据文件与目录

| 数据文件或数据目录 | 说明 |
| --- | --- |
| [eggNOG_ClusterProfiler_GO](eggNOG_ClusterProfiler_GO) | Auco 聚类富集及跨步骤共享注释库；包含 eggNOG 注释、GO 本体、TERM2GENE/TERM2NAME、DEGs 与富集表。 |
| [eggNOG_ClusterProfiler_GO/term2gene_GO.tsv](eggNOG_ClusterProfiler_GO/term2gene_GO.tsv) | GO term 到基因的映射，供 clusterProfiler 等富集步骤构建基因集。 |
| [eggNOG_ClusterProfiler_GO/term2name_GO.tsv](eggNOG_ClusterProfiler_GO/term2name_GO.tsv) | GO term 到完整名称的映射；05.11、06 阶段富集与 09.01 表格整理共享使用。 |
| [eggNOG_ClusterProfiler_GO/AllClusters_allGenes_Wilcox.csv](eggNOG_ClusterProfiler_GO/AllClusters_allGenes_Wilcox.csv) | Auco 各聚类的基因差异检验汇总，06.01 生成/使用。 |
| [SingleCellAnnotation/Auco.normalized.annotated.h5ad](SingleCellAnnotation/Auco.normalized.annotated.h5ad) | 06.04 标注后的 Auco AnnData；细胞类型字段用于 OG 映射、跨物种比较与 TACCO 参考。 |
| [SingleCellAnnotation/Auco.metadata.csv](SingleCellAnnotation/Auco.metadata.csv) | Auco 注释后的细胞元数据导出，便于单独读取细胞类型与样本属性。 |
| [SingleCellAnnotation/Auco_UMAP_with_labels.csv](SingleCellAnnotation/Auco_UMAP_with_labels.csv) | 带细胞标签的 Auco UMAP 坐标，用于图谱绘制与外部展示。 |
| [scOrthoGeneH5ad](scOrthoGeneH5ad) | 九物种 OG.normalized.h5ad 及 OG 基因列表；06.05 从物种基因表达映射到 OG 特征空间，供整合和模型输入。 |
| [scOrthoGeneRDS/mtx_obs_var_umap](scOrthoGeneRDS/mtx_obs_var_umap) | 06.06 导出的 Matrix Market、细胞/特征元数据及 UMAP，用于 Python→R 交接。 |
| [scOrthoGeneRDS](scOrthoGeneRDS) | 06.07 生成的各物种 OG.normalized.rds，供 06.08/06.09 整合及神经功能分析。 |
| [SingleCellIntegrated/Seurat_RPCA/integrated_rpca.rds](SingleCellIntegrated/Seurat_RPCA/integrated_rpca.rds) | 已收录的跨物种 RPCA 整合 Seurat 对象；是整合表达、元数据及降维结果的重要中间对象。 |
| [SingleCellIntegrated/Seurat_RPCA](SingleCellIntegrated/Seurat_RPCA) | 整合对象及 metadata.csv、PCA/UMAP 坐标导出。 |
| [SingleCellIntegrated/Seurat_RPCA_to_Scanpy](SingleCellIntegrated/Seurat_RPCA_to_Scanpy) | 整合数据的 H5、元数据、PCA/UMAP、普通/压缩 h5ad、基因列表与 sc_BasalMetazoaDataset.tar.gz；子目录还提供读取 notebook 和压缩 h5ad。归档包与展开目录为不同交付形式。 |
| [SingleCellIntegrated/Seurat_RPCA_to_Scanpy/sc_BasalMetazoa.normalized.h5ad](SingleCellIntegrated/Seurat_RPCA_to_Scanpy/sc_BasalMetazoa.normalized.h5ad) | 跨物种整合图谱的 AnnData 版本；另有 gzip 版本，使用时按当前代码实际文件名选择。 |
| [SAMap_Clhe_Auco_TrH1/SAMap_output](SAMap_Clhe_Auco_TrH1/SAMap_output) | 当前有 9 个文件，包含 mapping_score_D/MappingTable、Annotated 版本及 Sankey/chord HTML；未收录 BLAST maps 或 SAMap pickle 对象。 |
| [SAMap_9_species/SAMap_output](SAMap_9_species/SAMap_output) | 当前仅有 Annotated_9species_mapping_score_D.csv、Annotated_9species_mapping_score_MappingTable.csv 和 Annotated_sankey_plot_9species.html；未收录 BLAST maps 或保存模型。 |
| [NeuronEmergence/Step1_base_markers](NeuronEmergence/Step1_base_markers) | 06.16 逐物种的基础差异基因/marker 计算结果。 |
| [NeuronEmergence/Step2_group_gene_lists](NeuronEmergence/Step2_group_gene_lists) | 按动物门类整理的基因集合及 Group_gene_counts.csv。 |
| [NeuronEmergence/Step3_gene_function](NeuronEmergence/Step3_gene_function) | 神经相关 OG 的功能分析及各物种富集表，包含带 minpct/logfc 参数名的结果。 |
| [NeuronEmergence/Step4_GO_cross_species](NeuronEmergence/Step4_GO_cross_species) | 跨物种 GO 比较及相关矩阵/图形输出。 |
| [NeuronEmergence/AllSpecies_GOenrich_summary.csv](NeuronEmergence/AllSpecies_GOenrich_summary.csv) | 多物种 GO 富集汇总；另有 noNPC 分支版本，二者不自动合并。 |
| [DNB_analysis/neural_working.rds](DNB_analysis/neural_working.rds) | DNB 神经相关工作对象，06.17 模块分析的中间数据。 |
| [DNB_analysis/a_phylum_DNB_compute_results.rds](DNB_analysis/a_phylum_DNB_compute_results.rds) | 按门类计算的 DNB 结果对象，保留模块/评分等结构化结果。 |
| [DNB_analysis/b_phylum_DNB_filtered_obj.rds](DNB_analysis/b_phylum_DNB_filtered_obj.rds) | 过滤后的 DNB 对象，供模块筛选、可视化及核心网络分析。 |
| [DNB_analysis/DNB_OGs_List_Final.txt](DNB_analysis/DNB_OGs_List_Final.txt) | DNB 候选 OG 汇总列表；与 DNB_enrich 中的同名副本应按实际读取路径区别使用。 |
| [DNB_analysis/DNB_enrich](DNB_analysis/DNB_enrich) | 06.18/06.19 的 DNB OG→基因映射、功能注释及 GO/KEGG 富集表；含 DNB_OGs_genes.txt 和 enrichment results.csv。 |
| [SingleCellAnnotation/Auco.gene_mapped.csv](SingleCellAnnotation/Auco.gene_mapped.csv) | Auco 基因映射表，字段为 gene_ids、uniprot_id、uniprot_genes；记录基因与 UniProt 标识/基因名称关系，不是细胞元数据。 |
| [eggNOG_ClusterProfiler_GO/cluster_GO_results](eggNOG_ClusterProfiler_GO/cluster_GO_results) | 逐聚类的 GO 富集 CSV 与 dotplot；结果表和图片不一定一一齐全。 |
| [eggNOG_ClusterProfiler_GO/cluster_KEGG_results](eggNOG_ClusterProfiler_GO/cluster_KEGG_results) | 逐聚类的 KEGG 富集 CSV 与 dotplot。 |
| [eggNOG_ClusterProfiler_GO/cluster_GSEA_results](eggNOG_ClusterProfiler_GO/cluster_GSEA_results) | 逐聚类的 GSEA 富集 CSV 与 dotplot。 |
| [NeuronEmergence/Terms_lib](NeuronEmergence/Terms_lib) | 九物种各自的 term2gene_GO.tsv 和 term2name_GO.tsv，共 18 个 GO 映射文件。 |
| [NeuronEmergence/ZZ_results](NeuronEmergence/ZZ_results) | 逐物种神经相关基因的 GO/KEGG 富集表和部分图形；与 Step3_gene_function 的筛选结果分开保留。 |
| [NeuronEmergence/ZZ_results_KEGG_cross_species](NeuronEmergence/ZZ_results_KEGG_cross_species) | 当前收录 CrossSpecies_KEGG_Conserved_Bubble.pdf，即跨物种 KEGG 比较图。 |
| [SingleCellIntegrated/BroadType_species_df.csv](SingleCellIntegrated/BroadType_species_df.csv) | 整合图谱按 BroadType、Species 汇总的 CellCount 细胞数量表。 |
| [DNB_analysis/Placozoa_DNB_Hub_OGs_Frequency_Stats.csv](DNB_analysis/Placozoa_DNB_Hub_OGs_Frequency_Stats.csv) | 扁盘动物 DNB 候选核心 OG 的频次统计，辅助候选模块/基因筛选。 |

## 上下游关系

03 标准化表达与 05 OG/功能映射构成主要输入；Auco 注释可作为 07 空间迁移参考，OG 对象和候选集进入 08/09。不同表达对象的 counts、normalized 与 OG 汇总含义应按生成代码区分。

## 尚未收录与使用说明

SAMap_input、BLAST maps 和保存的 SAMap pickle 不在当前目录，已有分数表不代表可以直接从头运行。富集 CSV 与图形可能不成对；noNPC 与其他分支、普通/压缩 h5ad 不自动合并。
