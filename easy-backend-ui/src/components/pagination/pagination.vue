<template>
	<div class="lz-margin-top-15">
    <el-pagination v-if="type == 0"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="currentPage"
        :page-sizes="pageSizes"
        :page-size="pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total">
    </el-pagination>

    <el-pagination v-if="type == 1" :current-page="currentPage" :page-size="pageSize" @current-change="handleCurrentChange" background
                   layout="prev, pager, next" :total="totalCount">
    </el-pagination>
	</div>
</template>
<!-- 
	使用用例 
	<pagination :total="totalCount" :current-page="currentPage" :page-size="pageSize" @handleCurrentChange="handleCurrentChange" @handleSizeChange="handleSizeChange"></pagination>

	import Pagination from '@/components/pagination/pagination'

	components: {
		Pagination
	},

	 //改变当前页数，重新加载数据
	handleCurrentChange: function (val) {
    this.$data.currentPage = val;
    this.pageList();
  },
  //改变每页显示数量，重新加载数据
  handleSizeChange: function (val) {
    this.$data.currentPage = 1;
    this.$data.pageSize = val;
    this.pageList();
  },

-->


<script>
	export default {
		props: {
      type:{
        type:Number,
        require:false,
        default(){
          return 0
        }
      },
      total:{
        type:Number,
        require:true
      },
      currentPage:{
        type:Number,
        require:false,
        default(){
          return 1
        }
      },
      pageSize:{
        type:Number,
        require:false,
        default(){
          return 10
        }
      },
      pageSizes:{
			  type:Array,
        require:false,
        default(){
			    return [10, 20, 50, 100, 200, 300, 400, 500]
        }
      }
		},
		data() {
			return {

			}
		},
		methods: {
		  //每页条数改变
      handleSizeChange(val) {
        console.log(`每页 ${val} 条`);
        this.$emit('handleSizeChange',val)
      },
      //页数改变
      handleCurrentChange(val) {
        console.log(`当前页: ${val}`);
        this.$emit('handleCurrentChange',val)
      }
		}
	}
</script>

<style scoped lang="scss">

</style>
