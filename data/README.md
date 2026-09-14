# 当前仓库的重要数据与中间结果

本说明依据 `Github/AcoOmics/data/` 的实际文件及其 README 更新。**表中路径均相对于仓库根目录 `Github/AcoOmics/`，使用小写 `data/`；不是原项目的大写 `Data/` 路径。** 当前仓库已收录部分数据与中间结果，但原始测序/参考序列等仍有未收录项。

继续采用“数据文件或数据目录｜说明”的两列格式。核查日期：2026-09-14。正文列出现有路径，最后单独列出关键缺失项；文件存在不等于已验证数值正确或完整复现流程。本轮核对文件清单、目录 README 及代表性表头，未加载大型模型、重新计算分析或修改数据。

原始数据 README 中的“当前本地文件”和大小可能描述原项目数据位置，不代表文件已收录到本仓库。下文以实际目录为准，下载/论文资源沿用各目录 README 的记录，本轮未联网验证。

## 按阶段浏览

| 阶段 | 汇总说明 |
| --- | --- |
| 01.RawData | [原始测序与公共数据](01.RawData/README.md) |
| 02.GenomicProcessing | [基因组结构注释与蛋白序列](02.GenomicProcessing/README.md) |
| 03.SingleCellProcessing | [单细胞处理、矩阵与标准化对象](03.SingleCellProcessing/README.md) |
| 04.SpatialTranscriptomicsProcessing | [空间转录组预处理](04.SpatialTranscriptomicsProcessing/README.md) |
| 05.GenomeAnalysis | [比较基因组、家族演化与功能注释](05.GenomeAnalysis/README.md) |
| 06.SingleCellAnalysis | [细胞注释、跨物种整合与神经功能](06.SingleCellAnalysis/README.md) |
| 07.SpatialTranscriptomicsAnalysis | [空间注释、OG 对象与细胞通讯](07.SpatialTranscriptomicsAnalysis/README.md) |
| 08.HubGenes | [核心基因与候选 OG 汇总](08.HubGenes/README.md) |
| 09.AI | [ESM2 与 TranscriptFormer 模型数据](09.AI/README.md) |

## 01 原始数据与公共数据

| 数据文件或数据目录 | 说明 |
| --- | --- |
| [data/01.RawData/CycloneSeqData](../data/01.RawData/CycloneSeqData) | 目前仅收录 README，记载 Auco 长读长样本、原始文件名和 CNSA 获取线索；未收录 FASTQ。README 中的本地文件大小是记录信息，不表示这些文件已放入当前仓库。 |
| [data/01.RawData/DNBeLabC4Data](../data/01.RawData/DNBeLabC4Data) | 目前仅收录 README，说明三个 Auco 单核样本、cDNA/oligo 文库与文件对应；未收录 FASTQ。 |
| [data/01.RawData/StereoSeqData](../data/01.RawData/StereoSeqData) | 目前仅收录 README，说明 D06050D2 空间测序样本；未收录空间原始测序文件。 |
| [data/01.RawData/AcoGenome](../data/01.RawData/AcoGenome) | 目前仅有 README，记载 QD/QDv2 与 YT/Yantai 两套基因组及注释优化方法。其文中列出的 FASTA/FNA 当前并未收录；不能仅凭 README 表格判断序列已存在。 |
| [data/01.RawData/PublicData](../data/01.RawData/PublicData) | 目前仅有 README，汇总公共物种及论文资源；没有各物种原始表达矩阵或公共参考序列子目录。 |

## 02 基因组注释与蛋白序列中间数据

| 数据文件或数据目录 | 说明 |
| --- | --- |
| [data/02.GenomicProcessing/ProteinSequence_processed](../data/02.GenomicProcessing/ProteinSequence_processed) | 当前有 10 份蛋白 FASTA 和 10 份 ID 列表，包括九物种主分析集合及 Trad；用于同源基因、功能注释和序列比较，不能把 Trad 与 TrH1 自动合并。 |
| [data/02.GenomicProcessing/AcoProteinAnnotation_processed](../data/02.GenomicProcessing/AcoProteinAnnotation_processed) | 保存基因组结构注释 GFF/GFF3（不是蛋白 FASTA 或 eggNOG 功能表）；包含四个注释文件及说明。目录 README 指出优化文件与历史同名用途文件并非简单重命名关系。 |
| [data/02.GenomicProcessing/AcoProteinAnnotation_processed/au.coerulea.QDv2.raw.gff](../data/02.GenomicProcessing/AcoProteinAnnotation_processed/au.coerulea.QDv2.raw.gff) | QD/QDv2 基线结构注释，用于注释比较；raw 不表示完全未做格式预处理。 |
| [data/02.GenomicProcessing/AcoProteinAnnotation_processed/au.coerulea.QDv2.optimized_for_dnbc4tools.gff3](../data/02.GenomicProcessing/AcoProteinAnnotation_processed/au.coerulea.QDv2.optimized_for_dnbc4tools.gff3) | QD/QDv2 优化注释的 dnbc4tools 适配版本；建索引时需配套 QDv2 FASTA，后者当前未收录。 |
| [data/02.GenomicProcessing/AcoProteinAnnotation_processed/au.coerulea.QDv2.optimized_for_SAW-ST-V8.gff](../data/02.GenomicProcessing/AcoProteinAnnotation_processed/au.coerulea.QDv2.optimized_for_SAW-ST-V8.gff) | QD/QDv2 优化注释的 SAW-ST-V8 适配版本，与 dnbc4tools 版属性格式不同，不能假定可互换。 |
| [data/02.GenomicProcessing/AcoProteinAnnotation_processed/au.coerulea.Yantai.generated.gff3](../data/02.GenomicProcessing/AcoProteinAnnotation_processed/au.coerulea.Yantai.generated.gff3) | Yantai 组装的生成注释；需配套 Yantai 参考序列，其与最终 YT_gff_refined 的版本关系需参考生成记录。 |

