<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="/common/common.jspf" %>
    <script type="text/javascript" src="${ctx}/js/system/orderlow/detail/updateStatus.js"></script>
    <style type="text/css">
        .col-sm-3 {
            width: 15%;
            float: left;
        }

        .col-sm-9 {
            width: 85%;
            float: left;
        }
    </style>
</head>
<body>
<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
<form id="form" name="form" class="form-horizontal" method="post"
      action="${ctx}/orderlow/detail/updateEntity.shtml">
    <input type="hidden" class="form-control checkacc" value="${id}"
           name="id" id="id">
    <section class="panel panel-default">
        <div class="panel-body">
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">备注</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请填写备注，修改完成状态原因"
                           name="remark" id="remark">
                </div>
            </div>
        </div>

        <footer class="panel-footer text-right bg-light lter">
            <button type="submit" class="btn btn-success btn-s-xs">提交</button>
        </footer>
    </section>
</form>
<script type='text/javascript'>
    /* $(function(){
     $("from input[name='enable'][value='${role.enable}']").attr("checked","checked");
     alert("input[name='enable'][value='${role.enable}']");
     }); */
</script>
</body>
</html>