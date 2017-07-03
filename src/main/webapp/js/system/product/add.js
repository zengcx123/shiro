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
				"productFormMap.productPicNo" : {
					required : true
				},
				"productFormMap.productNumber" : {
					required : true
				},
				"productFormMap.productName" : {
					required : true
				}
			},
			messages : {
				"productFormMap.productPicNo" : {
					required : "请输入图号"
				},
				"productFormMap.productNumber" : {
					required : "请输入产品编号"
				},
				"productFormMap.productName" : {
					required : "请输入产品名称"
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

