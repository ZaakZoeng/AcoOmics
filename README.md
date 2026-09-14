# NeuralOrigin

Comparative multi-omics analysis of early eumetazoans elucidates cell-type diversity and the origins of nervous systems.

比较多组学分析早期真后生动物的细胞类型多样性与神经系统起源。本仓库按当前分析编号整理基因组、单细胞、空间转录组与候选基因分析代码。

**当前包含代码整理、结果图片和重要数据路径说明。** 以用户调整后的 71 个 analysis 文件为当前版本；本轮保留其分析参数、模型、随机种子、基因集合与代码正文；notebook 增加导读、清除历史输出并规范元数据。已纳入 Figures 的 253 个结果文件；大型分析数据尚未复制，完整流程尚未复跑。数据路径见 [data.md](data.md)，图片见 [results](results/README.md)。

## 从这里开始

1. 阅读 [分析流程与运行方法](docs/workflow.md)，按输入依赖选择分支。
2. 使用 [代码逐文件索引](docs/code_index.md) 找到对应 notebook 或脚本。
3. 核对 [环境依赖](docs/environments.md) 和 [已知问题](docs/known_issues.md)。
4. 通过 [整理记录与验证方法](docs/curation.md) 检查代码是否保持一致。

## 数据与结果

- [重要数据及中间结果路径](data.md)：数据文件/目录与说明，包含缺失及空目录状态。
- [结果图片总览](results/README.md)：159 张静态图、11 个交互式 HTML、83 张已有图版及当前代码对应关系。

## 目录

| 目录 | 内容 |
| --- | --- |
| [analysis/00_figures](analysis/00_figures) | 补充统计绘图 |
| [analysis/01_preprocessing](analysis/01_preprocessing) | 测序与公共数据预处理 |
| [analysis/02_genome_processing](analysis/02_genome_processing) | GFF 优化与蛋白序列处理 |
| [analysis/03_single_cell_processing](analysis/03_single_cell_processing) | dnbc4tools、Seurat、格式转换 |
| [analysis/04_spatial_processing](analysis/04_spatial_processing) | 空间流程注释格式转换 |
| [analysis/05_genome_analysis](analysis/05_genome_analysis) | OrthoFinder、CAFE5、功能注释与富集 |
| [analysis/06_single_cell_analysis](analysis/06_single_cell_analysis) | 注释、跨物种比较、神经功能涌现、DNB |
| [analysis/07_spatial_analysis](analysis/07_spatial_analysis) | TACCO、空间图谱、调控网络与通讯 |
| [analysis/08_hub_genes](analysis/08_hub_genes) | 核心基因表达与网络 |
| [analysis/09_ai_analysis](analysis/09_ai_analysis) | 富集表导出、ESM2、TranscriptFormer |
| [analysis/exploratory](analysis/exploratory) | 未编号探索性分析 |
| [support](support) | 原来存放于 Data 的依赖代码及公共数据转换 |
| [visualization](visualization) | 原来存放于 Figures 的绘图代码 |
| [tools](tools) | 路径适配和静态一致性校验工具 |
| [docs](docs) | 代码、路径、数据布局、依赖及来源索引 |

文件名与编号已同步用户调整；新旧名称、7 个移除分支及 5 个用户修改的 shell 见 [更新记录](docs/renaming_update.md)。编号不意味着可以把所有文件串联后直接运行。

## 代码检查

从仓库根目录运行：

```bash
python tools/validate_repository.py
```

有原项目目录时还可逐单元格对照原文件：

```bash
python tools/validate_repository.py --original-root /share/home/zhangze/zz/NeuralOrigin
```

这些命令只解析和比较代码，不运行生物学分析。软件、数据库、数据文件与模型权重需按步骤另外准备。
