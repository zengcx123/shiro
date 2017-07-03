<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="/common/common.jspf" %>
    <script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx}/js/system/orderlow/detail/edit.js"></script>
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
      action="${ctx}/orderlow/detail/editEntity.shtml">
    <input type="hidden" class="form-control checkacc" value="${detail.id}"
           name="id" id="id">
    <section class="panel panel-default">
        <div class="panel-body">
            <div class="form-group">
                <label class="col-sm-3 control-label">产品</label>
                <div class="col-sm-9">
                    <select id="productId" name="productId" style="width: 155px;height: 27.5px;" disabled>
                        <c:forEach items="${product}" var="p">
                            <option value="${p.id}"
                                    <c:if test="${p.id == detail.productId}">selected="selected"</c:if>>${p.productName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">需求总数</label>
                <div class="col-sm-9">
                    <input readonly="readonly" type="text" class="form-control" placeholder="请输入需求总数"
                           name="total" id="total" value="${detail.total}">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">交货期</label>
                <div class="col-sm-9">
                    <input type="text" class="Wdate" name="deliveryDate" id="deliveryDate"
                           onClick="WdatePicker()" value="<fmt:formatDate value="${detail.deliveryDate}" type="date"></fmt:formatDate>">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">实际交货期</label>
                <div class="col-sm-9">
                    <input type="text" class="Wdate" name="relDeliveryDate" id="relDeliveryDate"
                           onClick="WdatePicker()" value="<fmt:formatDate value="${detail.relDeliveryDate}" type="date"></fmt:formatDate>">
                </div>
            </div>
            <%--<div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">是否补退</label>
                <div class="col-sm-9">
                    <select id="isBack" name="isBack" style="width: 155px;height: 27.5px;">
                        <option value="0" <c:if test="${detail.isBack == '0'}">selected</c:if>>补退</option>
                        <option value="1" <c:if test="${detail.isBack == '0'}">selected</c:if>>不补退</option>
                    </select>
                </div>
            </div>--%>
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