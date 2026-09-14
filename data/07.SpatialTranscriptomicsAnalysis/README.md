# 07 · 空间注释、OG 对象与细胞通讯

保存 D2 的 TACCO 注释、Auco 单细胞/空间 OG 表达及 GRN/MDIC3 通讯结果。

[数据总览](../data.md) · [分析代码](../../analysis/)

## 当前收录情况

ST_annotated 当前仅有 Tacco_Auco_D2；保留 D2_mapped.h5ad 和两级细胞类型预测 CSV。SC/ST 两套表达、元数据、GRN 和通讯矩阵分别保留。

核查日期：2026-09-14。以下路径相对于本目录；说明依据当前文件清单和已有文档，不代表已完成数值复现。本轮仅补充汇总说明。

## 数据文件与目录

| 数据文件或数据目录 | 说明 |
| --- | --- |
| [ST_annotated/Tacco_Auco_D2/D2_mapped.h5ad](ST_annotated/Tacco_Auco_D2/D2_mapped.h5ad) | D2 经 TACCO 细胞类型迁移后的空间对象，保留预测/注释结果。 |
| [ST_annotated/Tacco_Auco_D2](ST_annotated/Tacco_Auco_D2) | D2 注释输出，含 D2_pred_Broad_cell_type.csv、D2_pred_Sub_cell_type.csv 及相关图像。 |
| [auco_sc_st/Auco.bin50.OGs.normalized.h5ad](auco_sc_st/Auco.bin50.OGs.normalized.h5ad) | 空间表达映射至 OG 的 AnnData；08.01 核心 OG 空间定位输入。 |
| [auco_sc_st/Auco.sc.OGs.normalized.h5ad](auco_sc_st/Auco.sc.OGs.normalized.h5ad) | 与空间对象对应的 Auco 单细胞 OG AnnData；08.01 对照表达输入。 |
| [auco_MDIC3](auco_MDIC3) | 07.03–07.05 的 SC/ST 表达矩阵、元数据、GRN 与 MDIC3 结果；按 Auco_SC/Auco_ST 区分。 |
| [auco_MDIC3/Auco_ST.exp.txt](auco_MDIC3/Auco_ST.exp.txt) | 空间细胞/spot 表达矩阵，GRNBoost2 和 MDIC3 的输入。 |
| [auco_MDIC3/Auco_SC.exp.txt](auco_MDIC3/Auco_SC.exp.txt) | 单细胞表达矩阵，SC 网络与通讯分析的输入。 |
| [auco_MDIC3/Auco_ST](auco_MDIC3/Auco_ST) | 空间 MDIC3 输出，含 cellular_communication.txt、celltype_communication.txt 等通讯结果。 |
| [auco_MDIC3/Auco_SC](auco_MDIC3/Auco_SC) | 单细胞 MDIC3 输出；与空间分支分开保存。 |
| [ST_bin50_DataH5ad/D2_bin50.h5ad](ST_bin50_DataH5ad/D2_bin50.h5ad) | 07 阶段另存的 D2 bin50 对象；与 04 阶段同名文件分属不同目录，本次未验证二者内容相等。 |
| [auco_MDIC3/Auco_ST.GRN.txt](auco_MDIC3/Auco_ST.GRN.txt) | 空间分支 GRN 推断矩阵。 |
| [auco_MDIC3/Auco_SC.GRN.txt](auco_MDIC3/Auco_SC.GRN.txt) | 单细胞分支 GRN 推断矩阵。 |
| [auco_MDIC3/Auco_ST.metadata.txt](auco_MDIC3/Auco_ST.metadata.txt) | 空间表达矩阵配套标签/元数据。 |
| [auco_MDIC3/Auco_SC.metadata.txt](auco_MDIC3/Auco_SC.metadata.txt) | 单细胞表达矩阵配套标签/元数据。 |

## 上下游关系

04 空间对象与 06 单细胞注释用于迁移；auco_sc_st 的两份 OG h5ad 供 08 核心 OG 表达定位。auco_MDIC3 的 exp/metadata/GRN 及通讯输出供网络与通讯图使用。

## 尚未收录与使用说明

当前没有 F3 注释分支。ST_bin50_DataH5ad 中的 D2 与 04 阶段同名对象属于不同路径，未验证相等；SC 与 ST 通讯矩阵不互换，Top2000/Top5000 边表是不同筛选版本。
