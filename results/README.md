# NeuralOrigin results / 结果图片

本目录收录原 Figures 顶层的 **159 张静态图、11 个交互式 HTML**，以及 Figures/Results 中的 **83 张已有图版**，共 **253 个原始结果文件**。保留全部原文件字节、分辨率、原图号和格式；没有重新计算、重画、压缩或覆盖原结果。

## 按分析主题阅读

| 目录 | 内容 | 文件数 |
| --- | --- | --- |
| [00_figures](00_figures/README.md) | 测序饱和度与补充统计 | 4 |
| [03_single_cell_processing](03_single_cell_processing/README.md) | 单细胞质控、聚类与标记基因 | 24 |
| [05_genome_analysis](05_genome_analysis/README.md) | 基因家族演化与节点富集 | 18 |
| [06_single_cell_analysis](06_single_cell_analysis/README.md) | 细胞注释、跨物种图谱与神经功能 | 70 |
| [07_spatial_analysis](07_spatial_analysis/README.md) | 空间图谱、表达与细胞通讯 | 33 |
| [08_hub_genes](08_hub_genes/README.md) | 核心基因与网络 | 14 |
| [context](context/README.md) | 组织图像与系统发育背景资料 | 7 |
| [assembled](assembled/README.md) | 已有组图与图版 | 83 |

## 代码对应关系

[results_code_map.tsv](../docs/results_code_map.tsv) 提供当前代码路径、原 cell/行号、证据类型与源码片段。文件名引用和动态输出模板比主题关联更直接，但都不是结果已复现的证明；被注释的命令、读取图像的代码也可能形成引用。SVG/HTML 经常来自 ECharts 笔记和人工导出。

图号 70/71 的相关 GO 绘图仍存在于当前 06.16，不能因为旧独立 GSEA 分支被移除就认定它们都没有对应代码。53–57 等背景图、75–77 部分外部工具/人工结果及 assembled 图版的精确生成关系尚未确认，索引已标注。

## 格式与使用

PNG/JPG 可在 GitHub 直接预览；PDF/SVG 保留用于放大和排版，同一结果的不同格式并列列出。文件名中的空格、`#`、`&` 已在链接中编码。

HTML 为原交互式导出，GitHub 文件页通常只显示源码，需下载后在浏览器打开。ECharts HTML 中含 CDN 脚本及示例依赖，不能保证完全离线可用；资源地址见 [外部资源清单](../docs/results_external_resources.tsv)。本轮未执行 HTML 或联网下载其依赖。

## 来源与范围

- [完整结果索引](../docs/results_index.tsv)：来源、目标、文件大小、SHA256、状态和说明。
- [结果来源清单](../docs/results_manifest.json)：逐文件证据与资源引用。
- [未纳入文件](../docs/results_excluded.tsv)：31 个 Reference 素材及顶层数组/笔记/表；原文件仍保留在原项目。代码笔记见 [visualization](../visualization/README.md)。

Data 中的计算结果和 Codes 中的零散结果图未在本轮复制；本目录聚焦用户指定 Figures 的结果图片。尚未提供完整输入数据，也未进行数值复现或确认论文最终图版。

## 校验

从仓库根目录运行：

```bash
python tools/validate_results.py
python tools/validate_results.py --original-root /share/home/zhangze/zz/NeuralOrigin
```

检查文件覆盖、SHA256、代码引用和原件一致性，不执行分析或改动结果。

本轮验证：253 个文件与原件 SHA256 一致；149 张 PNG/JPG 通过图像完整性检查，18 个 SVG 通过 XML 解析，75 个 PDF 通过文件头/结尾检查。文档链接与数据路径已核对。详见 [验证记录](../docs/results_validation.json)；未进行完整 PDF 渲染或数值复现。
