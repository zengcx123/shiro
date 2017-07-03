function uploadHead() {
    //加载层
    var index = layer.load(0, {shade: false}); //0代表加载的风格，支持0-2
    //iframe层-禁滚动条
    layer.open({
        type: 2,
        title: '更换头像',
        area: ['600px', '350px'],
        skin: 'layui-layer-rim', //加上边框
        content: [rootPath + '/user/uploadHead.shtml', 'no']
    });
    //关闭加载效果
    layer.close(index);
}

$(function () {
    $("#uploadPic").click(function () {
        if ($("#imgFile").val().length > 0) {
            ajaxFileUpload();
        } else {
            layer.alert('请上传头像！', 3);
            return false;
        }
    });
})

function ajaxFileUpload() {
    $.ajaxFileUpload
    (
        {
            url: rootPath + '/user/uploadHeadPic.shtml', //用于文件上传的服务器端请求地址
            secureuri: false, //是否需要安全协议，一般设置为false
            fileElementId: 'imgFile', //文件上传域的ID
            dataType: 'text', //返回值类型 一般设置为json
            success: function (data, status)  //服务器成功响应处理函数
            {
                if (data == "\"success\"") {
                    layer.confirm('上传成功!是否关闭窗口？', function (index) {
                        layer.close(index);
                        var index = parent.layer.getFrameIndex(window.name); //先得到当前iframe层的索引
                        parent.layer.close(index); //再执行关闭
                    });
                } else {
                    layer.msg('上传失败！', {icon: 5});
                }
            },
            error: function (data, status, e)//服务器响应失败处理函数
            {
                alert(e);
            }
        }
    )
    return false;
}

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.readAsDataURL(input.files[0]);
        reader.onload = function (e) {
            $('#myimg').removeAttr('src');
            $('#myimg').attr('src', e.target.result);
        };
    }
}