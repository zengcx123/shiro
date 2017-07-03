//单独验证某一个input  class="checkpass"
jQuery.validator.addMethod("checkacc", function(value, element) {
	return this.optional(element)
			|| ((value.length <= 30) && (value.length >= 3));
}, "账号由3至30位字符组合构成");

// 字符验证
jQuery.validator.addMethod("userName", function(value, element) {
	return this.optional(element) || /^[\u4e00-\u9fa5]*$/.test(value);
}, "真实姓名只能包括中文字");

$(function() {
	$("form").validate({
		submitHandler : function(form) {// 必须写在验证前面，否则无法ajax提交
			ly.ajaxSubmit(form, {// 验证新增是否成功
				type : "post",
				dataType : "json",
				success : function(data) {
					if (data == "success") {
						layer.confirm('添加成功!是否关闭窗口?', function(index) {
							parent.grid.loadData();
							parent.layer.close(parent.pageii);
							return false;
						});
						$("#form")[0].reset();
					} else {
						layer.alert('添加失败！', 3);
					}
				}
			});
		},
		rules : {
			"userFormMap.userName" : {
				required : true,
				userName:true
			},
			"userFormMap.accountName" : {
				required : true,
				remote : { // 异步验证是否存在
					type : "POST",
					url : 'isExist.shtml',
					data : {
						name : function() {
							return $("#accountName").val();
						}
					}
				}
			}
		},
		messages : {
			"userFormMap.userName" : {
				required : "请输入真实姓名",
				userName : "只能输入中文"
			},
			"userFormMap.accountName" : {
				required : "请输入账号",
				remote : "该账号已经存在"
			}
		},
		errorPlacement : function(error, element) {// 自定义提示错误位置
			$(".l_err").css('display', 'block');
			// element.css('border','3px solid #FFCCCC');
			$(".l_err").html(error.html());
		},
		success : function(label) {// 验证通过后
			$(".l_err").css('display', 'none');
		}
	});
});
