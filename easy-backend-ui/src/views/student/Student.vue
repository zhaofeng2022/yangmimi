<template>
    <div>
        <el-row>
            <el-form :inline="true" :model="searchForm" ref="searchForm" class="demo-form-inline" >
                            <el-form-item label="姓名" prop="name">
                                <el-input v-model.trim="searchForm.name" placeholder="">
                                </el-input>
                            </el-form-item>
                            <el-form-item label="时间" prop="time">
                                <el-date-picker type="datetime" v-model.trim="searchForm.time" placeholder="">
                                </el-date-picker>
                            </el-form-item>
                <el-form-item>
                    <el-button type="primary" @click="onSearch">查 询</el-button>
                    <el-button @click="resetSearchForm">重 置</el-button>
                </el-form-item>
            </el-form>
        </el-row>
        <!-- 添加和删除按钮区域 -->
        <el-row class="lz-padding-bottom-15">
            <el-button type="primary" @click="addHandleClick" v-auth="['/student/saveOrUpdate']">添加</el-button>
            <el-button type="danger" @click="batchDelete" v-auth="['/student/delete']">批量删除</el-button>
            <el-button type="primary" @click="exportExcel" v-auth="['/student/export']">
                导出数据
            </el-button>
        </el-row>
        <!-- 数据列表表单区域 -->
        <el-table :data="tableData" border style="width: 100%" @selection-change="handleSelectionChange">
            <el-table-column
                    type="index"
                    label="序号"
                    width="60"
                    align="center"
                    :index="indexMethod"
            ></el-table-column>
                      <el-table-column
                              prop="id"
                              label="ID"
                      ></el-table-column>
                      <el-table-column
                              prop="name"
                              label="姓名"
                      ></el-table-column>
                      <el-table-column
                              prop="sex"
                              label="性别"
                      ></el-table-column>
                      <el-table-column
                              prop="age"
                              label="年龄"
                      ></el-table-column>
                      <el-table-column
                              prop="classid"
                              label="班级"
                      ></el-table-column>
                      <el-table-column
                              prop="school"
                              label="学校"
                      ></el-table-column>
                      <el-table-column
                              prop="nianji"
                              label="年纪"
                      ></el-table-column>
                      <el-table-column
                              prop="state"
                              label="状态"
                      ></el-table-column>
                      <el-table-column
                              prop="time"
                              label="时间"
                              :formatter="carTimeFilter"
                      ></el-table-column>
                      <el-table-column
                              prop="leibie"
                              label="类别"
                      ></el-table-column>
                      <el-table-column
                              prop="phone"
                              label="手机号"
                      ></el-table-column>
                      <el-table-column
                              prop="code"
                              label="编码"
                      ></el-table-column>
                      <el-table-column
                              prop="suoshu"
                              label="所属"
                      ></el-table-column>

            <el-table-column fixed="right" label="操作" >
                <template slot-scope="scope">
                    <el-button type="text" @click="editorHandleClick(scope.row)" v-auth="['/student/saveOrUpdate']" size="small">编辑</el-button>
                    <el-button @click="deleteHandleClick(scope.row)" type="text" v-auth="['/student/delete']" size="small">禁用</el-button>
                </template>
            </el-table-column>
        </el-table>
        <!-- 列表分页操作区域 -->
        <pagination :total="totalCount" :current-page="currentPage" :page-size="pageSize" @handleCurrentChange="handleCurrentChange" @handleSizeChange="handleSizeChange"></pagination>
        <!-- 编辑和添加页面定义 -->
        <el-dialog :title="isEditor ? '编辑' : '添加'" :visible.sync="dialogAddFormVisible">
            <el-form :model="dialogForm" :rules="rules" ref="dialogForm">
                <el-input type="hidden" v-model="dialogForm.id" autocomplete="off"></el-input>

                             <el-form-item prop="name" label="" :label-width="dialogFormLabelWidth">
                                 <el-input v-model="dialogForm.name" autocomplete="off"></el-input>
                             </el-form-item>

                             <el-form-item prop="sex" label="" :label-width="dialogFormLabelWidth">
                                 <el-input v-model="dialogForm.sex" autocomplete="off"></el-input>
                             </el-form-item>

                             <el-form-item prop="age" label="" :label-width="dialogFormLabelWidth">
                                 <el-input v-model="dialogForm.age" autocomplete="off"></el-input>
                             </el-form-item>

                             <el-form-item prop="classid" label="" :label-width="dialogFormLabelWidth">
                                 <el-input v-model="dialogForm.classid" autocomplete="off"></el-input>
                             </el-form-item>

                             <el-form-item prop="school" label="" :label-width="dialogFormLabelWidth">
                                 <el-input v-model="dialogForm.school" autocomplete="off"></el-input>
                             </el-form-item>

                             <el-form-item prop="nianji" label="" :label-width="dialogFormLabelWidth">
                                 <el-input v-model="dialogForm.nianji" autocomplete="off"></el-input>
                             </el-form-item>

                             <el-form-item prop="state" label="" :label-width="dialogFormLabelWidth">
                                 <el-input v-model="dialogForm.state" autocomplete="off"></el-input>
                             </el-form-item>

                             <el-form-item prop="time" label="" :label-width="dialogFormLabelWidth">
                                 <el-date-picker type="datetime" v-model="dialogForm.time" autocomplete="off"></el-date-picker>
                             </el-form-item>

                             <el-form-item prop="leibie" label="" :label-width="dialogFormLabelWidth">
                                 <el-input v-model="dialogForm.leibie" autocomplete="off"></el-input>
                             </el-form-item>

                             <el-form-item prop="phone" label="" :label-width="dialogFormLabelWidth">
                                 <el-input v-model="dialogForm.phone" autocomplete="off"></el-input>
                             </el-form-item>

                             <el-form-item prop="code" label="" :label-width="dialogFormLabelWidth">
                                 <el-input v-model="dialogForm.code" autocomplete="off"></el-input>
                             </el-form-item>

                             <el-form-item prop="suoshu" label="" :label-width="dialogFormLabelWidth">
                                 <el-input v-model="dialogForm.suoshu" autocomplete="off"></el-input>
                             </el-form-item>


            </el-form>

            <div slot="footer" class="dialog-footer">
                <el-button @click="resetDialogFormData('dialogForm')" v-if="!isEditor">重 置</el-button>
                <el-button @click="dialogAddFormVisible = false" v-if="isEditor">取 消</el-button>
                <el-button type="primary" @click="saveOrUpdate">确 定</el-button>
            </div>
        </el-dialog>
    </div>
