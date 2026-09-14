# 候选 OG 导出与模型探索

按当前文件名和编号阅读；参见 [流程说明](../../docs/workflow.md) 和 [代码索引](../../docs/code_index.md)。

| 文件 | 用途 | 内核 | 说明 |
| --- | --- | --- | --- |
| [09.01_OGs_csv_exports_Python.ipynb](09.01_OGs_csv_exports_Python.ipynb) | 候选 OG 富集表 CSV/JSON 导出 | python | 保留当前正文和参数 |
| [09.02_ESM.sh](09.02_ESM.sh) | 候选 OG 蛋白 ESM2 表征与距离 | bash | 启用 ESM2 650M、layer 33、batch-size 1、截断长度 4096；09.03/09.04 读取另一条 35M 分支，不能直接串接默认输出。 |
| [09.03_ESM_plot_Python.ipynb](09.03_ESM_plot_Python.ipynb) | ESM2 35M 距离矩阵绘图 | python | 读取 ESM2 35M 的 OG0000036 距离矩阵，区别于 09.02 启用的 650M 分支。 |
| [09.04_TF_9_species_Python.ipynb](09.04_TF_9_species_Python.ipynb) | ESM2 embedding 和九物种 TF 输入整理 | python | 读取 ESM2 35M embedding，准备九物种 TranscriptFormer 输入；保留原候选 OG、下采样数量与随机种子。 |
| [09.05_TF.sh](09.05_TF.sh) | TranscriptFormer 候选 OG CGE 推断与汇总 | bash | 保留当前正文和参数 |
