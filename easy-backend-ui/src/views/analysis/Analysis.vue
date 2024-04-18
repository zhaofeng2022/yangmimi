<template>
  <div>
    <el-row :gutter="20">
      <el-col :span="8">
        <div>
          <Echarts :option="lineOption" style="height: 400px" />
        </div>
      </el-col>
      <el-col :span="8">
        <div>
          <Echarts :option="barOption" style="height: 400px" />
        </div>
      </el-col>
      <el-col :span="8">
        <div>
          <Echarts :option="pieOption" style="height: 400px" />
        </div>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="8">
        <div>
          <Echarts :option="scatterOption" style="height: 400px" />
        </div>
      </el-col>
      <el-col :span="8">
        <div>
          <Echarts :option="radarOption" style="height: 400px" />
        </div>
      </el-col>
      <el-col :span="8">
        <div>
          <Echarts :option="gaugeOption" style="height: 400px" />
        </div>
      </el-col>
    </el-row>
    <el-row :gutter="20">
      <el-col :span="8">
        <div>
          <Echarts :option="graphOption" style="height: 400px" />
        </div>
      </el-col>
    </el-row>
  </div>
</template>

<script>
import Echarts from "../../components/charts/Echarts";

export default {
  components: {
    Echarts,
  },
  data() {
    return {
      lineOption: {
        xAxis: {
          type: "category",
          data: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
        },
        yAxis: {
          type: "value",
        },
        series: [
          {
            data: [150, 230, 224, 218, 135, 147, 260],
            type: "line",
          },
        ],
      },
      barOption: {
        xAxis: {
          type: "category",
          data: ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"],
        },
        yAxis: {
          type: "value",
        },
        series: [
          {
            data: [150, 230, 224, 218, 135, 147, 260],
            type: "bar",
          },
        ],
      },
      pieOption: {
        title: {
          text: "某站点用户访问来源",
          subtext: "纯属虚构",
          left: "center",
        },
        tooltip: {
          trigger: "item",
          formatter: "{a} <br/>{b} : {c} ({d}%)",
        },
        legend: {
          orient: "vertical",
          left: "left",
        },
        series: [
          {
            name: "访问来源",
            type: "pie",
            radius: "50%",
            data: [
              { value: 1048, name: "搜索引擎" },
              { value: 735, name: "直接访问" },
              { value: 580, name: "邮件营销" },
              { value: 484, name: "联盟广告" },
              { value: 300, name: "视频广告" },
            ],
            emphasis: {
              itemStyle: {
                shadowBlur: 10,
                shadowOffsetX: 0,
                shadowColor: "rgba(0, 0, 0, 0.5)",
              },
            },
          },
        ],
      },
      scatterOption: {
        xAxis: {},
        yAxis: {},
        series: [
          {
            symbolSize: 20,
            data: [
              [10.0, 8.04],
              [8.07, 6.95],
              [13.0, 7.58],
              [9.05, 8.81],
              [11.0, 8.33],
              [14.0, 7.66],
              [13.4, 6.81],
              [10.0, 6.33],
              [14.0, 8.96],
              [12.5, 6.82],
              [9.15, 7.2],
              [11.5, 7.2],
              [3.03, 4.23],
              [12.2, 7.83],
              [2.02, 4.47],
              [1.05, 3.33],
              [4.05, 4.96],
              [6.03, 7.24],
              [12.0, 6.26],
              [12.0, 8.84],
              [7.08, 5.82],
              [5.02, 5.68],
            ],
            type: "scatter",
          },
        ],
      },
      radarOption: {
        title: {
          text: "基础雷达图",
        },
        tooltip: {},
        legend: {
          data: ["预算分配（Allocated Budget）", "实际开销（Actual Spending）"],
        },
        radar: {
          // shape: 'circle',
          name: {
            textStyle: {
              color: "#fff",
              backgroundColor: "#999",
              borderRadius: 3,
              padding: [3, 5],
            },
          },
          indicator: [
            { name: "销售（sales）", max: 6500 },
            { name: "管理（Administration）", max: 16000 },
            { name: "信息技术（Information Techology）", max: 30000 },
            { name: "客服（Customer Support）", max: 38000 },
            { name: "研发（Development）", max: 52000 },
            { name: "市场（Marketing）", max: 25000 },
          ],
        },
        series: [
          {
            name: "预算 vs 开销（Budget vs spending）",
            type: "radar",
            // areaStyle: {normal: {}},
            data: [
              {
                value: [4300, 10000, 28000, 35000, 50000, 19000],
                name: "预算分配（Allocated Budget）",
              },
              {
                value: [5000, 14000, 28000, 31000, 42000, 21000],
                name: "实际开销（Actual Spending）",
              },
            ],
          },
        ],
      },
      gaugeOption: {
        tooltip: {
          formatter: "{a} <br/>{b} : {c}%",
        },
        series: [
          {
            name: "Pressure",
            type: "gauge",
            detail: {
              formatter: "{value}",
            },
            data: [
              {
                value: 50,
                name: "SCORE",
              },
            ],
          },
        ],
      },
      graphOption: {
        title: {
          text: "疫情关系图",
        },
        tooltip: {                  // 提示框的配置
          formatter: function(param) {
            return param.data.name;
          }
        },
        series: [{
          type: "graph",          // 系列类型:关系图
          top: '10%',             // 图表距离容器顶部的距离
          roam: true,             // 是否开启鼠标缩放和平移漫游。默认不开启。如果只想要开启缩放或者平移，可以设置成 'scale' 或者 'move'。设置成 true 为都开启
          focusNodeAdjacency: true,   // 是否在鼠标移到节点上的时候突出显示节点以及节点的边和邻接节点。[ default: false ]
          force: {                // 力引导布局相关的配置项，力引导布局是模拟弹簧电荷模型在每两个节点之间添加一个斥力，每条边的两个节点之间添加一个引力，每次迭代节点会在各个斥力和引力的作用下移动位置，多次迭代后节点会静止在一个受力平衡的位置，达到整个模型的能量最小化。
            // 力引导布局的结果有良好的对称性和局部聚合性，也比较美观。
            repulsion: 600,            // [ default: 50 ]节点之间的斥力因子(关系对象之间的距离)。支持设置成数组表达斥力的范围，此时不同大小的值会线性映射到不同的斥力。值越大则斥力越大
            edgeLength: [200, 100]      // [ default: 30 ]边的两个节点之间的距离(关系对象连接线两端对象的距离,会根据关系对象值得大小来判断距离的大小)，
                                        // 这个距离也会受 repulsion。支持设置成数组表达边长的范围，此时不同大小的值会线性映射到不同的长度。值越小则长度越长。如下示例:
                                        // 值最大的边长度会趋向于 10，值最小的边长度会趋向于 50      edgeLength: [10, 50]
          },
          layout: "force",            // 图的布局。[ default: 'none' ]
                                      // 'none' 不采用任何布局，使用节点中提供的 x， y 作为节点的位置。
                                      // 'circular' 采用环形布局;'force' 采用力引导布局.
          // 标记的图形
          symbol: 'circle',
          lineStyle: {            // 关系边的公用线条样式。其中 lineStyle.color 支持设置为'source'或者'target'特殊值，此时边会自动取源节点或目标节点的颜色作为自己的颜色。
            normal: {
              color: '#000',          // 线的颜色[ default: '#aaa' ]
              width: 1,               // 线宽[ default: 1 ]
              type: 'solid',          // 线的类型[ default: solid ]   'dashed'    'dotted'
              opacity: 0.5,           // 图形透明度。支持从 0 到 1 的数字，为 0 时不绘制该图形。[ default: 0.5 ]
              curveness: 0            // 边的曲度，支持从 0 到 1 的值，值越大曲度越大。[ default: 0 ]
            }
          },
          label: {                // 关系对象上的标签
            normal: {
              show: true,                 // 是否显示标签
              position: "inside",         // 标签位置:'top''left''right''bottom''inside''insideLeft''insideRight''insideTop''insideBottom''insideTopLeft''insideBottomLeft''insideTopRight''insideBottomRight'
              textStyle: {                // 文本样式
                fontSize: 10
              }
            }
          },
          // edgeLabel: {                // 连接两个关系对象的线上的标签
          //   normal: {
          //     show: false,
          //     textStyle: {
          //       fontSize: 14
          //     },
          //     formatter: function(param) {        // 标签内容
          //       return param.data.category;
          //     }
          //   }
          // },
          data: [{
            name: "小张",
            draggable: true,                // 节点是否可拖拽，只在使用力引导布局的时候有用。
            symbolSize: [50, 50],         // 关系图节点标记的大小，可以设置成诸如 10 这样单一的数字，也可以用数组分开表示宽和高，例如 [20, 10] 表示标记宽为20，高为10。
            itemStyle: {
              color: '#ff0000'				// 关系图节点标记的颜色
            },
            category: "确诊病例"         // 数据项所在类目的 index。
          }, {
            name: "小明",
            draggable: true,
            symbolSize: [40, 40],
            itemStyle: {
              color: '#00ff00'
            },
            category: "密切接触者"
          }, {
            name: "小刘",
            draggable: true,
            symbolSize: [40, 40],
            itemStyle: {
              color: '#00ff00'
            },
            category: "密切接触者"
          }, {
            name: "小李",
            draggable: true,
            symbolSize: [30, 30],
            itemStyle: {
              color: '#bb00ff'
            },
            category: "次密切接触者"
          }, {
            name: "小王",
            draggable: true,
            symbolSize: [30, 30],
            itemStyle: {
              color: '#bb00ff'
            },
            category: "次密切接触者"
          }],
          categories: [{              // 节点分类的类目，可选。如果节点有分类的话可以通过 data[i].category 指定每个节点的类目，类目的样式会被应用到节点样式上。图例也可以基于categories名字展现和筛选。
            name: "确诊病例"            // 类目名称，用于和 legend 对应以及格式化 tooltip 的内容。
          }, {
            name: "密切接触者"
          }, {
            name: "次密切接触者"
          }],
          links: [{                   // 节点间的关系数据
            target: "小明",
            source: "小张",
            // category: "收入+"              // 关系对象连接线上的标签内容
          }, {
            target: "小刘",
            source: "小张",
            // category: "支出-"
          }, {
            target: "小李",
            source: "小刘",
            // category: "支出-"
          }, {
            target: "小王",
            source: "小刘",
            // category: "剩余="
          }]
        }],
        animationEasingUpdate: "quinticInOut",
        animationDurationUpdate: 50
      },
    };
  },
};
</script>

<style>
</style>