# Auxiliary code / 辅助代码

这些文件原来位于 Data，属于编号分析依赖或公共数据转换步骤。保留 `support/Data/...` 层级与原文件名，脚本正文逐字节保留，notebooks 按与主代码相同规则清理。

| 来源位置 | 用途/调用方 |
| --- | --- |
| Data/01.RawData/PublicData/2023Placozoa/{Tadh,TrH2,Hhon,HoiH23} | 每种数据的 R 前处理与 H5→AnnData；供 01.06 输入使用，运行目录为各样本目录 |
| Data/02.GenomicProcessing/ReferenceGenome | resolve_optimized_gff3.py，由 02.01 调用 |
| Data/05.GenomeAnalysis/CAFE_ExpansionsContractions/CAFE_input | clade_and_size_filter.py 和 cafe5_draw_tree.py，由 05.04 的实际/注释命令引用 |
| Data/06.SingleCellAnalysis/SAMap_Clhe_Auco_TrH1 | 三物种 map_genes.sh，由 06.02 调用 |
| Data/06.SingleCellAnalysis/SAMap_9_species | 九物种分支 map_genes.sh，由当前 06.14 调用；与三物种版本不合并 |
| Data/09.AI/ESM/scripts | 候选蛋白提取、ESM2 embedding、OG 距离计算；09.02 调用 |
| Data/09.AI/TranscriptFormer/scripts | 候选 embedding/表达准备、CGE 检查与汇总；09.05 调用 |

`tools/prepare_workspace.py` 将这些代码放回新运行目录的相应 Data 路径，避免相对脚本调用失效。大型第三方源码树、模型权重、公共 scdb、厂商数据下载脚本未整体搬入。

部分辅助脚本来自或参考上游工具。保留已有作者说明（如 clade_and_size_filter.py 的 `__author__`），本轮没有为这些文件重新指定许可证；上游来源及许可信息仍需在正式发布元数据中核实。
