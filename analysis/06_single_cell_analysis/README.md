# 跨物种细胞与神经功能分析

按当前文件名和编号阅读；参见 [流程说明](../../docs/workflow.md) 和 [代码索引](../../docs/code_index.md)。

| 文件 | 用途 | 内核 | 说明 |
| --- | --- | --- | --- |
| [06.01_Auco_DEGs_GOs_analysis_R.ipynb](06.01_Auco_DEGs_GOs_analysis_R.ipynb) | Auco 细胞簇差异基因与 GO 功能富集 | R | 保留当前正文和参数 |
| [06.02_SAMap_ClheAucoTrH1_run_blast.sh](06.02_SAMap_ClheAucoTrH1_run_blast.sh) | 三物种双向 BLAST | bash | 保留当前正文和参数 |
| [06.03_SAMap_ClheAucoTrH1_analysis_Python.ipynb](06.03_SAMap_ClheAucoTrH1_analysis_Python.ipynb) | 三物种 SAMap 映射 | python | 保留当前正文和参数 |
| [06.04_Auco_Annotation_Python.ipynb](06.04_Auco_Annotation_Python.ipynb) | Auco 细胞类型注释 | python | 保留当前正文和参数 |
| [06.05_All_sc_og_processing_Python.ipynb](06.05_All_sc_og_processing_Python.ipynb) | 九物种基因到 OG 表达映射 | python | 保留当前正文和参数 |
| [06.06_All_h5ad_to_mtx_Python.ipynb](06.06_All_h5ad_to_mtx_Python.ipynb) | OG AnnData 转 Matrix Market | python | 保留当前正文和参数 |
| [06.07_All_mtx_to_RDS_R.ipynb](06.07_All_mtx_to_RDS_R.ipynb) | Matrix Market 转 Seurat RDS | R | 保留当前正文和参数 |
| [06.08_All_seurat_Integrate_R.ipynb](06.08_All_seurat_Integrate_R.ipynb) | Seurat 多方法整合探索 | R | 多方法探索仍包含交互式对象依赖，例如 objs；06.09 为独立 RPCA 分支。 |
| [06.09_All_seurat_Integrate_RPCA_R.ipynb](06.09_All_seurat_Integrate_RPCA_R.ipynb) | Seurat RPCA 整合、BroadType 注释与绘图 | R | 保留当前正文和参数 |
| [06.10_All_rds_to_h5_R.ipynb](06.10_All_rds_to_h5_R.ipynb) | 整合 Seurat RDS 转 H5 与元数据 | R | 保留当前正文和参数 |
| [06.11_All_h5_to_h5ad_Python.ipynb](06.11_All_h5_to_h5ad_Python.ipynb) | 整合 H5 转 AnnData | python | 保留当前正文和参数 |
| [06.12_All_process_h5ad_Python.ipynb](06.12_All_process_h5ad_Python.ipynb) | 整合 AnnData 后处理 | python | 保留当前正文和参数 |
| [06.13_read_scBasalMetazoans_h5ad_Python.ipynb](06.13_read_scBasalMetazoans_h5ad_Python.ipynb) | 读取整合 scBasalMetazoans 图谱与绘图 | python | 保留当前正文和参数 |
| [06.14_SAMap_9_species_run_blast.sh](06.14_SAMap_9_species_run_blast.sh) | 补充八个物种与 Dare 的双向 BLAST | bash | 此脚本只计算其余八个物种与 Dare 的配对。06.15 九物种 SAMap 所需的其他配对结果需预先存在。 |
| [06.15_SAMap_9_species_analysis_Python.ipynb](06.15_SAMap_9_species_analysis_Python.ipynb) | 九物种 SAMap 映射与可视化 | python | 保留当前正文和参数 |
| [06.16_Neuron_gene_emergecne_R.ipynb](06.16_Neuron_gene_emergecne_R.ipynb) | 神经相关基因功能逐步涌现分析 | R | 保留当前正文和参数 |
| [06.17_DNB_analysis_R.ipynb](06.17_DNB_analysis_R.ipynb) | DNB 模块与候选 OG 分析 | R | 保留当前正文和参数 |
| [06.18_CAFE5_specific_analysis.sh](06.18_CAFE5_specific_analysis.sh) | 提取 DNB OG 对应基因 | bash | 保留当前正文和参数 |
| [06.19_DNB_OGs_Enrich_R.ipynb](06.19_DNB_OGs_Enrich_R.ipynb) | DNB OG 功能富集 | R | 保留当前正文和参数 |

对应结果图片见 [结果目录](../../results/06_single_cell_analysis/README.md)；重要中间数据见 [数据说明](../../data.md)。
