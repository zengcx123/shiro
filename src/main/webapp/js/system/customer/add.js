	// 前三位必须是大写英文字母
	jQuery.validator.addMethod("mustAZ", function(value, element) {
		return this.optional(element) || /^[A-Z]{3}.*$/.test(value);
	}, "前三位必须是大写英文字母");

	$(function() {
	 	$("form").validate({
	 		submitHandler : function(form) {//必须写在验证前面，否则无法ajax提交
	 			ly.ajaxSubmit(form,{//验证新增是否成功
	 				type : "post",
	 				dataType:"json",
	 				success : function(data) {
	 					if (data=="success") {
	 						layer.confirm('添加成功!是否关闭窗口?', function(index) {
	 							parent.grid.loadData();
					        	parent.layer.close(parent.pageii);
					        	return false;
	 						});
	 						$("#form")[0].reset();
	 					} else {
	 						layer.msg('添加失败！');
	 					}
	 				}
	 			});
	 		},rules : {
				"customerFormMap.company" : {
					required : true
				},
				"customerFormMap.number" : {
					required : true,
					mustAZ : true
				}
			},
			messages : {
				"customerFormMap.company" : {
					required : "请输入客户名称"
				},
				"customerFormMap.number" : {
					required : "请输入客户编号",
					mustAZ : "前三位必须是大写英文字母"
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

