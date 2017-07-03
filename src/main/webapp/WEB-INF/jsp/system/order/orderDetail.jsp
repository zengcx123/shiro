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
            <c:forEach items="${orderDetail}" var="o" varStatus="s">


                <center><span style="color: blue;font-size: 18px;">订单详情${s.count}</span></center>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">产品名称</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control checkacc"
                               readonly="readonly" value=${o.productname}>
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">交货期</label>
                    <div class="col-sm-9">
                        <input type="text" class="Wdate" readonly="readonly"
                               value="<fmt:formatDate value="${o.deliverydate}" type="date"></fmt:formatDate>"
                               onClick="WdatePicker()">
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">实际交货期</label>
                    <div class="col-sm-9">
                        <input type="text" class="Wdate" readonly="readonly"
                               value="<fmt:formatDate value="${o.reldeliverydate}" type="date"></fmt:formatDate>"
                               onClick="WdatePicker()">
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">需求总数</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control checkacc"
                               readonly="readonly" value=${o.total}>
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">送货总数</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control checkacc"
                               readonly="readonly" value=${o.outstock}>
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">退货总数</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control checkacc"
                               readonly="readonly" value=${o.back}>
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">欠货总数</label>
                    <div class="col-sm-9">
                        <input type="text" class="form-control checkacc"
                               readonly="readonly" value=${o.owe}>
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">是否完成</label>
                    <div class="col-sm-9">
                        <c:if test="${o.isfinish == '0'}"><input type="text" class="form-control checkacc"
                                                                 readonly="readonly" value="未完成"></c:if>
                        <c:if test="${o.isfinish == '1'}"><input type="text" class="form-control checkacc"
                                                                 readonly="readonly" value="完成"></c:if>
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>


            </c:forEach>
        </div>
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