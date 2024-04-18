<template>
	<div>
		<el-form ref="forms" :model="form"  label-width="80px">
			<el-form-item label="头像" prop="avatar">
				<multi-upload v-model="form.voucherUrlList"></multi-upload>
			</el-form-item>
			<el-form-item label="姓名" prop="userName">
				<el-input v-model="form.userName"></el-input>
			</el-form-item>
		</el-form>
		<el-button type="primary" @click="onSubmit">确 定</el-button>
		
	</div>
</template>
<script>
	// import Upload from '@/components/Upload/upload'
	import MultiUpload from '@/components/Upload/MultiUpload'
	
	export default {
		components: {
			// Upload,
			MultiUpload
		},
		data() {
			return {
				form: {
					avatar: '',
					userName: '',
				          name: '',
				          voucherUrlList: [],
				          date1: '',
				          date2: '',
				          delivery: false,
				          type: [],
				          resource: '',
				          desc: ''
				        }
			}
		},
		
		methods: {
			onSubmit() {
				console.log(this.form);
				// this.$refs.forms.validata(valid => {
				// 	if (valid) {
				// 		// 将 this.form 传给后端
				// 	}
				// })
			}
		}
	}
</script>