## 03 单细胞矩阵、对象与元数据

| 数据文件或数据目录 | 说明 |
| --- | --- |
| [data/03.SingleCellProcessing/scMatrix](../data/03.SingleCellProcessing/scMatrix) | 当前只保留 AU_scMatrix_CycloneSeq 分支；包含三个过滤矩阵、H5、元数据、降维坐标和分析图表。 |
| [data/03.SingleCellProcessing/scMatrix/AU_scMatrix_CycloneSeq](../data/03.SingleCellProcessing/scMatrix/AU_scMatrix_CycloneSeq) | 三个批次 01/02/03 的 filter_matrix 均含 barcodes.tsv.gz、features.tsv.gz 和 matrix.mtx.gz；供 Read10X 使用，另有 sc_Auco.matrix.raw.h5 和细胞元数据/降维坐标。 |
| [data/03.SingleCellProcessing/scMatrix/AU_scMatrix_CycloneSeq/analysis_results/Auco.seurat.rds](../data/03.SingleCellProcessing/scMatrix/AU_scMatrix_CycloneSeq/analysis_results/Auco.seurat.rds) | 当前 03.03 输出的 Auco Seurat 对象；用于 03.04 格式转换及 06.01 差异基因/GO 分析，是关键中间对象。 |
| [data/03.SingleCellProcessing/SingleCellDataH5ad_processed](../data/03.SingleCellProcessing/SingleCellDataH5ad_processed) | 当前标准化表达目录（旧路径名为 SingleCellDataH5ad），有 10 个 normalized.h5ad 和对应 genes.txt：九物种主集合及 Trad。 |
| [data/03.SingleCellProcessing/SingleCellDataH5ad_processed/Auco.normalized.h5ad](../data/03.SingleCellProcessing/SingleCellDataH5ad_processed/Auco.normalized.h5ad) | Auco 标准化 AnnData；与 06.SingleCellAnalysis/SingleCellAnnotation 中的细胞类型注释版本区分使用。 |
| [data/03.SingleCellProcessing/DNBeLabC4_Reports](../data/03.SingleCellProcessing/DNBeLabC4_Reports) | 三套注释方案 QD_gff、QD_gff_refined、YT_gff_refined 各三个批次的 scRNA_report.html，共 9 份报告。报告用于比较比对/质控结果，不等同于表达矩阵。 |
| [data/03.SingleCellProcessing/scMatrix/AU_scMatrix_CycloneSeq/sc_Auco.matrix.raw.h5](../data/03.SingleCellProcessing/scMatrix/AU_scMatrix_CycloneSeq/sc_Auco.matrix.raw.h5) | Auco 的 H5 格式表达矩阵导出，配套 sc_Auco.metadata.csv 及 PCA/tSNE/UMAP 坐标。文件名标记为 raw，使用时仍应核对内部矩阵与生成步骤。 |
| [data/03.SingleCellProcessing/scMatrix/AU_scMatrix_CycloneSeq/analysis_results](../data/03.SingleCellProcessing/scMatrix/AU_scMatrix_CycloneSeq/analysis_results) | 当前有 Auco.seurat.rds、质控/聚类/marker 图表、颜色 CSV 和交互 marker 表。10.marker.dt_files 与 lib 是 HTML 配套资源，不是新的分析数据集。 |

## 04 空间转录组预处理数据

