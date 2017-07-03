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

		document.getElementById("createDate").value = today();//获取文本id并且传入当前日期
	 });

	function today(){
		var today=new Date();
		var h=today.getFullYear();
		var m=today.getMonth()+1;
		var d=today.getDate();
		m= m<10?"0"+m:m;   //  这里判断月份是否<10,如果是在月份前面加'0'
		d= d<10?"0"+d:d;   //  这里判断日期是否<10,如果是在日期前面加'0'
		return h+"-"+m+"-"+d;
	}