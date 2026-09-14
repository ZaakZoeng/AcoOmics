# Figure code / 绘图代码

主分析中的 Python/R 绘图仍随各 notebook 保存，`analysis/00_figures` 是补充统计绘图。

## ECharts 笔记

`echarts_notes/` 保存原 Figures 中 10 个较小的代码笔记，逐字节保持原样。部分文件混有自然语言、R 配色或手工数据，不直接当作完整 JavaScript 程序。应按原小节选取代码，在匹配的 ECharts 编辑器/页面中使用。它们含原始颜色、数据及图形配置。

## 大型图谱模板

`echarts_templates/` 对应原 Figures 中 4 个含大量内嵌坐标的绘图文件。仅将 `const rawData = [...]` 的数组字面量替换为 `NEURAL_ORIGIN_RAW_DATA`；数组前后代码逐字保留，包括配色、类别、数据分组、坐标轴、透明度与图例配置。

先载入对应的原始数据数组并定义全局变量 `NEURAL_ORIGIN_RAW_DATA`，再执行**一个**模板；模板会设置 ECharts 编辑器使用的 `option`。普通网页可在已初始化图表实例后调用 `chart.setOption(option)`。模板使用相同顶层变量名，不应在同一作用域连续载入多个。

| 模板 | rawData 格式 | 原数组行数 |
| --- | --- | --- |
| Aco_Stereo-seq_echarts.js | `[x, y, category_index]` | 10,549 |
| Aco_snRNA-seq_echarts.js | 带 value、cell_name、Broad_cell_type 等字段的对象 | 32,660 |
| Integrated_umap_broadtype.js | `[UMAP_1, UMAP_2, category_index]` | 173,786 |
| Integrated_umap_species.js | `[UMAP_1, UMAP_2, species_index]` | 173,786 |

本轮没有复制这些大型坐标数据。原完整来源、数据数组 SHA256 与模板 SHA256 记录于 [figure_templates.json](../docs/figure_templates.json)。如果使用原 TXT，可用标准库提取其原数组（不改变行序或数值）：

```python
import json
from pathlib import Path

source = Path('/path/to/original/Figures/Aco_Stereo-seq_echarts.txt').read_text()
start = source.index('const rawData = ') + len('const rawData = ')
data, consumed = json.JSONDecoder().raw_decode(source[start:])
# 原始 JSON 数组字面量；写到新文件，避免覆盖已有数据。
with Path('Aco_Stereo-seq.rawData.json').open('x') as handle:
    handle.write(source[start:start + consumed])
```

原 Figures 中 `.json` 文件可能是包含类别/元数据的包装对象，不能不核对结构就整体赋给 rawData。读取模板所需数组后才执行绘图。Figures 顶层结果 `.html`、SVG、PNG/PDF 与已有组图现已整理到 [results](../results/README.md)；Reference 素材未作为分析结果复制。大型坐标 JSON 仍在原项目，路径见 [data.md](../data.md)。

[figure_code_map.tsv](../docs/figure_code_map.tsv) 只记录现有文件名在分析源码中的精确匹配。由变量拼接出的文件名、人工图表和组图不一定在表中，不能将未匹配视为缺失代码。
