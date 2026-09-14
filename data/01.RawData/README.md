# 01 · 原始测序与公共数据

记录参考基因组、Auco 长读长、单核 RNA 测序、空间转录组及公共物种数据的来源与样本对应。

[数据总览](../data.md) · [分析代码](../../analysis/)

## 当前收录情况

五个子目录目前均仅含 README，没有收录 FASTQ、参考基因组 FASTA/FNA 或公共原始矩阵。子目录 README 内的文件大小和“本地文件”表是资源记录，不代表这些文件已包含在当前 AcoOmics 仓库。

核查日期：2026-09-14。以下路径相对于本目录；说明依据当前文件清单和已有文档，不代表已完成数值复现。本轮仅补充汇总说明。

## 数据文件与目录

| 数据文件或数据目录 | 说明 |
| --- | --- |
| [CycloneSeqData](CycloneSeqData) | 目前仅收录 README，记载 Auco 长读长样本、原始文件名和 CNSA 获取线索；未收录 FASTQ。README 中的本地文件大小是记录信息，不表示这些文件已放入当前仓库。 |
| [DNBeLabC4Data](DNBeLabC4Data) | 目前仅收录 README，说明三个 Auco 单核样本、cDNA/oligo 文库与文件对应；未收录 FASTQ。 |
| [StereoSeqData](StereoSeqData) | 目前仅收录 README，说明 D06050D2 空间测序样本；未收录空间原始测序文件。 |
| [AcoGenome](AcoGenome) | 目前仅有 README，记载 QD/QDv2 与 YT/Yantai 两套基因组及注释优化方法。其文中列出的 FASTA/FNA 当前并未收录；不能仅凭 README 表格判断序列已存在。 |
| [PublicData](PublicData) | 目前仅有 README，汇总公共物种及论文资源；没有各物种原始表达矩阵或公共参考序列子目录。 |

## 上下游关系

获取原始测序及配套参考序列后，可用于 02 注释处理、03 单细胞计数与 04 空间预处理。公共数据的已处理 h5ad 在 03 阶段。

## 尚未收录与使用说明

参考序列与测序文件尚需另外获取；下载入口沿用子目录 README，未在本轮联网验证。部分旧说明中的链接/路径保留历史名称，应以实际目录为准。
