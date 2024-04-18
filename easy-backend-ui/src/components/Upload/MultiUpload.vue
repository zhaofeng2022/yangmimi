<template>
	<div>
		<el-upload class="uploader" :headers="authorToken" :action="UPLOAD_URL" :auto-upload="true"
			:file-list="fileList" list-type="picture-card" :limit="limit?limit:5" :accept="fileType?fileType:'image/*'"
			:on-success="handleGoodsImagesUploadSuccess" :before-upload="handlebeforeUpload" :multiple="true"
			ref="fileupload" :on-exceed="handleUploadExceed" :on-remove="handleRemove"
			:on-preview="handlePictureCardPreview">
			<i class="el-icon-plus"></i>
		</el-upload>
		<el-dialog :append-to-body="true" :visible.sync="dialogImgVisible" style="z-index: 3000;text-align: center;"
			:close-on-click-modal="false" :close-on-press-escape="false" custom-class="pub_dialog">
			<img width="80%" :src="dialogImageUrl" alt="" />
		</el-dialog>
	</div>
</template>
<!-- 
	使用用例 
	fileType可以是
	audio/*表示“任何音频文件
	video/*表示“任何视频文件
	image/*表示“任何图像文件
	还可以以逗号拼接，如image/*,.pdf

	<multi-upload v-model="form.voucherUrlList" :fileType="image/*"></multi-upload>

	import MultiUpload from '@/components/Upload/MultiUpload'

	components: {
		MultiUpload
	}, 
-->


<script>
	import {
		UPLOAD_URL
	} from '../../utils/api.js';
	export default {
		props: {
			value: {
				type: Array,
				default: () => []
			},
			limit: {
				type: Number,
				default: 5
			},
			fileType: String,
		},
		data() {
			return {
				authorToken: {
					'Authorization': 'Bearer ' + sessionStorage.getItem("token")
				},
				UPLOAD_URL: UPLOAD_URL,
				loading: '',
				param: {
					token: ''
				},
				dialogImageUrl: "",
				dialogImgVisible: false,
				disabled: false,
				imgs:[],
				num:0,
        fileNum:0
			}
		},
		computed: {
			// ['xxx', 'xxx'] 转换为 [{url: 'xxx'}, {url: 'xxx'}]
			fileList() {
				return this.value.map(url => ({
					url
				}))
			}
		},
		methods: {
			handlePictureCardPreview: function(file) {
				this.dialogImageUrl = file.url;
				this.dialogImgVisible = true;
			},
			handleRemove: function(file, fileList) {
				// fileList 为删除后的文件列表
				const value = fileList.map(v => v.url)
				this.$emit('input', value)
			},
			handleGoodsImagesUploadSuccess(response, file, fileList) {
				console.log(response);
				console.log(fileList);
				if (response.code === 200) {
					let imageUrl = response.data.url;
					this.imgs.push(imageUrl);
					this.num++;
          if(this.num == this.fileNum){
            this.num = 0;
            this.fileNum = 0;
						// 这里如果 this.value.push(imageUrl) 这么写，vue会报出警告，大概意思是value作为props不应该在子组件中被修改
						// 应该根据 value 得到新的值，而不能修改它，this.value.concat(imageUrl)也是可以的，concat方法返回新的数组
						// this.$emit('input', [...this.value, imageUrl])
						this.$emit('input', this.value.concat(this.imgs))
						this.imgs =[];
					}
				} else {
					this.$message.error(file.name + '上传失败!');
				}
			},
			handlebeforeUpload(file) {
				// 这里做可以做文件校验操作
				const isImg = /^image\/\w+$/i.test(file.type)
				if (!isImg && this.fileType == 'image/*') {
					this.$message.error('只能上传 JPG、PNG、GIF 格式!')
					return false
				}
        this.fileNum++;
			},
			handleUploadExceed() {
				this.$message.error(`最多上传${this.limit}张图片`)
			},
		}
	}
</script>
<style>
/*去除upload组件过渡效果*/
.uploader .el-upload-list__item {
  transition: none !important;
}
</style>
<style scoped lang="scss">
	.hide>>>.el-upload--picture-card {
		display: none;
	}
</style>
