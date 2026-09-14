# 比较基因组与功能富集

按当前文件名和编号阅读；参见 [流程说明](../../docs/workflow.md) 和 [代码索引](../../docs/code_index.md)。

| 文件 | 用途 | 内核 | 说明 |
| --- | --- | --- | --- |
| [05.01_All_get_eggNOG_input.sh](05.01_All_get_eggNOG_input.sh) | 准备 eggNOG 输入蛋白 | bash | 保留当前正文和参数 |
| [05.02_OrthoFinder_analysis.sh](05.02_OrthoFinder_analysis.sh) | 运行 OrthoFinder | bash | 保留当前正文和参数 |
| [05.03_OrthoFinder_results_plot_R.ipynb](05.03_OrthoFinder_results_plot_R.ipynb) | 整理/绘制 OrthoFinder 结果 | R | 保留当前正文和参数 |
| [05.03_OrthoFinder_results_processing_Python.ipynb](05.03_OrthoFinder_results_processing_Python.ipynb) | 整理/绘制 OrthoFinder 结果 | python | 保留当前正文和参数 |
| [05.04_CAFE5_analysis.sh](05.04_CAFE5_analysis.sh) | 运行 CAFE5 并绘制扩张收缩树 | bash | 保留当前正文和参数 |
| [05.05_CAFE5_specific_analysis.sh](05.05_CAFE5_specific_analysis.sh) | 提取指定节点/家族的扩张收缩集合 | bash | 保留当前正文和参数 |
| [05.06_eggNOG_mapper_processed.sh](05.06_eggNOG_mapper_processed.sh) | 合并各物种 eggNOG 注释 | bash | 保留当前正文和参数 |
| [05.07_CAFE5_node_emapper_anno.sh](05.07_CAFE5_node_emapper_anno.sh) | 提取指定节点的 eggNOG 注释 | bash | 保留当前正文和参数 |
| [05.08_get_GO_basic.sh](05.08_get_GO_basic.sh) | 从 GO OBO 提取注释表 | bash | 保留当前正文和参数 |
| [05.09_get_KEGG_R.ipynb](05.09_get_KEGG_R.ipynb) | 构建 KEGG KO 与通路映射 | R | 保留当前正文和参数 |
| [05.10_CAFE5_node_GO_KEGG_R.ipynb](05.10_CAFE5_node_GO_KEGG_R.ipynb) | 指定节点 GO/KEGG 注释与富集 | R | 含手动去除注释表 query 前 # 的记录；05.11 富集分支还读取 06 阶段建立的 TERM2GENE/TERM2NAME 等参考表，编号不是严格拓扑顺序。 |
| [05.11_CAFE5_node11_Enrich_R.ipynb](05.11_CAFE5_node11_Enrich_R.ipynb) | 节点功能富集/系统发育可视化分支 | R | 保留当前正文和参数 |
| [05.11_CAFE5_node12_Enrich_R.ipynb](05.11_CAFE5_node12_Enrich_R.ipynb) | 节点功能富集/系统发育可视化分支 | R | 保留当前正文和参数 |
| [05.11_CAFE5_node15_Enrich_R.ipynb](05.11_CAFE5_node15_Enrich_R.ipynb) | 节点功能富集/系统发育可视化分支 | R | 保留当前正文和参数 |
| [05.11_CAFE5_nodeCommon_12_15_Enrich_R.ipynb](05.11_CAFE5_nodeCommon_12_15_Enrich_R.ipynb) | 节点功能富集/系统发育可视化分支 | R | 保留当前正文和参数 |
| [05.12_Phylogenetic_analysis_Python.ipynb](05.12_Phylogenetic_analysis_Python.ipynb) | CAFE5 演化树与节点扩张收缩可视化 | python | 保留当前正文和参数 |

对应结果图片见 [结果目录](../../results/05_genome_analysis/README.md)；重要中间数据见 [数据说明](../../data.md)。
