// 1. 空间组专用配色表与类别映射
// 这里的顺序必须与你 Python 导出时的 categories 顺序一致
const categories = ['Epidermal/Muscle', 'Cnidocytes', 'Sensory', 'Neural-related'];

const spatial_palette = {
  'Epidermal/Muscle': '#9467bd', 
  'Cnidocytes': '#17becf',       
  'Sensory': '#8c564b',          
  'Neural-related': '#2ca02c',   
  'Unknown': '#999999'
};

// 2. 你的原始数据 (由 Python 导出的 JSON 数组)
const rawData = NEURAL_ORIGIN_RAW_DATA; 

// 3. 数据分组处理逻辑 (修正：通过索引获取类别)
const groupMap = {};
rawData.forEach(item => {
    // 数据第3位（下标2）是类别索引，将其转为名称
    const typeIndex = item[2];
    const typeName = categories[typeIndex] || "Unknown";
    
    if (!groupMap[typeName]) groupMap[typeName] = [];
    groupMap[typeName].push(item);
});

// 4. 生成 series 数组
const series = Object.keys(groupMap).map(type => {
    return {
        name: type,
        type: 'scatter',
        data: groupMap[type],
        symbolSize: 1.5,     
        large: true,
        largeThreshold: 2000,
        itemStyle: {
            color: spatial_palette[type] || '#999',
            opacity: 0.8   
        },
        emphasis: { focus: 'series' }
    };
});

// 5. 最终的 Option 配置
var option = {
  title: {
    text: 'Moon Jellyfish {i|A. coerulea} Stereo-seq (bin50) Colored by Cell Type',
    left: 'center',
    top: '5%',
    textStyle: { 
      fontSize: 20, 
      fontWeight: 'normal',
      rich: { i: { fontStyle: 'italic', fontSize: 20 } }
    }
  },
  
  grid: {
    left: '10%',
    right: '26%',
    top: '12%',
    bottom: '12%',
    containLabel: true
  },

  xAxis: {
    scale: true,
    type: 'value',
    name: 'Spatial_X',
    nameLocation: 'middle',
    nameGap: 35,
    // --- 关键修改：强制 X 轴留在底部 ---
    position: 'bottom', 
    axisLine: { 
      onZero: false, // 不随 Y 轴 0 点移动
      lineStyle: { color: '#ccc' } 
    },
    splitLine: { show: true, lineStyle: { type: 'dashed' } }
  },

  yAxis: {
    scale: true,
    type: 'value',
    name: 'Spatial_Y',
    nameLocation: 'middle',
    nameGap: 45,
    inverse: true, // 保持 Y 轴翻转，匹配切片形态
    axisLine: { lineStyle: { color: '#ccc' } },
    splitLine: { show: true, lineStyle: { type: 'dashed' } }
  },
  
  // --- 需求 2：在底部添加图片 ---
  // graphic: [
  //   {
  //     type: 'image',
  //     id: 'background-tissue',
  //     left: 'center',
  //     // 这里建议通过计算或尝试，给图片一个固定的宽度，使其不随窗口缩放而变形
  //     style: {
  //       image: 'https://amoa.biometa.top/api/html/Aco_Stereo-seq_background.png',
  //       width: 650, 
  //       opacity: 0.35
  //     },
  //     top: '15%', // 调整图片起始位置，使其与 grid 区域大致重合
  //     z: -10
  //   }
  // ],

  toolbox: {
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
      // params.data 即为 [x, y, index]
      const val = params.data;
      const typeName = categories[val[2]] || "Unknown";
      return `
        <div style="padding:3px">
          <b style="color:${params.color}; font-size:14px">${typeName}</b><br/>
          <hr style="margin:5px 0; border:0; border-top:1px solid #eee; opacity:0.2"/>
          <b>Position:</b> (${val[0]}, ${val[1]})<br/>
          <b>Celltype:</b> ${typeName}
        </div>
      `;
    }
  },

  dataZoom: [
    { type: "inside", xAxisIndex: 0 },
    { type: "inside", yAxisIndex: 0 }
  ],

  series: series
};