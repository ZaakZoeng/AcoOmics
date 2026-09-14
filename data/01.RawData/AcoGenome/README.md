# AcoGenome — 海月水母基因组与 CycloneSEQ 注释优化

物种：*Aurelia coerulea*（`Auco`）。本项目使用 QD 和 YT 两套基因组资源，结合 CycloneSEQ 长读长转录本证据构建和优化基因注释，以提高转录组 reads 的比对效率与信息利用率。

## 1. 基因组资源与当前本地文件

- **QD：本研究团队组装的基因组。** 资源论文：[Chromosome-level genome assembly and annotation of the moon jellyfish Aurelia coerulea](https://www.nature.com/articles/s41597-026-07102-9)，*Scientific Data*（2026），DOI：`10.1038/s41597-026-07102-9`。论文列出的组装 accession 为 `JBPOCX000000000`；下载入口见论文 Data Records / Data availability。
- **YT：此前发表的基因组。** 资源论文：[Genomic and single-cell analyses reveal genetic signatures of swimming pattern and diapause strategy in jellyfish](https://www.nature.com/articles/s41467-024-49848-z)，*Nature Communications*（2024），DOI：`10.1038/s41467-024-49848-z`。本地使用 `Yantai` 命名，具体 NCBI 组装 accession、版本和文件校验和待补充。

方法中的 `QD`、`YT` 表示两套资源；本地文件使用 `QDv2`、`Yantai` 名称。基因组序列与对应的注释必须成套使用，不能在两套组装间直接互换坐标。

| 资源 | 本地文件 | 用途与当前状态 | 文件大小（bytes） |
| --- | --- | --- | --- |
| QD / QDv2 | `au.coerulea.QDv2.fasta` | 参考基因组 FASTA | 554,096,811 |
| QD / QDv2 | `au.coerulea.QDv2.fasta.fai` | 同名 FASTA 的随机访问索引 | 4,991 |
| QD / QDv2 | `au.coerulea.QDv2.gff` | 现有基线注释文件；不标作 CycloneSEQ 最终优化注释 | 26,090,569 |
| YT / Yantai | `au.coerulea.Yantai.fna` | 用于从头注释的参考基因组序列 | 582,168,116 |

当前 GFF 含有项目预处理形式的 gene/exon 记录，基线注释的格式整理与 CycloneSEQ 证据驱动的注释优化属于不同步骤。上述文件名与论文发布文件的版本、校验和对应关系仍需记录；文件大小来自本地文件系统，不代表本次已完成内容校验。

## 2. CycloneSEQ-based genome annotation optimization

以下流程根据项目提供的方法说明整理；软件版本与参数保留该说明中的记录，尚未在本次 README 更新中重新运行验证。

1. **长读长转录本建模。** 使用 IsoQuant（v3.10.0），将 CycloneSEQ 全长转录本证据与参考基因组结合。在有既有注释时采用注释引导策略，识别已知和新转录本；方法说明记录的参数包括 `--complete_genedb`。无基线注释的 YT 分支采用从头注释策略，具体命令需按该分支的实际运行记录提供。
2. **跨样本整合与结构比较。** 使用 Gffcompare（v0.12.10）整合不同样本的转录本结构，并在有参考注释时进行比较。
3. **转录本去冗余。** 使用 CD-HIT-EST（v4.8.1），以 `-c 0.98` 聚类转录本序列，减少转录起始位点变化等造成的冗余，获得非冗余转录本集。
4. **开放阅读框预测。** 使用 TransDecoder（v5.7.1）在去冗余转录本上预测候选 ORF，并生成候选蛋白序列。
5. **同源证据筛选。** 使用 DIAMOND（v2.1.13）检索 UniProtKB / Swiss-Prot 蛋白资源，以 **E-value < 1e−5** 为阈值保留有同源证据支持的预测。Swiss-Prot 是 UniProtKB 的人工审校部分，不能将二者简单理解为两个互不重叠的人工审校数据库；实际检索库的组成、发布版本及是否分别运行需在复现记录中明确。
6. **基因模型合并与优先级处理。** 汇总可用的参考注释、从头预测和 CycloneSEQ 支持的模型。发生基因组区间重叠时，优先保留同时获得 TransDecoder ORF 与同源证据支持的模型。

长读长输入及原始 CNSA 路径见 [AcoCycloneSeqData](../AcoCycloneSeqData/README.md)。两套参考基因组应用不同的注释策略，并不表示在两套基因组之间直接合并基因坐标。

软件与数据库入口：[IsoQuant](https://github.com/ablab/IsoQuant)、[Gffcompare](https://github.com/gpertea/gffcompare)、[CD-HIT](https://github.com/weizhongli/cdhit)、[TransDecoder](https://github.com/TransDecoder/TransDecoder)、[DIAMOND](https://github.com/bbuchfink/diamond)、[UniProtKB](https://www.uniprot.org/help/uniprotkb)。

## 3. 三套注释及比对比较

| 方法中的注释名称 | 所用基因组 | 注释策略 | 本目录的对应情况 |
| --- | --- | --- | --- |
| `QD_gff` | QD（本地 QDv2） | 既有基线注释，作为比较基准 | 现有 `au.coerulea.QDv2.gff`；具体用于比较的版本需与运行记录核对 |
| `QD_gff_refined` | QD（本地 QDv2） | 在基线注释上整合新转录本、ORF与同源证据，进行优化 | 最终优化注释尚未放入本目录，文件名和发布链接待补充 |
| `YT_gff_refined` | YT（本地 Yantai） | 以此前发表的组装为参考，采用从头注释策略构建完整注释 | 本目录目前只有参考序列；最终注释文件名和发布链接待补充 |

根据项目提供的比较结论，snRNA-seq reads 在 **`QD_gff_refined` 上获得最高比对率**。该结论支持使用 CycloneSEQ 转录本证据改善注释；本目录尚未附带三套注释的具体比对率、统计口径及原始报告，因此不填入未经提供的数值。单核测序输入见 [AcoDNBeLabC4Data](../AcoDNBeLabC4Data/README.md)。

## 4. 最终注释与复现材料

最终注释的公开仓库链接 **待补充**。方法草稿中的 `[repository link]XXXXXX` 是占位文字，不是可用下载地址。后续发布应为三套注释提供清晰的文件对应关系，并补充：

- 参考组装 accession、注释文件名、版本和 SHA256；明确最终发布文件是否经过额外的去重、ID重编号或格式转换。
- QD 与 YT 两个分支的完整命令、软件环境、数据库版本以及模型合并/重叠处理规则。
- 三套注释的 snRNA-seq 比对报告，明确使用的样本、工具版本、参数及比对率定义。

本次仅完善数据与方法说明，未生成、替换或移动基因组与注释文件。

[返回原始数据目录总览](../README.md)