| 数据文件或数据目录 | 说明 |
| --- | --- |
| [data/04.SpatialTranscriptomicsProcessing/README](../data/04.SpatialTranscriptomicsProcessing/README) | SAW-ST-V8-checkGTF、makeRef 和 SAW 处理步骤的原始记录；未给出完整可执行命令与全部参数。 |
| [data/04.SpatialTranscriptomicsProcessing/D2_bin50.h5ad](../data/04.SpatialTranscriptomicsProcessing/D2_bin50.h5ad) | D2 bin50 空间表达对象，07.01/07.03 使用的输入之一。 |
| [data/04.SpatialTranscriptomicsProcessing/D06050D2.bin50_1.0.h5ad](../data/04.SpatialTranscriptomicsProcessing/D06050D2.bin50_1.0.h5ad) | D06050D2 的另一平台/处理版本空间对象；07.03 中有读取，不能按名称推断与 D2_bin50.h5ad 相同。 |

## 05 同源基因、基因家族演化与富集

| 数据文件或数据目录 | 说明 |
| --- | --- |
| [data/05.GenomeAnalysis/eggNOG_FunctionalAnnotation/eggNOG_output_processed](../data/05.GenomeAnalysis/eggNOG_FunctionalAnnotation/eggNOG_output_processed) | 各物种整理后的 eggNOG 注释表；05.06 合并这些注释。 |
| [data/05.GenomeAnalysis/eggNOG_FunctionalAnnotation/eggNOG_output_processed/all_species.emapper.annotations](../data/05.GenomeAnalysis/eggNOG_FunctionalAnnotation/eggNOG_output_processed/all_species.emapper.annotations) | 跨物种合并功能注释；节点家族与 DNB 基因的功能映射参考。 |
| [data/05.GenomeAnalysis/OrthoFinder_Inference/OrthoFinder_output/Step1_QualityControl](../data/05.GenomeAnalysis/OrthoFinder_Inference/OrthoFinder_output/Step1_QualityControl) | 当前包含 SpeciesTree_rooted.txt、Statistics_PerSpecies.tsv、Statistics_Overall.tsv，即物种树和同源推断基础统计。 |
| [data/05.GenomeAnalysis/OrthoFinder_Inference/OrthoFinder_output/Step2_InterpretingResults](../data/05.GenomeAnalysis/OrthoFinder_Inference/OrthoFinder_output/Step2_InterpretingResults) | 当前包含 Orthogroups.tsv、SpeciesTree_Gene_Duplications_0.5_Support.txt 和 OG0001111 示例基因树，分别记录 OG 成员、复制事件和示例树。 |
| [data/05.GenomeAnalysis/OrthoFinder_Inference/OrthoFinder_output/Step3_OrthogroupsGeneCount/Orthogroups.GeneCount.tsv](../data/05.GenomeAnalysis/OrthoFinder_Inference/OrthoFinder_output/Step3_OrthogroupsGeneCount/Orthogroups.GeneCount.tsv) | OG × 物种的基因数量表；用于家族共享/特异性统计、UpSet 和 CAFE 输入准备。 |
| [data/05.GenomeAnalysis/OrthoFinder_Inference/OrthoFinder_output/Step4_SpeciesOrthogroup](../data/05.GenomeAnalysis/OrthoFinder_Inference/OrthoFinder_output/Step4_SpeciesOrthogroup) | 九物种 protein_to_orthogroup.csv；06.05 将单细胞基因标识映射为 OG 的关键字典。 |
| [data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output](../data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output) | CAFE5 总输出：包括 Gamma_count.tab、Gamma_change.tab、显著家族、祖先状态树与报告。 |
| [data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output/Gamma_p0.05change.tab](../data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_output/Gamma_p0.05change.tab) | 显著变化家族表，供节点扩张/收缩筛选；文件名反映已有筛选版本。 |
| [data/05.GenomeAnalysis/CAFE_ExpansionsContractions/target_nodes_analysis](../data/05.GenomeAnalysis/CAFE_ExpansionsContractions/target_nodes_analysis) | 当前仅保留 zz_results 下节点 11、12、15、Common_12_15 的 GO/KEGG 富集表和 dotplot；没有把原项目全部节点筛选中间文件搬入此目录。 |
| [data/05.GenomeAnalysis/CAFE_ExpansionsContractions/target_nodes_analysis/zz_results/nodeCommon_12_15_enrichment_GO_results.csv](../data/05.GenomeAnalysis/CAFE_ExpansionsContractions/target_nodes_analysis/zz_results/nodeCommon_12_15_enrichment_GO_results.csv) | 节点 12/15 共同集合的 GO 富集表，09.01 及候选核心基因汇总使用。 |
| [data/05.GenomeAnalysis/GO_and_KEGG](../data/05.GenomeAnalysis/GO_and_KEGG) | GO OBO、KEGG JSON 和派生映射库；数据库版本与名称解析方式影响富集注释。 |
| [data/05.GenomeAnalysis/Dendroscope_Tree/LifemapSpeciesTree.txt](../data/05.GenomeAnalysis/Dendroscope_Tree/LifemapSpeciesTree.txt) | 用于系统发育背景展示的物种树文本，与 CAFE 输入树需分开解释。 |
| [data/05.GenomeAnalysis/CAFE_ExpansionsContractions/cafeplotter_res](../data/05.GenomeAnalysis/CAFE_ExpansionsContractions/cafeplotter_res) | CAFE 可视化汇总：result_summary.tsv、summary_all_gene_family.png，以及 gene_family 下 581 张家族图。 |
| [data/05.GenomeAnalysis/OrthoFinder_Inference/OrthoFinder_output/Step2_InterpretingResults/Orthogroups.tsv](../data/05.GenomeAnalysis/OrthoFinder_Inference/OrthoFinder_output/Step2_InterpretingResults/Orthogroups.tsv) | 当前收录的 OG 成员表，是 OG 到各物种成员基因/蛋白关系的重要数据。 |

