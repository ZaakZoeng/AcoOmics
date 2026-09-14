# 08 · 核心基因与候选 OG 汇总

汇总节点演化、神经相关差异表达和 DNB 三类候选集合，以及核心基因的单细胞/空间表达结果。

[数据总览](../data.md) · [分析代码](../../analysis/)

## 当前收录情况

hub_genes_lists 有 13 个文件，res 有 10 个文件；后者包含两份不同类型的清单和 OG0000036/OG0000112 的八张表达图。

核查日期：2026-09-14。以下路径相对于本目录；说明依据当前文件清单和已有文档，不代表已完成数值复现。本轮仅补充汇总说明。

## 数据文件与目录

| 数据文件或数据目录 | 说明 |
| --- | --- |
| [hub_genes_lists](hub_genes_lists) | 三类候选基因/OG 集及其富集表、JSON 展示数据：NC-ECOGs、NO-DEOGs、NO-DNBGs；按各来源定义解释。 |
| [hub_genes_lists/NC-ECOGs_nodeCommon_12_15_significant.intersect](hub_genes_lists/NC-ECOGs_nodeCommon_12_15_significant.intersect) | 节点 12/15 共同显著家族候选集合。 |
| [hub_genes_lists/NO-DEOGs_Auco_NeuronOGs_minpct0.3_logfc0.6.txt](hub_genes_lists/NO-DEOGs_Auco_NeuronOGs_minpct0.3_logfc0.6.txt) | Auco 神经相关差异 OG 候选列表，文件名保留筛选参数。 |
| [hub_genes_lists/NO-DNBGs_DNB_OGs_List_Final.txt](hub_genes_lists/NO-DNBGs_DNB_OGs_List_Final.txt) | 整理至核心基因目录的 DNB OG 候选集合。 |
| [res](res) | 包含 common_OGs_hub_genes.txt、common_OGs_hub_genes_list.txt 及 OG0000036/OG0000112 的八张单细胞/空间表达图；当前 data 中已收录这些文件。 |
| [res/common_OGs_hub_genes.txt](res/common_OGs_hub_genes.txt) | 共同核心 OG 编号清单（如 OG0000203）；同目录 common_OGs_hub_genes_list.txt 为 XLOC 等基因/蛋白标识列表，两者不是同一类型的清单。 |

## 上下游关系

候选集合来自 05/06，表达对象来自 07；富集表和 JSON 可供 09 表格导出与展示使用。NC-ECOGs、NO-DEOGs、NO-DNBGs 按各自来源定义解释。

## 尚未收录与使用说明

未收录旧说明中的 Networks/pearson0.1 网络中间表。common_OGs_hub_genes.txt 为 OG 编号，而 common_OGs_hub_genes_list.txt 为 XLOC 等基因/蛋白标识，不能把二者当作同一列表。
