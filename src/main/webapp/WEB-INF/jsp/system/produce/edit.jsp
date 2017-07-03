<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="/common/common.jspf" %>
    <script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx}/js/system/produce/edit.js"></script>
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
<form id="form" name="form" class="form-horizontal" method="post" action="${ctx}/produce/editEntity.shtml">
    <input type="hidden" class="form-control checkacc" value="${produce.id}"
           name="id" id="id">
    <section class="panel panel-default">
        <div class="panel-body">
            <div class="form-group">
                <label class="col-sm-3 control-label">委铸单位</label>
                <div class="col-sm-9">
                    <select id="customerId" name="customerId" style="width: 155px;height: 27.5px;" disabled>
                        <c:forEach items="${customer}" var="c">
                            <option value="${c.id}" <c:if
                                    test="${c.id == produce.customerId}"></c:if>>${c.company}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">产品</label>
                <div class="col-sm-9">
                    <c:forEach items="${product}" var="p">
                        <c:if test="${p.id == produce.productId}">
                            <input type="text" class="form-control checkacc"
                                   placeholder="请输入产品" name="productId" id="productId" value="${p.productName}"
                                   readonly>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control checkacc"
                           placeholder="请输入数量" name="count" id="count" value="${produce.count}" readonly>
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">需交日期</label>
                <div class="col-sm-9">
                    <input type="text" class="Wdate" name="needDate" id="needDate"
                           onClick="WdatePicker()"
                           value="<fmt:formatDate value="${produce.needDate}" type="date"></fmt:formatDate>">
                </div>
            </div>
        </div>
        <footer class="panel-footer text-right bg-light lter">
            <button type="submit" class="btn btn-success btn-s-xs">提交</button>
        </footer>
    </section>
</form>
</body>
</html>