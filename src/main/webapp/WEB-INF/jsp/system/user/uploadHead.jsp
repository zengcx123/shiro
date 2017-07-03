<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@include file="/common/common.jspf" %>
    <link type="text/css" rel="stylesheet" href="${ctx}/headPicture/jquery.Jcrop.css"/>
    <%--<script type="text/javascript" src="${ctx}/js/jquery/jquery-1.8.3.js"></script>--%>
    <script type="text/javascript" src="${ctx}/headPicture/ajaxfileupload.js"></script>
    <%--<script type="text/javascript" src="${ctx}/headPicture/jquery.Jcrop.min.js"></script>--%>
</head>
<body>
<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
<form id="form" name="form" action="#" class="form-horizontal" method="post">
    <section class="panel panel-default">
        <div class="modal-body text-center">
            <div class="zxx_main_con">
                <div class="zxx_test_list">
                    <input class="photo-file" type="file" name="imgFile" id="imgFile" onchange="readURL(this);"/>
                    <img alt="" src="" id="myimg" style="width: 200px;height: 200px;"/>
                    <%--<input type="hidden" id="imgflag" name="imgflag">--%>
                </div>
            </div>
        </div>

        <footer class="panel-footer text-right bg-light lter">
            <input id="uploadPic" class="btn btn-success btn-s-xs" type="button" value="上传"/>
        </footer>
    </section>
</form>
</body>
</html>