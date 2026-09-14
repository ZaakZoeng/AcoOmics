# 04 · 空间转录组预处理

保存 D06050D2 切片 bin50 对象、基因列表和聚类 marker，作为空间分析输入。

[数据总览](../data.md) · [分析代码](../../analysis/)

## 当前收录情况

当前包含两个 h5ad、D2_bin50.genes.txt、D2_top100_degs_per_cluster.csv 和原始 README 记录；空间分支集中于 D2。

核查日期：2026-09-14。以下路径相对于本目录；说明依据当前文件清单和已有文档，不代表已完成数值复现。本轮仅补充汇总说明。

## 数据文件与目录

| 数据文件或数据目录 | 说明 |
| --- | --- |
| [README](README) | SAW-ST-V8-checkGTF、makeRef 和 SAW 处理步骤的原始记录；未给出完整可执行命令与全部参数。 |
| [D2_bin50.h5ad](D2_bin50.h5ad) | D2 bin50 空间表达对象，07.01/07.03 使用的输入之一。 |
| [D06050D2.bin50_1.0.h5ad](D06050D2.bin50_1.0.h5ad) | D06050D2 的另一平台/处理版本空间对象；07.03 中有读取，不能按名称推断与 D2_bin50.h5ad 相同。 |
| [D2_top100_degs_per_cluster.csv](D2_top100_degs_per_cluster.csv) | D2 每簇 top100 差异基因/marker 汇总，作为空间簇解释的中间表。 |
| [D2_bin50.genes.txt](D2_bin50.genes.txt) | D2 对象基因标识列表。 |

## 上下游关系

本阶段来自外部 SAW 空间处理；07 阶段以相应 h5ad 为输入做细胞类型迁移、OG 表达映射和通讯分析。

## 尚未收录与使用说明

未收录 F3 切片对象；原 README 仅列出 SAW-ST-V8-checkGTF、makeRef 和 SAW 步骤，不能代替完整命令与环境记录。两个 h5ad 以及 07 中同名 D2 对象未在本轮验证内容相等。