## 06 细胞注释、跨物种整合与神经相关中间结果

| 数据文件或数据目录 | 说明 |
| --- | --- |
| [data/06.SingleCellAnalysis/eggNOG_ClusterProfiler_GO](../data/06.SingleCellAnalysis/eggNOG_ClusterProfiler_GO) | Auco 聚类富集及跨步骤共享注释库；包含 eggNOG 注释、GO 本体、TERM2GENE/TERM2NAME、DEGs 与富集表。 |
| [data/06.SingleCellAnalysis/eggNOG_ClusterProfiler_GO/term2gene_GO.tsv](../data/06.SingleCellAnalysis/eggNOG_ClusterProfiler_GO/term2gene_GO.tsv) | GO term 到基因的映射，供 clusterProfiler 等富集步骤构建基因集。 |
| [data/06.SingleCellAnalysis/eggNOG_ClusterProfiler_GO/term2name_GO.tsv](../data/06.SingleCellAnalysis/eggNOG_ClusterProfiler_GO/term2name_GO.tsv) | GO term 到完整名称的映射；05.11、06 阶段富集与 09.01 表格整理共享使用。 |
| [data/06.SingleCellAnalysis/eggNOG_ClusterProfiler_GO/AllClusters_allGenes_Wilcox.csv](../data/06.SingleCellAnalysis/eggNOG_ClusterProfiler_GO/AllClusters_allGenes_Wilcox.csv) | Auco 各聚类的基因差异检验汇总，06.01 生成/使用。 |
| [data/06.SingleCellAnalysis/SingleCellAnnotation/Auco.normalized.annotated.h5ad](../data/06.SingleCellAnalysis/SingleCellAnnotation/Auco.normalized.annotated.h5ad) | 06.04 标注后的 Auco AnnData；细胞类型字段用于 OG 映射、跨物种比较与 TACCO 参考。 |
| [data/06.SingleCellAnalysis/SingleCellAnnotation/Auco.metadata.csv](../data/06.SingleCellAnalysis/SingleCellAnnotation/Auco.metadata.csv) | Auco 注释后的细胞元数据导出，便于单独读取细胞类型与样本属性。 |
| [data/06.SingleCellAnalysis/SingleCellAnnotation/Auco_UMAP_with_labels.csv](../data/06.SingleCellAnalysis/SingleCellAnnotation/Auco_UMAP_with_labels.csv) | 带细胞标签的 Auco UMAP 坐标，用于图谱绘制与外部展示。 |
| [data/06.SingleCellAnalysis/scOrthoGeneH5ad](../data/06.SingleCellAnalysis/scOrthoGeneH5ad) | 九物种 OG.normalized.h5ad 及 OG 基因列表；06.05 从物种基因表达映射到 OG 特征空间，供整合和模型输入。 |
| [data/06.SingleCellAnalysis/scOrthoGeneRDS/mtx_obs_var_umap](../data/06.SingleCellAnalysis/scOrthoGeneRDS/mtx_obs_var_umap) | 06.06 导出的 Matrix Market、细胞/特征元数据及 UMAP，用于 Python→R 交接。 |
| [data/06.SingleCellAnalysis/scOrthoGeneRDS](../data/06.SingleCellAnalysis/scOrthoGeneRDS) | 06.07 生成的各物种 OG.normalized.rds，供 06.08/06.09 整合及神经功能分析。 |
| [data/06.SingleCellAnalysis/SingleCellIntegrated/Seurat_RPCA/integrated_rpca.rds](../data/06.SingleCellAnalysis/SingleCellIntegrated/Seurat_RPCA/integrated_rpca.rds) | 已收录的跨物种 RPCA 整合 Seurat 对象；是整合表达、元数据及降维结果的重要中间对象。 |
| [data/06.SingleCellAnalysis/SingleCellIntegrated/Seurat_RPCA](../data/06.SingleCellAnalysis/SingleCellIntegrated/Seurat_RPCA) | 整合对象及 metadata.csv、PCA/UMAP 坐标导出。 |
| [data/06.SingleCellAnalysis/SingleCellIntegrated/Seurat_RPCA_to_Scanpy](../data/06.SingleCellAnalysis/SingleCellIntegrated/Seurat_RPCA_to_Scanpy) | 整合数据的 H5、元数据、PCA/UMAP、普通/压缩 h5ad、基因列表与 sc_BasalMetazoaDataset.tar.gz；子目录还提供读取 notebook 和压缩 h5ad。归档包与展开目录为不同交付形式。 |
| [data/06.SingleCellAnalysis/SingleCellIntegrated/Seurat_RPCA_to_Scanpy/sc_BasalMetazoa.normalized.h5ad](../data/06.SingleCellAnalysis/SingleCellIntegrated/Seurat_RPCA_to_Scanpy/sc_BasalMetazoa.normalized.h5ad) | 跨物种整合图谱的 AnnData 版本；另有 gzip 版本，使用时按当前代码实际文件名选择。 |
| [data/06.SingleCellAnalysis/SAMap_Clhe_Auco_TrH1/SAMap_output](../data/06.SingleCellAnalysis/SAMap_Clhe_Auco_TrH1/SAMap_output) | 当前有 9 个文件，包含 mapping_score_D/MappingTable、Annotated 版本及 Sankey/chord HTML；未收录 BLAST maps 或 SAMap pickle 对象。 |
| [data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output](../data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output) | 当前仅有 Annotated_9species_mapping_score_D.csv、Annotated_9species_mapping_score_MappingTable.csv 和 Annotated_sankey_plot_9species.html；未收录 BLAST maps 或保存模型。 |
| [data/06.SingleCellAnalysis/NeuronEmergence/Step1_base_markers](../data/06.SingleCellAnalysis/NeuronEmergence/Step1_base_markers) | 06.16 逐物种的基础差异基因/marker 计算结果。 |
| [data/06.SingleCellAnalysis/NeuronEmergence/Step2_group_gene_lists](../data/06.SingleCellAnalysis/NeuronEmergence/Step2_group_gene_lists) | 按动物门类整理的基因集合及 Group_gene_counts.csv。 |
| [data/06.SingleCellAnalysis/NeuronEmergence/Step3_gene_function](../data/06.SingleCellAnalysis/NeuronEmergence/Step3_gene_function) | 神经相关 OG 的功能分析及各物种富集表，包含带 minpct/logfc 参数名的结果。 |
| [data/06.SingleCellAnalysis/NeuronEmergence/Step4_GO_cross_species](../data/06.SingleCellAnalysis/NeuronEmergence/Step4_GO_cross_species) | 跨物种 GO 比较及相关矩阵/图形输出。 |
| [data/06.SingleCellAnalysis/NeuronEmergence/AllSpecies_GOenrich_summary.csv](../data/06.SingleCellAnalysis/NeuronEmergence/AllSpecies_GOenrich_summary.csv) | 多物种 GO 富集汇总；另有 noNPC 分支版本，二者不自动合并。 |
| [data/06.SingleCellAnalysis/DNB_analysis/neural_working.rds](../data/06.SingleCellAnalysis/DNB_analysis/neural_working.rds) | DNB 神经相关工作对象，06.17 模块分析的中间数据。 |
| [data/06.SingleCellAnalysis/DNB_analysis/a_phylum_DNB_compute_results.rds](../data/06.SingleCellAnalysis/DNB_analysis/a_phylum_DNB_compute_results.rds) | 按门类计算的 DNB 结果对象，保留模块/评分等结构化结果。 |
| [data/06.SingleCellAnalysis/DNB_analysis/b_phylum_DNB_filtered_obj.rds](../data/06.SingleCellAnalysis/DNB_analysis/b_phylum_DNB_filtered_obj.rds) | 过滤后的 DNB 对象，供模块筛选、可视化及核心网络分析。 |
| [data/06.SingleCellAnalysis/DNB_analysis/DNB_OGs_List_Final.txt](../data/06.SingleCellAnalysis/DNB_analysis/DNB_OGs_List_Final.txt) | DNB 候选 OG 汇总列表；与 DNB_enrich 中的同名副本应按实际读取路径区别使用。 |
| [data/06.SingleCellAnalysis/DNB_analysis/DNB_enrich](../data/06.SingleCellAnalysis/DNB_analysis/DNB_enrich) | 06.18/06.19 的 DNB OG→基因映射、功能注释及 GO/KEGG 富集表；含 DNB_OGs_genes.txt 和 enrichment results.csv。 |
| [data/06.SingleCellAnalysis/SingleCellAnnotation/Auco.gene_mapped.csv](../data/06.SingleCellAnalysis/SingleCellAnnotation/Auco.gene_mapped.csv) | Auco 基因映射表，字段为 gene_ids、uniprot_id、uniprot_genes；记录基因与 UniProt 标识/基因名称关系，不是细胞元数据。 |
| [data/06.SingleCellAnalysis/eggNOG_ClusterProfiler_GO/cluster_GO_results](../data/06.SingleCellAnalysis/eggNOG_ClusterProfiler_GO/cluster_GO_results) | 逐聚类的 GO 富集 CSV 与 dotplot；结果表和图片不一定一一齐全。 |
| [data/06.SingleCellAnalysis/eggNOG_ClusterProfiler_GO/cluster_KEGG_results](../data/06.SingleCellAnalysis/eggNOG_ClusterProfiler_GO/cluster_KEGG_results) | 逐聚类的 KEGG 富集 CSV 与 dotplot。 |
| [data/06.SingleCellAnalysis/eggNOG_ClusterProfiler_GO/cluster_GSEA_results](../data/06.SingleCellAnalysis/eggNOG_ClusterProfiler_GO/cluster_GSEA_results) | 逐聚类的 GSEA 富集 CSV 与 dotplot。 |
| [data/06.SingleCellAnalysis/NeuronEmergence/Terms_lib](../data/06.SingleCellAnalysis/NeuronEmergence/Terms_lib) | 九物种各自的 term2gene_GO.tsv 和 term2name_GO.tsv，共 18 个 GO 映射文件。 |
| [data/06.SingleCellAnalysis/NeuronEmergence/ZZ_results](../data/06.SingleCellAnalysis/NeuronEmergence/ZZ_results) | 逐物种神经相关基因的 GO/KEGG 富集表和部分图形；与 Step3_gene_function 的筛选结果分开保留。 |
| [data/06.SingleCellAnalysis/NeuronEmergence/ZZ_results_KEGG_cross_species](../data/06.SingleCellAnalysis/NeuronEmergence/ZZ_results_KEGG_cross_species) | 当前收录 CrossSpecies_KEGG_Conserved_Bubble.pdf，即跨物种 KEGG 比较图。 |
| [data/06.SingleCellAnalysis/SingleCellIntegrated/BroadType_species_df.csv](../data/06.SingleCellAnalysis/SingleCellIntegrated/BroadType_species_df.csv) | 整合图谱按 BroadType、Species 汇总的 CellCount 细胞数量表。 |
| [data/06.SingleCellAnalysis/DNB_analysis/Placozoa_DNB_Hub_OGs_Frequency_Stats.csv](../data/06.SingleCellAnalysis/DNB_analysis/Placozoa_DNB_Hub_OGs_Frequency_Stats.csv) | 扁盘动物 DNB 候选核心 OG 的频次统计，辅助候选模块/基因筛选。 |

