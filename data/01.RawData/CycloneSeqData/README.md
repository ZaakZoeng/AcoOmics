# AcoCycloneSeqData — 海月水母长读长数据

物种：*Aurelia coerulea*（`Auco`）；2只水母样本。数据来源：[CNGBdb：CNP0008642](https://db.cngb.org/data_resources/project/CNP0008642/)。

## 项目样本记录

| 样本编号 | 测序数据 | 测序平台 | 数据量（原表 GB） |
| --- | --- | --- | --- |
| QD-CY240103004 | CycloneSeq | G100-ER | 6.17 |
| QD-CY240103006 | CycloneSeq | G100-ER | 8.89 |

原表 GB 数值保留原统计口径，不直接作为下列未压缩 FASTQ 的大小。

## 当前本地文件

| 本地文件 | 对应原始压缩文件 | 用途/类型 | 本地文件大小（bytes） | 本地文件大小（GiB） |
| --- | --- | --- | --- | --- |
| `au.coerulea.CycloneSeq1.fq` | `TB200022CF-202401031955000_read.fq.gz` | 解压后的 FASTQ（.fq） | 9,798,368,558 | 9.125 |
| `au.coerulea.CycloneSeq2.fq` | `TB200024E6-202401032003570_read.fq.gz` | 解压后的 FASTQ（.fq） | 22,018,667,000 | 20.506 |

原始文件与本地输出名称的对应关系依据原项目 `Codes/01.01_get_CycloneSeq_fq.sh` 的 `gunzip -c` 命令核实。项目 QD 样本编号与上述 TB 文件编号的逐一对应关系仍待核实，不按样本表顺序推定配对；这里确认的是代码中的文件对应关系，不是对当前本地文件内容的重新校验。

## CNSA 原始数据位置

以下目录、accession 和文件名由项目维护者提供，项目 accession 均为 `CNP0008642`。

### CycloneSeq1

- 样本 accession：`CNS1440932`
- 实验 accession：`CNX1281846`
- 测序 Run accession：`CNR1458758`
- 原始文件：`TB200022CF-202401031955000_read.fq.gz`
- 数据库页面显示大小：尚未提供。

完整服务器路径：

```text
/pub/CNSA/data7/CNP0008642/CNS1440932/CNX1281846/CNR1458758/TB200022CF-202401031955000_read.fq.gz
```

### CycloneSeq2

- 样本 accession：`CNS1440933`
- 实验 accession：`CNX1281847`
- 测序 Run accession：`CNR1458759`
- 原始文件：`TB200024E6-202401032003570_read.fq.gz`
- 数据库页面显示大小：**7.63 GB**（维护者提供，保留页面单位）。

完整服务器路径：

```text
/pub/CNSA/data7/CNP0008642/CNS1440933/CNX1281847/CNR1458759/TB200024E6-202401032003570_read.fq.gz
```

## 数据获取与大小说明

通过 [CNGBdb 项目 CNP0008642](https://db.cngb.org/data_resources/project/CNP0008642/) 查找上述样本、实验与 Run 记录，再使用数据库提供的下载入口获取文件。当前记录的是服务器路径，尚未提供下载主机和协议，因此未将其拼接为未经确认的完整下载 URL。

项目样本表的 GB 数值、数据库页面显示的压缩文件大小以及本地未压缩文件大小分别保留，不能相互替代。本地大小来自文件系统，GiB = bytes / 2³⁰。下载时请补充并核对数据库提供的校验和；本次没有下载数据、重新计算大文件校验和或检查 FASTQ 完整性。

[返回原始数据目录总览](../README.md)
