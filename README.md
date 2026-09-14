# NeuralOrigin

Aurelia coerulea Multi-Omics Analysis



Comparative multi-omics analysis of early eumetazoans elucidates cell-type diversity and the origins of nervous systems.

比较多组学分析早期真后生动物的细胞类型多样性与神经系统起源。本仓库按当前分析编号整理基因组、单细胞、空间转录组与候选基因分析代码。

**当前包含代码整理、结果图片和重要数据路径说明。** 以用户调整后的 71 个 analysis 文件为当前版本；本轮保留其分析参数、模型、随机种子、基因集合与代码正文；notebook 增加导读、清除历史输出并规范元数据。已纳入 Figures 的 253 个结果文件；大型分析数据尚未复制，可访问amoa.biometa.top/查阅下载。数据路径见 [data.md](data.md)，图片见 [results](results/README.md)。

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