## 07 空间注释、单细胞/空间 OG 对象与通讯

| 数据文件或数据目录 | 说明 |
| --- | --- |
| [data/07.SpatialTranscriptomicsAnalysis/ST_annotated/Tacco_Auco_D2/D2_mapped.h5ad](../data/07.SpatialTranscriptomicsAnalysis/ST_annotated/Tacco_Auco_D2/D2_mapped.h5ad) | D2 经 TACCO 细胞类型迁移后的空间对象，保留预测/注释结果。 |
| [data/07.SpatialTranscriptomicsAnalysis/ST_annotated/Tacco_Auco_D2](../data/07.SpatialTranscriptomicsAnalysis/ST_annotated/Tacco_Auco_D2) | D2 注释输出，含 D2_pred_Broad_cell_type.csv、D2_pred_Sub_cell_type.csv 及相关图像。 |
| [data/07.SpatialTranscriptomicsAnalysis/auco_sc_st/Auco.bin50.OGs.normalized.h5ad](../data/07.SpatialTranscriptomicsAnalysis/auco_sc_st/Auco.bin50.OGs.normalized.h5ad) | 空间表达映射至 OG 的 AnnData；08.01 核心 OG 空间定位输入。 |
| [data/07.SpatialTranscriptomicsAnalysis/auco_sc_st/Auco.sc.OGs.normalized.h5ad](../data/07.SpatialTranscriptomicsAnalysis/auco_sc_st/Auco.sc.OGs.normalized.h5ad) | 与空间对象对应的 Auco 单细胞 OG AnnData；08.01 对照表达输入。 |
| [data/07.SpatialTranscriptomicsAnalysis/auco_MDIC3](../data/07.SpatialTranscriptomicsAnalysis/auco_MDIC3) | 07.03–07.05 的 SC/ST 表达矩阵、元数据、GRN 与 MDIC3 结果；按 Auco_SC/Auco_ST 区分。 |
| [data/07.SpatialTranscriptomicsAnalysis/auco_MDIC3/Auco_ST.exp.txt](../data/07.SpatialTranscriptomicsAnalysis/auco_MDIC3/Auco_ST.exp.txt) | 空间细胞/spot 表达矩阵，GRNBoost2 和 MDIC3 的输入。 |
| [data/07.SpatialTranscriptomicsAnalysis/auco_MDIC3/Auco_SC.exp.txt](../data/07.SpatialTranscriptomicsAnalysis/auco_MDIC3/Auco_SC.exp.txt) | 单细胞表达矩阵，SC 网络与通讯分析的输入。 |
| [data/07.SpatialTranscriptomicsAnalysis/auco_MDIC3/Auco_ST](../data/07.SpatialTranscriptomicsAnalysis/auco_MDIC3/Auco_ST) | 空间 MDIC3 输出，含 cellular_communication.txt、celltype_communication.txt 等通讯结果。 |
| [data/07.SpatialTranscriptomicsAnalysis/auco_MDIC3/Auco_SC](../data/07.SpatialTranscriptomicsAnalysis/auco_MDIC3/Auco_SC) | 单细胞 MDIC3 输出；与空间分支分开保存。 |
| [data/07.SpatialTranscriptomicsAnalysis/ST_bin50_DataH5ad/D2_bin50.h5ad](../data/07.SpatialTranscriptomicsAnalysis/ST_bin50_DataH5ad/D2_bin50.h5ad) | 07 阶段另存的 D2 bin50 对象；与 04 阶段同名文件分属不同目录，本次未验证二者内容相等。 |

