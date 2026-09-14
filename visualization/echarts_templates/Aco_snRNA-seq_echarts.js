// 1. 定义配色表
const broad_palette = {
  'CN, Cnidocytes/Nematocyte cell': '#17becf',
  'EM, Epidermal/Muscle cell': '#9467bd',
  'GA, Gastrodermal cell': '#ff7f0e',
  'GL, Gland cell': '#d62728',
  'HA, Hair cell': '#8c564b',
  'NE, Neural cell': '#2ca02c',
  'SG, Stem/Germline cell': '#fedb61'
};

// 2. 假设你的原始数据存放在这里 (模拟 payload)
const rawData = NEURAL_ORIGIN_RAW_DATA;

// 3. 数据分组处理逻辑
const groupMap = {};
rawData.forEach(item => {
    const type = item.Broad_cell_type || "Unknown";
    if (!groupMap[type]) groupMap[type] = [];
    groupMap[type].push(item);
});

// 4. 生成 series 数组
const series = Object.keys(groupMap).map(type => {
    return {
        name: type,
        type: 'scatter',
        data: groupMap[type],
        symbolSize: 4, // 单细胞点通常建议小一点
        large: true,   // 性能优化开关
        itemStyle: {
            color: broad_palette[type] || '#999'
        }
    };
});

// 5. 最终的 Option 配置
option = {
  // backgroundColor: 'transparent',
  title: {
    // 使用 rich 样式标记：{i|...} 对应下面 rich 中的 i 配置
    text: 'Moon Jellyfish {i|A. coerulea} snRNA-seq Atlas Colored by Cell Type', 
    left: 'center',
    top: '5%',
    textStyle: { 
      fontSize: 20,
      fontWeight: 'normal',
      // 定义富文本样式
      rich: {
        i: {
          fontStyle: 'italic', // 设置为斜体
          fontSize: 20,        // 保持与主标题字号一致
        }
      }
    }
  },
  
  // 调整布局，右侧留出足够空间给滚动的 Legend
  grid: {
    left: '10%',
    right: '26%',
    top: '12%',
    bottom: '12%',
    containLabel: true
  },

  // 坐标轴配置：仿照截图的刻度和标签
  xAxis: {
    scale: true,
    type: 'value',
    name: 'UMAP_1',
    nameLocation: 'middle',
    nameGap: 35,
    axisLine: { lineStyle: { color: '#ccc' } },
    splitLine: { show: true, lineStyle: { type: 'dashed' } }
  },
  yAxis: {
    scale: true,
    type: 'value',
    name: 'UMAP_2',
    nameLocation: 'middle',
    nameGap: 45,
    axisLine: { lineStyle: { color: '#ccc' } },
    splitLine: { show: true, lineStyle: { type: 'dashed' } }
  },

  // 仿照截图右上角的交互工具栏
  toolbox: {
    feature: {
      dataZoom: { title: { zoom: 'Zoom', back: 'Reset'} },
      restore: { title: 'Restore' },
      saveAsImage: { title: 'Download' }
    }
  },

  // 右侧垂直滚动的图例
  legend: {
    orient: 'vertical',
    left: '75%',
    top: 'center',
    itemWidth: 10,
    itemHeight: 10,
    icon: 'circle', // 圆点图例
    selectedMode: 'multiple'   // 允许点击筛选
  },

  tooltip: {
    trigger: 'item',
    backgroundColor: 'rgba(255, 255, 255, 0.9)',
    borderColor: '#ccc',
    borderWidth: 1,
    textStyle: { color: '#333' },
    formatter: function (params) {
      const d = params.data;
      return `
        <div style="padding:3px">
          <b style="color:${params.color}">${d.Broad_cell_type}</b><br/>
          <b>ID:</b> ${d.cell_name}<br/>
          <b>Celltype:</b> ${d.Broad_cell_type}<br/>
          <b>Subtype:</b> ${d.Sub_cell_type}<br/>
          <b>Cluster:</b> ${d.seurat_clusters}<br/>
          <b>Batch:</b> ${d.batch}
        </div>
      `;
    }
  },
  
  dataZoom: [
    { type: "inside", xAxisIndex: 0 },
    { type: "inside", yAxisIndex: 0 }
  ],
  // 每一个 Broad_cell_type 作为一个单独的 series，以实现 Legend 独立控制
  series: series // 此处 series 变量沿用你之前分组生成的数组
};