# 09 · ESM2 与 TranscriptFormer 模型数据

保存候选 OG 蛋白、ESM2 embedding/距离矩阵，以及 TranscriptFormer 输入准备和预期输出位置。

[数据总览](../data.md) · [分析代码](../../analysis/)

## 当前收录情况

ESM2 35M/650M 两个分支各有 636 个蛋白 embedding、九个矩阵/元数据文件及七张图。TranscriptFormer 已有九物种下采样 h5ad、OG embedding 字典和物种 pkl；checkpoint、推断与汇总结果尚未就绪。

核查日期：2026-09-14。以下路径相对于本目录；说明依据当前文件清单和已有文档，不代表已完成数值复现。本轮仅补充汇总说明。

## 数据文件与目录

| 数据文件或数据目录 | 说明 |
| --- | --- |
| [ESM/input/Orthogroups.tsv](ESM/input/Orthogroups.tsv) | ESM 候选蛋白提取所用 OG 成员表。 |
| [ESM/input/candidate_ogs.txt](ESM/input/candidate_ogs.txt) | ESM 分析候选 OG 清单，决定后续蛋白提取范围。 |
| [ESM/input/species_metadata.tsv](ESM/input/species_metadata.tsv) | ESM 物种门类和显示顺序等元数据。 |
| [ESM/output](ESM/output) | 候选蛋白 FASTA、protein_to_og.tsv 及缺失蛋白等提取结果。 |
| [ESM/embeddings/esm2_t12_35M_candidate_ogs](ESM/embeddings/esm2_t12_35M_candidate_ogs) | 当前收录 636 个 ESM2 35M 蛋白级 .pt embedding；是模型计算中间结果。 |
| [ESM/embeddings/esm2_t33_650M_candidate_ogs](ESM/embeddings/esm2_t33_650M_candidate_ogs) | 当前收录 636 个 ESM2 650M 蛋白级 .pt embedding；与 35M 分支分开使用。 |
| [ESM/matrices/esm2_t12_35M](ESM/matrices/esm2_t12_35M) | 35M 的 species-specific OG embedding、元数据与距离矩阵；当前 09.03/09.04 读取此分支。 |
| [ESM/matrices/esm2_t33_650M](ESM/matrices/esm2_t33_650M) | 650M 的 OG embedding、元数据与距离矩阵；不能直接替换 35M 输入。 |
| [TranscriptFormer/OG_embeddings_user/candidate_ogs_species_specific_embeddings_dict.npy](TranscriptFormer/OG_embeddings_user/candidate_ogs_species_specific_embeddings_dict.npy) | 09.04 整理的 (OG, species) embedding 字典，供 TF 物种 embedding 文件生成。 |
| [TranscriptFormer/OG_embeddings_user/species_pkl](TranscriptFormer/OG_embeddings_user/species_pkl) | 各物种 candidate_ogs.esm2_embedding.pkl 及生成摘要；09.05 自定义 embedding 输入。 |
| [TranscriptFormer/input_h5ad_downsampled](TranscriptFormer/input_h5ad_downsampled) | 09.04 输出的下采样 OG 表达对象；normalized adata.X 与原始 counts 不能混同。 |
| [TranscriptFormer/inference_cge_candidate](TranscriptFormer/inference_cge_candidate) | 目前仅有九个物种空子目录，递归核查未发现结果文件；不能视为 CGE 推断已完成。 |
| [TranscriptFormer/cge_aggregated](TranscriptFormer/cge_aggregated) | 目前为空目录，尚无候选 OG × 物种 × 细胞类型的 CGE 汇总文件。 |
| [ESM/figures](ESM/figures) | 35M 与 650M 分支各有六候选 OG 距离热图和一张平均距离热图。 |
| [TranscriptFormer/checkpoints](TranscriptFormer/checkpoints) | 当前为空目录，未收录代码指定的 tf_metazoa 权重。 |
| [TranscriptFormer/OG_embeddings_user/candidate_ogs_species_specific_embeddings_metadata.csv](TranscriptFormer/OG_embeddings_user/candidate_ogs_species_specific_embeddings_metadata.csv) | OG/物种 embedding 的元数据，用于解释字典及物种专用 embedding。 |
| [ESM/scripts](ESM/scripts) | 候选蛋白提取、ESM embedding 与距离计算的三个辅助脚本。 |
| [TranscriptFormer/scripts](TranscriptFormer/scripts) | embedding/表达准备及 CGE 检查汇总的四个辅助脚本。 |

## 上下游关系

候选 OG/蛋白来自同源关系与候选基因分析，OG 表达来自 06。ESM2 蛋白表征汇总到 OG/物种，再准备 TF embedding 与表达输入。目录中的 scripts 为相关辅助代码，*.out 为运行日志而非成功标记。

## 尚未收录与使用说明

09.02 当前模型为 650M，09.03/09.04 读取 35M 分支，应核对具体输入。input_h5ad_candidate 与 checkpoints/tf_metazoa 不存在；checkpoints、cge_aggregated 为空，inference_cge_candidate 只有九个空物种子目录，不能称为已完成 CGE 推断。