## 08 核心基因集合与网络

| 数据文件或数据目录 | 说明 |
| --- | --- |
| [data/08.HubGenes/hub_genes_lists](../data/08.HubGenes/hub_genes_lists) | 三类候选基因/OG 集及其富集表、JSON 展示数据：NC-ECOGs、NO-DEOGs、NO-DNBGs；按各来源定义解释。 |
| [data/08.HubGenes/hub_genes_lists/NC-ECOGs_nodeCommon_12_15_significant.intersect](../data/08.HubGenes/hub_genes_lists/NC-ECOGs_nodeCommon_12_15_significant.intersect) | 节点 12/15 共同显著家族候选集合。 |
| [data/08.HubGenes/hub_genes_lists/NO-DEOGs_Auco_NeuronOGs_minpct0.3_logfc0.6.txt](../data/08.HubGenes/hub_genes_lists/NO-DEOGs_Auco_NeuronOGs_minpct0.3_logfc0.6.txt) | Auco 神经相关差异 OG 候选列表，文件名保留筛选参数。 |
| [data/08.HubGenes/hub_genes_lists/NO-DNBGs_DNB_OGs_List_Final.txt](../data/08.HubGenes/hub_genes_lists/NO-DNBGs_DNB_OGs_List_Final.txt) | 整理至核心基因目录的 DNB OG 候选集合。 |
| [data/08.HubGenes/res](../data/08.HubGenes/res) | 包含 common_OGs_hub_genes.txt、common_OGs_hub_genes_list.txt 及 OG0000036/OG0000112 的八张单细胞/空间表达图；当前 data 中已收录这些文件。 |
| [data/08.HubGenes/res/common_OGs_hub_genes.txt](../data/08.HubGenes/res/common_OGs_hub_genes.txt) | 共同核心 OG 编号清单（如 OG0000203）；同目录 common_OGs_hub_genes_list.txt 为 XLOC 等基因/蛋白标识列表，两者不是同一类型的清单。 |

