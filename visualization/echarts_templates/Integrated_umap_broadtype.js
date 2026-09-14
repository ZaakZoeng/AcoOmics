// 1. 定义 BroadType 配色表 (严格匹配你提供的 palette)
const broad_palette = {
    'Cnidocytes': '#17becf',
    'Epidermal/Muscle': '#9467bd',
    'Gland': '#d62728',
    'Sensory': '#8c564b',
    'Neural': '#2ca02c',
    'Stem/Germline': '#fedb61',
    'Unknow': '#707070'
};

// 2. 类别定义 (严格匹配你提供的 categories 顺序)
const categories = [
    "Cnidocytes",
    "Epidermal/Muscle",
    "Gland",
    "Sensory",
    "Neural",
    "Stem/Germline",
    "Unknow"
];

// 3. 原始数据 (示例结构: [x, y, idx])
const rawData = NEURAL_ORIGIN_RAW_DATA; 

// 4. 数据分组处理逻辑
const groupMap = {};
rawData.forEach(item => {
    // 关键点：在你提供的 data 示例中，类别索引位于 item[2]
    const typeIndex = item[2];
    const typeName = categories[typeIndex] || "Unknow";
    
    if (!groupMap[typeName]) groupMap[typeName] = [];
    groupMap[typeName].push(item);
});

// 5. 生成 series 数组
const series = Object.keys(groupMap).map(type => {
  return {
    name: type,
    type: 'scatter',
    data: groupMap[type],
    symbolSize: 1,           // 17万个点建议保持 1
    large: true,
    largeThreshold: 500,
    progressive: 5000,       // 分片渲染优化性能
    progressiveThreshold: 3000,
    itemStyle: {
      color: broad_palette[type] || '#707070',
      opacity: 0.5           
    },
    emphasis: { focus: 'series' }
  };
});

// 6. 最终的 Option 配置
option = {
  animation: false, // 禁用动画，保证缩放丝滑
  
  title: {
    text: 'Metazoan Cross-species Atlas Colored by BroadType',
    left: 'center',
    top: '5%',
    textStyle: { fontSize: 20, fontWeight: 'normal' }
  },
  
  grid: {
    right: '26%',
    top: '12%',
    bottom: '12%',
    containLabel: true
  },

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

  toolbox: {
    left: '75%',
    feature: {
      dataZoom: { title: { zoom: 'Zoom', back: 'Reset'} },
      restore: { title: 'Restore' },
      saveAsImage: { title: 'Download' }
    }
  },

  legend: {
    orient: 'vertical',
    left: '75%',
    top: 'center',
    itemWidth: 10,
    itemHeight: 10,
    icon: 'circle',
    selectedMode: 'multiple'
  },

  tooltip: {
    trigger: 'item',
    confine: true,
    backgroundColor: 'rgba(255, 255, 255, 0.9)',
    borderColor: '#ccc',
    borderWidth: 1,
    textStyle: { color: '#333' },
    formatter: function (params) {
      const d = params.data;
      const typeName = categories[d[2]]; // 使用索引 d[2]
      return `
        <div style="padding:3px">
          <b style="color:${params.color}">${typeName}</b><br/>
          <hr style="margin:4px 0; border:0; border-top:1px solid #eee; opacity:0.3"/>
          <b>Position:</b> (${d[0].toFixed(2)}, ${d[1].toFixed(2)})<br/>
          <b>BroadType:</b> ${typeName}
        </div>
      `;
    }
  },
  
  dataZoom: [
    { type: "inside", xAxisIndex: 0, throttle: 50 },
    { type: "inside", yAxisIndex: 0, throttle: 50 }
  ],
  
  series: series
};