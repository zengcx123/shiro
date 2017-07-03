// 前三位必须是大写英文字母
jQuery.validator.addMethod("mustAZ", function(value, element) {
	return this.optional(element) || /^[A-Z]{1}.*$/.test(value);
}, "第一位必须是大写英文字母");

	$(function() {
		 $("form").validate({
	 		submitHandler : function(form) {//必须写在验证前面，否则无法ajax提交
	 			ly.ajaxSubmit(form,{//验证新增是否成功
	 				type : "post",
	 				dataType:"json",
	 				success : function(data) {
	 					if (data=="success") {
	 						layer.confirm('更新成功!是否关闭窗口?', function(index) {
	 							parent.grid.loadData();
					        	parent.layer.close(parent.pageii);
					        	return false;
	 						});
	 					} else {
	 						layer.alert('添加失败！', 3);
	 					}
	 				}
	 			});
	 		},rules : {
				 "supplierFormMap.company" : {
					 required : true
				 },
				 "supplierFormMap.number" : {
					 required : true,
					 mustAZ : true
				 }
			 },
			 messages : {
				 "supplierFormMap.company" : {
					 required : "请输入供应商名称"
				 },
				 "supplierFormMap.number" : {
					 required : "请输入供应商编号",
					 mustAZ : "第一位必须是大写英文字母"
				 }
			 },
	 		errorPlacement : function(error, element) {//自定义提示错误位置
	 			$(".l_err").css('display','block');
	 			//element.css('border','3px solid #FFCCCC');
	 			$(".l_err").html(error.html());
	 		},
	 		success: function(label) {//验证通过后
	 			$(".l_err").css('display','none');
	 		}
	 	});
	 });