## 09 ESM2 与 TranscriptFormer 数据

| 数据文件或数据目录 | 说明 |
| --- | --- |
| [data/09.AI/ESM/input/Orthogroups.tsv](../data/09.AI/ESM/input/Orthogroups.tsv) | ESM 候选蛋白提取所用 OG 成员表。 |
| [data/09.AI/ESM/input/candidate_ogs.txt](../data/09.AI/ESM/input/candidate_ogs.txt) | ESM 分析候选 OG 清单，决定后续蛋白提取范围。 |
| [data/09.AI/ESM/input/species_metadata.tsv](../data/09.AI/ESM/input/species_metadata.tsv) | ESM 物种门类和显示顺序等元数据。 |
| [data/09.AI/ESM/output](../data/09.AI/ESM/output) | 候选蛋白 FASTA、protein_to_og.tsv 及缺失蛋白等提取结果。 |
| [data/09.AI/ESM/embeddings/esm2_t12_35M_candidate_ogs](../data/09.AI/ESM/embeddings/esm2_t12_35M_candidate_ogs) | 当前收录 636 个 ESM2 35M 蛋白级 .pt embedding；是模型计算中间结果。 |
| [data/09.AI/ESM/embeddings/esm2_t33_650M_candidate_ogs](../data/09.AI/ESM/embeddings/esm2_t33_650M_candidate_ogs) | 当前收录 636 个 ESM2 650M 蛋白级 .pt embedding；与 35M 分支分开使用。 |
| [data/09.AI/ESM/matrices/esm2_t12_35M](../data/09.AI/ESM/matrices/esm2_t12_35M) | 35M 的 species-specific OG embedding、元数据与距离矩阵；当前 09.03/09.04 读取此分支。 |
| [data/09.AI/ESM/matrices/esm2_t33_650M](../data/09.AI/ESM/matrices/esm2_t33_650M) | 650M 的 OG embedding、元数据与距离矩阵；不能直接替换 35M 输入。 |
| [data/09.AI/TranscriptFormer/OG_embeddings_user/candidate_ogs_species_specific_embeddings_dict.npy](../data/09.AI/TranscriptFormer/OG_embeddings_user/candidate_ogs_species_specific_embeddings_dict.npy) | 09.04 整理的 (OG, species) embedding 字典，供 TF 物种 embedding 文件生成。 |
| [data/09.AI/TranscriptFormer/OG_embeddings_user/species_pkl](../data/09.AI/TranscriptFormer/OG_embeddings_user/species_pkl) | 各物种 candidate_ogs.esm2_embedding.pkl 及生成摘要；09.05 自定义 embedding 输入。 |
| [data/09.AI/TranscriptFormer/input_h5ad_downsampled](../data/09.AI/TranscriptFormer/input_h5ad_downsampled) | 09.04 输出的下采样 OG 表达对象；normalized adata.X 与原始 counts 不能混同。 |
| [data/09.AI/TranscriptFormer/inference_cge_candidate](../data/09.AI/TranscriptFormer/inference_cge_candidate) | 目前仅有九个物种空子目录，递归核查未发现结果文件；不能视为 CGE 推断已完成。 |
| [data/09.AI/TranscriptFormer/cge_aggregated](../data/09.AI/TranscriptFormer/cge_aggregated) | 目前为空目录，尚无候选 OG × 物种 × 细胞类型的 CGE 汇总文件。 |
| [data/09.AI/ESM/figures](../data/09.AI/ESM/figures) | 35M 与 650M 分支各有六候选 OG 距离热图和一张平均距离热图。 |
| [data/09.AI/TranscriptFormer/checkpoints](../data/09.AI/TranscriptFormer/checkpoints) | 当前为空目录，未收录代码指定的 tf_metazoa 权重。 |
| [data/09.AI/TranscriptFormer/OG_embeddings_user/candidate_ogs_species_specific_embeddings_metadata.csv](../data/09.AI/TranscriptFormer/OG_embeddings_user/candidate_ogs_species_specific_embeddings_metadata.csv) | OG/物种 embedding 的元数据，用于解释字典及物种专用 embedding。 |

