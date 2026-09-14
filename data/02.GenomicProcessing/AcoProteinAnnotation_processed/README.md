# AcoProteinAnnotation_processed — 海月水母基因注释整理结果

物种：*Aurelia coerulea*（`Auco`）。本目录保存用于参考索引构建、单核 RNA 测序和空间转录组分析的 **基因组注释文件**，不是蛋白质 FASTA 或蛋白功能注释表。

两套参考基因组及 CycloneSEQ 注释优化方法见 [AcoGenome 说明](../../01.RawData/AcoGenome/README.md)。QD/QDv2 与 YT/Yantai 属于不同组装，应使用各自配套的参考序列。

## 文件与用途

| 本地文件 | 参考基因组 | 用途/注释类别 | 文件大小（bytes） |
| --- | --- | --- | --- |
| `au.coerulea.QDv2.raw.gff` | `au.coerulea.QDv2.fasta` | QD 基线注释，用于与优化注释比较；对应方法中的 `QD_gff` 基线类别 | 26,090,569 |
| `au.coerulea.QDv2.optimized_for_dnbc4tools.gff3` | `au.coerulea.QDv2.fasta` | QD 优化注释的 dnbc4tools 适配版本，用于单核 RNA 测序参考索引构建 | 33,477,946 |
| `au.coerulea.QDv2.optimized_for_SAW-ST-V8.gff` | `au.coerulea.QDv2.fasta` | QD 优化注释的 SAW-ST-V8 适配版本，用于空间转录组处理 | 41,907,128 |
| `au.coerulea.Yantai.generated.gff3` | `au.coerulea.Yantai.fna` | YT 基因组的生成注释；用于 YT 注释分支，是否为最终发布的 `YT_gff_refined` 需结合生成记录确认 | 16,988,095 |

参考序列位于 [Data/01.RawData/AcoGenome](../../01.RawData/AcoGenome/README.md)。两个 `optimized_for_*` 文件属于 QD 优化注释的不同工具适配版本，不能视作两个独立参考基因组；具体与最终发布的 `QD_gff_refined` 的版本对应关系应在发布时明确。

`raw.gff` 中的 raw 表示本目录中的基线比较版本，不表示从未进行格式预处理：当前文件已含 gene、mRNA、exon、CDS 记录。

## 当前文件的注释记录统计

| 文件简称 | gene | mRNA | exon | CDS | five_prime_UTR | three_prime_UTR |
| --- | --- | --- | --- | --- | --- | --- |
| QDv2.raw | 26,777 | 26,777 | 150,649 | 150,649 | 0 | 0 |
| QDv2.optimized_for_dnbc4tools | 21,775 | 21,790 | 143,613 | 143,606 | 24 | 28 |
| QDv2.optimized_for_SAW-ST-V8 | 21,775 | 21,790 | 143,613 | 143,606 | 24 | 28 |
| Yantai.generated | 5,944 | 6,869 | 48,764 | 44,939 | 8,012 | 6,141 |

统计依据各文件第3列的 feature 类型，跳过空行及注释行；数值是记录行数，不是按 ID 去重后的数量。两个 QD 优化文件的各类记录数相同，但属性格式存在差异：例如当前 SAW 版本的 exon 记录增加了 `Name` 属性并采用末尾分号。记录数相同不代表文件内容完全相同，也不代表格式和坐标已通过工具验证。

## 来源核对与代码衔接

本次对当前文件及原项目 `Data/02.GenomicProcessing/ReferenceGenome_processed/AU_ReferenceGenome/` 中的相关历史文件进行了 SHA256 比较：

- `au.coerulea.QDv2.raw.gff` 与历史 `au.coerulea.QDv2.gff` 完全一致。
- `au.coerulea.Yantai.generated.gff3` 与历史同名文件完全一致。
- 当前 dnbc4tools 优化文件与历史 `au.coerulea.QDv2.CycloneSeq.opt.renamed.gff3` 的 SHA256 不同。
- 当前 SAW 优化文件与历史 `au.coerulea.QDv2.CycloneSeq.opt.renamed.SAW.gff` 的 SHA256 不同。

因此，不能将当前两个优化文件描述为上述历史文件的简单重命名副本；其具体编辑、筛选或转换步骤仍需由生成记录确定。

[03.01_dnbc4tools_mkref.sh](../../../Codes/03.01_dnbc4tools_mkref.sh) 构建参考索引，使用本目录的 Yantai.generated、QDv2.raw 和 QDv2.optimized_for_dnbc4tools 三套注释及 RawData/AcoGenome 中的配套序列。索引成功完成后，通过 [03.02_dnbc4tools_run.sh](../../../Codes/03.02_dnbc4tools_run.sh) 单独执行样本分析。优化版本与历史文件存在差异，因此重跑结果不能预先认定与历史结果完全一致。原项目 `Codes/04.01_gff3_to_gff.sh` 记录了面向 SAW 的属性格式转换和手工处理提示，不能单凭该脚本推定当前 SAW 文件的完整生成过程。

本次仅补充说明、统计和校验信息，没有重新执行注释优化、构建参考索引或修改数据文件。

## 当前文件 SHA256

```text
4038bc8b182fb82bccca13bf9f9041ac1d6de12d2e2125851801e06804c2f40d  au.coerulea.QDv2.raw.gff
d57acc4a3646fdb83cd84c93977a8f0cc513bd360bfa55c2d1d7e515b83ed81b  au.coerulea.QDv2.optimized_for_dnbc4tools.gff3
936dc08a7110f7b298becdf3e0261a0979cc7b5d6f07fdb52a305122c2a332f2  au.coerulea.QDv2.optimized_for_SAW-ST-V8.gff
b740cc8ad792e1dac5af043364de74003a10a770599fa35973bf90960ee3e8be  au.coerulea.Yantai.generated.gff3
```
