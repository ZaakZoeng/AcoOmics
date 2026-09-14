// 1. 定义物种配色表 (更新为指定的 9 种物种颜色)
const species_palette = {
    "Spla": "#fba414", 
    "ClH23": "#ffa8a7", 
    "HoH13": "#eb7f7f", 
    "TrH2": "#ff5d4e", 
    "TrH1": "#EC2B24", 
    "Auco": "#2A52BE", 
    "Clhe": "#4374B3", 
    "Neve": "#6DA0E2", 
    "Dare": "#43b244"
};

// 2. 假设你的原始数据 (基于你导出的 JSON 结构)
// 注意：item[2] 对应 species_idx
const rawData = NEURAL_ORIGIN_RAW_DATA; 

// 3. 数据分组处理逻辑
const groupMap = {};
const categories = ["Spla", "ClH23", "HoH13", "TrH2", "TrH1", "Auco", "Clhe", "Neve", "Dare"];

rawData.forEach(item => {
    const type = categories[item[2]] || "Unknown";
    if (!groupMap[type]) groupMap[type] = [];
    groupMap[type].push(item);
});

// 4. 生成 series 数组
const series = Object.keys(groupMap).map(type => {
  return {
    name: type,
    type: 'scatter',
    data: groupMap[type],
    symbolSize: 1, 
    large: true,
    largeThreshold: 500,
    // --- 新增性能优化参数 ---
    progressive: 5000,        // 每次渲染 5000 个点，不阻塞 UI
    progressiveThreshold: 3000, 
    blendMode: 'source-over', // 默认混合模式，如果背景是深色可尝试 'lighter'
    // -----------------------
    itemStyle: {
      color: species_palette[type] || '#999',
      opacity: 0.5            // 17万个点建议透明度再低一点，0.4-0.5 最佳
    },
    emphasis: { focus: 'series' }
  };
});

// 5. 最终的 Option 配置
option = {
  animation: false, // 核心优化：关闭所有初始和更新动画，极大地提升缩放流畅度
  
  title: {
    text: 'Metazoan Cross-species Atlas Colored by Species',
    left: 'center',
    top: '5%',
    textStyle: { 
      fontSize: 20, 
      fontWeight: 'normal'
    }
  },
  
  grid: {
    // left: '10%',
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
    confine: true,       // 必须开启，防止 17万点时提示框飘出画布
    backgroundColor: 'rgba(255, 255, 255, 0.9)',
    borderColor: '#ccc',
    borderWidth: 1,
    textStyle: { color: '#333' },
    formatter: function (params) {
      const d = params.data;
      // 从数据索引反推物种名
      const categories = ["Spla", "ClH23", "HoH13", "TrH2", "TrH1", "Auco", "Clhe", "Neve", "Dare"];
      const spName = categories[d[2]];
      return `
        <div style="padding:3px">
          <b style="color:${params.color}">${spName}</b><br/>
          <hr style="margin:5px 0; border:0; border-top:1px solid #eee; opacity:0.3"/>
          <b>Position:</b> (${d[0].toFixed(2)}, ${d[1].toFixed(2)})<br/>
          <b>Species:</b> ${spName}
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