## 当前未收录或待补充的关键路径

以下仅作缺失项说明，不作为已提供的数据链接。当前空间分支集中于 D2，未收录旧说明中的 F3 对象。原始 public 数据子目录和比对索引也未纳入，需结合 README 与实际运行代码另外准备。

| 数据文件或数据目录 | 说明 |
| --- | --- |
| `data/01.RawData/AcoGenome/au.coerulea.QDv2.fasta` | **当前不存在。** README 列出的 QDv2 参考序列未收录；同目录也未收录 Yantai.fna。 |
| `data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_input` | **当前不存在。** 当前未收录 CAFE 输入目录，不能把 CAFE_output 等同于完整重跑所需输入。 |
| `data/06.SingleCellAnalysis/SAMap_9_species/SAMap_output/maps` | **当前不存在。** 当前未收录九物种 BLAST maps；三物种分支也未收录 maps 和 SAMap_input。 |
| `data/08.HubGenes/Networks` | **当前不存在。** 旧说明中的 Networks/pearson0.1 网络中间表未纳入当前 data；当前 HubGenes 只包含 hub_genes_lists 和 res。 |
| `data/09.AI/TranscriptFormer/input_h5ad_candidate` | **当前不存在。** 尚未生成/收录六候选 OG 的 TF 输入目录，不能由现有下采样 h5ad 推断该步骤已完成。 |
| `data/09.AI/TranscriptFormer/checkpoints/tf_metazoa` | **当前不存在。** 代码预期的具体 checkpoint 路径不存在。 |

## 使用与版本对应

结果图片见 [results](../results/README.md)，分析入口见 [analysis](../analysis/)。数据目录改名和裁剪不自动改变代码中的绝对路径；原代码仍可能引用旧 Data 位置，运行前需逐项映射。特别是结构注释的优化版本不能仅按旧文件名替换。
