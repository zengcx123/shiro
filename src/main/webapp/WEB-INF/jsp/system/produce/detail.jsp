<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="/common/common.jspf" %>
    <script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
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
<form id="form" name="form" class="form-horizontal" method="post" action="#">
    <section class="panel panel-default">
        <div class="panel-body">
            <c:forEach items="${detail}" var="d" varStatus="s">


                <center><span style="color: blue;font-size: 18px;">生产计划详情${s.count}</span></center>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">开始日期</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control checkacc"
                               readonly="readonly" value=${d.startDate}>
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">结束日期</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control checkacc"
                               readonly="readonly" value=${d.endDate}>
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">数量</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control checkacc"
                               readonly="readonly" value=${d.count}>
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>


            </c:forEach>
        </div>
    </section>
</form>
<script type='text/javascript'>
</script>
</body>
</html>