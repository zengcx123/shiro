<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="/common/common.jspf" %>
    <script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx}/js/system/order/edit.js"></script>
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
<form id="form" name="form" class="form-horizontal" method="post" action="${ctx}/order/editEntity.shtml">
    <input type="hidden" class="form-control checkacc" value="${order.id}"
           name="orderFormMap.id" id="id">
    <section class="panel panel-default">
        <div class="panel-body">
            <div class="form-group">
                <label class="col-sm-3 control-label">客户</label>
                <div class="col-sm-9">
                    <select id="customerId" name="orderFormMap.customerId" style="width: 155px;height: 27.5px;"
                            disabled>
                        <c:forEach items="${customer}" var="c">
                            <option value="${c.id}"
                                    <c:if test="${c.id == order.customerId}">selected="selected"</c:if>>${c.company}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">接单日期</label>
                <div class="col-sm-9">
                    <input readonly="readonly" type="text" class="Wdate" name="orderFormMap.receiveDate"
                           id="receiveDate"
                           onClick="WdatePicker()"
                           value="<fmt:formatDate value="${order.receiveDate}" type="date"></fmt:formatDate>">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">订单号</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control checkacc"
                           placeholder="请输入订单号" name="orderFormMap.orderNumber" id="orderNumber"
                           value="${order.orderNumber}">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">订单性质</label>
                <div class="col-sm-9">
                    <select id="orderNatureId" name="orderFormMap.orderNatureId" style="width: 155px;height: 27.5px;">
                        <c:forEach items="${nature}" var="o">
                            <option value="${o.id}"
                                    <c:if test="${o.id == order.orderNatureId}">selected="selected"</c:if>>${o.nature}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">采购金额（元）</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control checkacc"
                           placeholder="请输入采购金额" name="orderFormMap.money" id="money" value=${order.money}>
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">币种</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control checkacc"
                           placeholder="请输入币种" name="orderFormMap.currency" id="currency" value="${order.currency}"
                           onkeyup="this.value=this.value.toUpperCase()">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">税额</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control checkacc"
                           placeholder="请输入税额" name="orderFormMap.tax" id="tax" value=${order.tax}>
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">税率</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control checkacc"
                           placeholder="请输入税率" name="orderFormMap.cess" id="cess" value=${order.cess}>
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">交易方式</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control checkacc"
                           placeholder="请输入交易方式" name="orderFormMap.way" id="way" value=${order.way}>
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">回签状态</label>
                <div class="col-sm-9">
                    <div class="btn-group m-r">
                        <button data-toggle="dropdown"
                                class="btn btn-sm btn-default dropdown-toggle">
                            <span class="dropdown-label"><c:if test="${order.signStatus == '0'}">回签</c:if>
                            <c:if test="${order.signStatus == '1'}">不回签</c:if></span> <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu dropdown-select">
                            <li class=""><a href="#"><input type="radio"
                                                            name="orderFormMap.signStatus" value="0"
                                                            <c:if test="${order.signStatus == '0'}">checked="checked"</c:if>>回签</a>
                            </li>
                            <li class="active"><a href="#"><input type="radio"
                                                                  name="orderFormMap.signStatus" value="1"
                                                                  <c:if test="${order.signStatus == '1'}">checked="checked"</c:if>>不回签</a>
                            </li>
                        </ul>
                    </div>
                </div>

                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">回签日期</label>
                    <div class="col-sm-9">
                        <input type="text" class="Wdate" name="orderFormMap.signDate" id="signDate"
                               value="<fmt:formatDate value="${order.signDate}" type="date"></fmt:formatDate>"
                               onClick="WdatePicker()">
                    </div>
                </div>
                <div class="line line-dashed line-lg pull-in"></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">数量合计</label>
                    <div class="col-sm-9">
                        <input readonly="readonly" type="text" class="form-control checkacc"
                               placeholder="请输入数量合计" name="orderFormMap.count" id="count" value="${order.count}">
                    </div>
                </div>
                <%-- <div class="line line-dashed line-lg pull-in"></div>
                 <div class="form-group">
                     <label class="col-sm-3 control-label">交货期</label>
                     <div class="col-sm-9">
                         <input type="text" class="Wdate" name="orderFormMap.deliveryDate" id="deliveryDate"
                                value="<fmt:formatDate value="${order.deliveryDate}" type="date"></fmt:formatDate>" onClick="WdatePicker()">
                     </div>
                 </div>
                 <div class="line line-dashed line-lg pull-in"></div>
                 <div class="form-group">
                     <label class="col-sm-3 control-label">真实交货期</label>
                     <div class="col-sm-9">
                         <input type="text" class="Wdate" name="orderFormMap.relDeliveryDate" id="relDeliveryDate"
                                value="<fmt:formatDate value="${order.relDeliveryDate}" type="date"></fmt:formatDate>" onClick="WdatePicker()">
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