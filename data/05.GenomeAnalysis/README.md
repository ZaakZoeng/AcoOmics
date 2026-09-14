# 05 · 比较基因组、家族演化与功能注释

保存跨物种同源关系、基因家族扩张收缩、节点富集及 GO/KEGG 参考数据。

[数据总览](../data.md) · [分析代码](../../analysis/)

## 当前收录情况

包括整理后的 OrthoFinder 四类输出、CAFE5 输出、四组节点的 GO/KEGG 富集表和图、eggNOG 合并注释与功能映射库。cafeplotter_res/gene_family 有 581 张家族图。

核查日期：2026-09-14。以下路径相对于本目录；说明依据当前文件清单和已有文档，不代表已完成数值复现。本轮仅补充汇总说明。

## 数据文件与目录

| 数据文件或数据目录 | 说明 |
| --- | --- |
| [eggNOG_FunctionalAnnotation/eggNOG_output_processed](eggNOG_FunctionalAnnotation/eggNOG_output_processed) | 各物种整理后的 eggNOG 注释表；05.06 合并这些注释。 |
| [eggNOG_FunctionalAnnotation/eggNOG_output_processed/all_species.emapper.annotations](eggNOG_FunctionalAnnotation/eggNOG_output_processed/all_species.emapper.annotations) | 跨物种合并功能注释；节点家族与 DNB 基因的功能映射参考。 |
| [OrthoFinder_Inference/OrthoFinder_output/Step1_QualityControl](OrthoFinder_Inference/OrthoFinder_output/Step1_QualityControl) | 当前包含 SpeciesTree_rooted.txt、Statistics_PerSpecies.tsv、Statistics_Overall.tsv，即物种树和同源推断基础统计。 |
| [OrthoFinder_Inference/OrthoFinder_output/Step2_InterpretingResults](OrthoFinder_Inference/OrthoFinder_output/Step2_InterpretingResults) | 当前包含 Orthogroups.tsv、SpeciesTree_Gene_Duplications_0.5_Support.txt 和 OG0001111 示例基因树，分别记录 OG 成员、复制事件和示例树。 |
| [OrthoFinder_Inference/OrthoFinder_output/Step3_OrthogroupsGeneCount/Orthogroups.GeneCount.tsv](OrthoFinder_Inference/OrthoFinder_output/Step3_OrthogroupsGeneCount/Orthogroups.GeneCount.tsv) | OG × 物种的基因数量表；用于家族共享/特异性统计、UpSet 和 CAFE 输入准备。 |
| [OrthoFinder_Inference/OrthoFinder_output/Step4_SpeciesOrthogroup](OrthoFinder_Inference/OrthoFinder_output/Step4_SpeciesOrthogroup) | 九物种 protein_to_orthogroup.csv；06.05 将单细胞基因标识映射为 OG 的关键字典。 |
| [CAFE_ExpansionsContractions/CAFE_output](CAFE_ExpansionsContractions/CAFE_output) | CAFE5 总输出：包括 Gamma_count.tab、Gamma_change.tab、显著家族、祖先状态树与报告。 |
| [CAFE_ExpansionsContractions/CAFE_output/Gamma_p0.05change.tab](CAFE_ExpansionsContractions/CAFE_output/Gamma_p0.05change.tab) | 显著变化家族表，供节点扩张/收缩筛选；文件名反映已有筛选版本。 |
| [CAFE_ExpansionsContractions/target_nodes_analysis](CAFE_ExpansionsContractions/target_nodes_analysis) | 当前仅保留 zz_results 下节点 11、12、15、Common_12_15 的 GO/KEGG 富集表和 dotplot；没有把原项目全部节点筛选中间文件搬入此目录。 |
| [CAFE_ExpansionsContractions/target_nodes_analysis/zz_results/nodeCommon_12_15_enrichment_GO_results.csv](CAFE_ExpansionsContractions/target_nodes_analysis/zz_results/nodeCommon_12_15_enrichment_GO_results.csv) | 节点 12/15 共同集合的 GO 富集表，09.01 及候选核心基因汇总使用。 |
| [GO_and_KEGG](GO_and_KEGG) | GO OBO、KEGG JSON 和派生映射库；数据库版本与名称解析方式影响富集注释。 |
| [Dendroscope_Tree/LifemapSpeciesTree.txt](Dendroscope_Tree/LifemapSpeciesTree.txt) | 用于系统发育背景展示的物种树文本，与 CAFE 输入树需分开解释。 |
| [CAFE_ExpansionsContractions/cafeplotter_res](CAFE_ExpansionsContractions/cafeplotter_res) | CAFE 可视化汇总：result_summary.tsv、summary_all_gene_family.png，以及 gene_family 下 581 张家族图。 |
| [OrthoFinder_Inference/OrthoFinder_output/Step2_InterpretingResults/Orthogroups.tsv](OrthoFinder_Inference/OrthoFinder_output/Step2_InterpretingResults/Orthogroups.tsv) | 当前收录的 OG 成员表，是 OG 到各物种成员基因/蛋白关系的重要数据。 |
| [CAFE_ExpansionsContractions/cafeplotter_res/result_summary.tsv](CAFE_ExpansionsContractions/cafeplotter_res/result_summary.tsv) | CAFE 家族可视化的摘要统计表。 |

## 上下游关系

02 的蛋白序列用于同源推断和注释；OG 成员/计数及 protein_to_orthogroup 映射供 06 表达映射、基因集筛选和 09 候选蛋白提取。节点富集也可能依赖 06 中构建的注释表，编号不是严格拓扑顺序。

## 尚未收录与使用说明

CAFE_input、原始 OrthoFinder_input 与完整上游运行目录未收录。输出树和统计不能替代 CAFE 完整输入；节点编号依赖所用树。保留 GO/KEGG 库原版本，未重新下载或更新注释。
