# 02 · 基因组结构注释与蛋白序列

整理用于单核 RNA 和空间分析的结构注释，以及跨物种蛋白序列和 ID 列表。

[数据总览](../data.md) · [分析代码](../../analysis/)

## 当前收录情况

结构注释目录有四个 GFF/GFF3 和一份 README；蛋白目录有 10 份 FASTA 和 10 份 ID 列表，含九物种主集合及 Trad。AcoProteinAnnotation_processed 保存的是基因组结构注释，不是蛋白序列或 eggNOG 功能表。

核查日期：2026-09-14。以下路径相对于本目录；说明依据当前文件清单和已有文档，不代表已完成数值复现。本轮仅补充汇总说明。

## 数据文件与目录

| 数据文件或数据目录 | 说明 |
| --- | --- |
| [ProteinSequence_processed](ProteinSequence_processed) | 当前有 10 份蛋白 FASTA 和 10 份 ID 列表，包括九物种主分析集合及 Trad；用于同源基因、功能注释和序列比较，不能把 Trad 与 TrH1 自动合并。 |
| [AcoProteinAnnotation_processed](AcoProteinAnnotation_processed) | 保存基因组结构注释 GFF/GFF3（不是蛋白 FASTA 或 eggNOG 功能表）；包含四个注释文件及说明。目录 README 指出优化文件与历史同名用途文件并非简单重命名关系。 |
| [AcoProteinAnnotation_processed/au.coerulea.QDv2.raw.gff](AcoProteinAnnotation_processed/au.coerulea.QDv2.raw.gff) | QD/QDv2 基线结构注释，用于注释比较；raw 不表示完全未做格式预处理。 |
| [AcoProteinAnnotation_processed/au.coerulea.QDv2.optimized_for_dnbc4tools.gff3](AcoProteinAnnotation_processed/au.coerulea.QDv2.optimized_for_dnbc4tools.gff3) | QD/QDv2 优化注释的 dnbc4tools 适配版本；建索引时需配套 QDv2 FASTA，后者当前未收录。 |
| [AcoProteinAnnotation_processed/au.coerulea.QDv2.optimized_for_SAW-ST-V8.gff](AcoProteinAnnotation_processed/au.coerulea.QDv2.optimized_for_SAW-ST-V8.gff) | QD/QDv2 优化注释的 SAW-ST-V8 适配版本，与 dnbc4tools 版属性格式不同，不能假定可互换。 |
| [AcoProteinAnnotation_processed/au.coerulea.Yantai.generated.gff3](AcoProteinAnnotation_processed/au.coerulea.Yantai.generated.gff3) | Yantai 组装的生成注释；需配套 Yantai 参考序列，其与最终 YT_gff_refined 的版本关系需参考生成记录。 |

## 上下游关系

结构注释与 01 阶段配套基因组用于 03/04 的参考处理；蛋白序列供 05 的 OrthoFinder/eggNOG 与 06 的 SAMap 使用。

## 尚未收录与使用说明

配套 QDv2/Yantai 基因组序列尚未收录到 01。优化注释的工具适配版本不能互换，目录 README 记录它们与历史注释并非简单重命名关系；具体生成记录仍需核对。