</template>

<script>
    import moment from "moment";
    import Pagination from '@/components/pagination/pagination'

    export default {
        components: {
            Pagination
        },
        data() {
            return {
                searchDate:"",
                //数据分页
                currentPage: 1,//当前页码
                totalCount: 1,// 总条数，根据接口获取数据长度(注意：这里不能为空)
                pageSize: 10,//页面数据显示数量
                //数据列表表单
                tableData: [],//数据列表表单的数据域
                tableChecked:[],//批量删除时被选中行
                ids:[],//批量删除的id
                //数据更新
                updateUserId: 0,//编辑时要更新的用户id
                //搜索
                searchForm: {
                    name:"",
                    sex:"",
                    age:"",
                    classid:"",
                    school:"",
                    nianji:"",
                    state:"",
                    leibie:"",
                    phone:"",
                    code:"",
                    suoshu:"",
                },
                isEditor: false,//标志弹出框是编辑还是添加
                dialogAddFormVisible: false,//编辑表单弹出框是否显示
                dialogForm: {//弹出框的数据域
                    id:"",
                    name:"",
                    sex:"",
                    age:"",
                    classid:"",
                    school:"",
                    nianji:"",
                    state:"",
                    time:"",
                    leibie:"",
                    phone:"",
                    code:"",
                    suoshu:"",
                },
                dialogFormLabelWidth: '120px',//弹出表单的输入框的宽度
                rules: {//弹出表单的输入规则
                    id:[
                        {
                            required: true,
                            message: "请输入",
                            trigger: "blur",
                        }
                    ],
                    name:[
                        {
                            required: true,
                            message: "请输入",
                            trigger: "blur",
                        }
                    ],
                    sex:[
                        {
                            required: true,
                            message: "请输入",
                            trigger: "blur",
                        }
                    ],
                    age:[
                        {
                            required: true,
                            message: "请输入",
                            trigger: "blur",
                        }
                    ],
                    classid:[
                        {
                            required: true,
                            message: "请输入",
                            trigger: "blur",
                        }
                    ],
                    school:[
                        {
                            required: true,
                            message: "请输入",
                            trigger: "blur",
                        }
                    ],
                    nianji:[
                        {
                            required: true,
                            message: "请输入",
                            trigger: "blur",
                        }
                    ],
                    state:[
                        {
                            required: true,
                            message: "请输入",
                            trigger: "blur",
                        }
                    ],
                    time:[
                        {
                            required: true,
                            message: "请输入",
                            trigger: "blur",
                        }
                    ],
                    leibie:[
                        {
                            required: true,
                            message: "请输入",
                            trigger: "blur",
                        }
                    ],
                    phone:[
                        {
                            required: true,
                            message: "请输入",
                            trigger: "blur",
                        }
                    ],
                    code:[
                        {
                            required: true,
                            message: "请输入",
                            trigger: "blur",
                        }
                    ],
                    suoshu:[
                        {
                            required: true,
                            message: "请输入",
                            trigger: "blur",
                        }
                    ],
                },
                urls:{
                    saveOrUpdate: "/v1/student/saveOrUpdate",
                    search: "/v1/student/list",
                    delete: "/v1/student/delete",
                    find: "/v1/student/findById",
                    exportExcel: "/v1/student/export",
                },
            };
        },
        created: function () {
            this.pageList();
        },
        methods: {
            indexMethod(index) {
                return (this.currentPage - 1) * this.pageSize + index + 1;
            },
            //加载列表数据
            pageList: function () {
                let url = this.$data.urls.search + "/" + this.currentPage + "/" + this.pageSize;
                this.axios({
                    method: "POST",
                    url: url,
                    data: this.$data.searchForm,
                }).then((res) => {
                    let code = res.data.code;
                    if (code == 200) {
                        this.$data.tableData = res.data.data.records;
                        this.$data.totalCount = res.data.data.total;
                        this.$data.currentPage = res.data.data.current;
                    }
                }).catch((error) => {
                    console.log(error);
                });
            },
            onSearch: function () {
                this.pageList();
            },
            resetSearchForm: function () {
                //重置表单数据
                this.searchDate = '';
                this.searchForm.createTimeBegin = "";
                this.searchForm.createTimeEnd = "";
                this.resetDialogFormData('searchForm')
                this.pageList();
            },
            //重置编辑弹出框表单的数据
            resetDialogFormData: function(formName){
                if (this.$refs[formName] !== undefined) {
                    this.$refs[formName].resetFields();
                }
            },
            addHandleClick: function() {
                this.$data.isEditor = false;
                this.$data.dialogAddFormVisible = true;
                this.dialogForm.id="";
                this.resetDialogFormData('dialogForm');
            },
            saveOrUpdate: function() {
                this.$refs['dialogForm'].validate((valid) => {
                    if (valid && this.checkDialogForm()) {
                        this.axios({
                            method: 'POST',
                            url: this.$data.urls.saveOrUpdate,
                            data: this.dialogForm
                        }).then(res => {
                            let code = res.data.code
                            if (code == 200) {
                                this.pageList();
                                this.$data.dialogAddFormVisible = false
                            }else if(code == 20004){
                                this.$message.error('请先修改数据在更新');
                            }
                        }).catch(error => {
                            console.log(error);
                        });
                    } else {
                        console.log('error submit!!');
                        return false;
                    }
                });
            },
            editorHandleClick: function (row) {
                this.isEditor = true;
                let url = this.$data.urls.find + "/" + row.id;
                this.axios({
                    method: "GET",
                    url: url,
                    data: {},
                }).then((res) => {
                    let code = res.data.code;
                    if (code == 200) {
                        this.dialogAddFormVisible = true;
                        this.resetDialogFormData('dialogForm');
                        this.$nextTick(() => {
                            this.$data.dialogForm = res.data.data;
                        })
                    }
                }).catch((error) => {
                    console.log(error)
                });
            },
            exportExcel: function () {
                let url = this.urls.exportExcel;
                this.axios({
                    method: "GET",
                    url: url,
                    data: {},
                })
                    .then((res) => {
                        let code = res.data.code;
                        if (code == 200) {
                            console.log(res.data.data);
                            let example= process.env.NODE_ENV == 'development' ? process.env.VUE_APP_BASEURL : window.location.host;
                            window.location.href =  example +  "/profile/download/" + res.data.data;
                        }
                    })
                    .catch((error) => {
                        console.log(error);
                    });
            },
            deleteHandleClick: function(row) {
              this.$data.ids.push(row.id);
              this.delete();
            },
            //删除ids中对应的
            delete: function() {
                let data = this.$data.ids
                //获得url尾部,要删除的id部分
                let urlChild = '';
                data.forEach((e)=>{
                    urlChild += 'ids=' + e + '&'
                });
                urlChild = urlChild.substring(0,urlChild.lastIndexOf('&'));

                let url = this.$data.urls.delete + '/?' + urlChild
                this.axios({
                    method: 'GET',
                    url: url,
                    data: {}
                }).then(res => {
                    let code = res.data.code;
                    this.$data.ids = new Array();//清空要删除的id数组
                    if (code == 200) {
                        this.pageList();
                    }
                }).catch(error => {
                    console.log(error);
                });
            },
            handleSelectionChange:function(val){
                this.tableChecked=val;
            },
            batchDelete:function(){
                let that = this;
                let _rows = this.$data.tableChecked;
                if(_rows.length <= 0 ){
                    this.$message.warning('请先选择需要删除的数据');
                    return;
                }
                that.$confirm('是否删除选中的所有用户?删除后无法恢复!','提示',{
                    confirmButtonText:'确定',
                    cancelButtonText:'取消',
                    type:'warning'
                }).then(()=>{
                    _rows.forEach(element =>{
                        that.ids.push(element.id)
                    })
                    this.delete();
                }).catch(() => {
                    this.$message({
                        type: 'info',
                        message: '已取消删除'
                    });
                });
            },
            handleCurrentChange: function(val) {
                this.$data.currentPage = val;
                this.pageList();
            },
            //改变每页显示数量，重新加载数据
            handleSizeChange: function (val) {
                this.$data.currentPage = 1;
                this.$data.pageSize = val;
                this.pageList();
            },
            checkDialogForm(){
                return true;
            },
            carTimeFilter: function (row, column, cellValue) {
                if (cellValue != null) {
                    return moment(cellValue).format("YYYY-MM-DD HH:mm:ss");
                }
            },
            dateChange: function(){
                if(this.searchDate && this.searchDate.length > 0){
                    this.searchForm.createTimeBegin = this.searchDate[0];
                    this.searchForm.createTimeEnd = this.searchDate[1];
                }else{
                    this.searchForm.createTimeBegin = "";
                    this.searchForm.createTimeEnd = "";
                }
                console.log(this.searchForm.createTimeBegin + " | " + this.searchForm.createTimeEnd)
            },
        },
    };
</script>

<style>
</style>