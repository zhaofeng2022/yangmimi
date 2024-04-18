<template>
	<div>
    <el-upload v-loading="loading" class="uploader" :class="{'hover-mask': value}" :headers="authorToken"
			:action="UPLOAD_URL" :auto-upload="true" :show-file-list="false" :accept="fileType?fileType:'image/*'"
			:on-success="handleSuccess" :before-upload="handlebeforeUpload" :disabled="value?true:false" ref="fileupload">
    <div v-if="value">
      <img class="avatar" :src="value" alt="" />
      <span class="el-upload-list__item-actions">
        <span class="el-upload-list__item-preview" @click="handlePictureCardPreview(value)"><i
            class="el-icon-zoom-in"></i></span>
        <span class="el-upload-list__item-delete" @click="handleRemove(value)"><i
            class="el-icon-delete"></i></span>
      </span>
    </div>
    <i v-else class="el-icon-plus uploader-icon"></i>
     </el-upload>
    <el-dialog :append-to-body="true" :visible.sync="dialogImgVisible" style="z-index: 3000;text-align: center;"
      :close-on-click-modal="false" :close-on-press-escape="false" custom-class="pub_dialog">
      <img width="50%" :src="dialogImageUrl" alt="" />
    </el-dialog>
<!--		<el-upload :action="UPLOAD_URL" :file-list="fileList" list-type="picture-card" :limit="limit"-->
<!--			:on-exceed="handleUploadExceed" :on-preview="handlePictureCardPreview" :on-remove="handleRemove"-->
<!--			:before-upload="handlebeforeUpload" :on-success="handleSuccess">-->
<!--			<i class="el-icon-plus"></i>-->
<!--		</el-upload>-->
<!--		<el-dialog :visible.sync="dialogVisible">-->
<!--			<img width="100%" :src="dialogImageUrl" alt="">-->
<!--		</el-dialog>-->
	</div>
</template>
<!-- 
	使用用例 
	fileType可以是
	audio/*表示“任何音频文件
	video/*表示“任何视频文件
	image/*表示“任何图像文件
	还可以以逗号拼接，如image/*,.pdf

	<upload v-model="form.avatar" :fileType="image/*"></upload>

	import Upload from '@/components/Upload/upload'

	components: {
		Upload
	}, 
-->


<script>
	import {
		UPLOAD_URL
	} from '../../utils/api.js';
	export default {
		props: {
			value: String,
			fileType: String
			// required: true
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
			}
		},
		methods: {
			handlePictureCardPreview: function(file) {
				this.dialogImageUrl = file;
				this.dialogImgVisible = true;
			},
			handleRemove: function(file) {
				console.log(file)
				this.$emit('input', '')
				// this.$refs['fileupload'].clearFiles;
				// let uploadFiles = this.$refs['fileupload'].uploadFiles;
				// let index = uploadFiles.indexOf(file);
				// uploadFiles.splice(index, 1);
			},
			handleSuccess(res) {
				console.log(res);
				this.loading = false
				// 触发事件 input，父组件会修改绑定的 value 值
				this.$emit('input', res.data.url)
			},
			handlebeforeUpload(file) {
				// 这里做可以做文件校验操作
				const isImg = /^image\/\w+$/i.test(file.type)
				if (!isImg && this.fileType == 'image/*') {
					this.$message.error('只能上传 JPG、PNG、GIF 格式!')
					return false
				}
				this.loading = true;
			}
		}
	}
</script>

<style scoped lang="scss">
	.uploader {
		width: 130px;
		height: 130px;
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;

		&:hover {
			border-color: #409EFF;
		}

		/deep/ .el-upload {
			position: relative;
			width: 100%;
			height: 100%;
			overflow: hidden;
		}
	}

	.uploader-icon {
		position: absolute;
		top: 0;
		left: 0;
		width: 100%;
		height: 100%;
		line-height: 128px;
		text-align: center;
		font-size: 28px;
		color: #8c939d;
	}

	.avatar+.uploader-icon {
		opacity: 0;
	}

	.avatar {
		width: 128px;
		height: 128px;
		display: block;
		border-radius: 6px;
	}

	.hover-mask:hover .uploader-icon {
		opacity: 1;
		background-color: rgba(0, 0, 0, .2);
		color: #fff;
	}

	.hover-mask:hover .el-upload-list__item-actions {
		position: absolute;
		width: 100%;
		height: 100%;
		top: 0;
		left: 0;
		display: flex;
		justify-content: space-around;
		align-items: center;
		padding: 30px;
		background-color: rgba(0, 0, 0, .5);
	}

	.el-upload-list__item-preview,
	.el-upload-list__item-delete {
		position: initial;
		font-size: 16px;
		color: #fff;
		display: none;
	}

	.hover-mask:hover .el-upload-list__item-preview,
	.hover-mask:hover .el-upload-list__item-delete {
		display: block;
	}
</style>
