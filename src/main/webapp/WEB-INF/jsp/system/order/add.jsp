<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@include file="/common/common.jspf" %>
    <script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx}/js/system/order/add.js">

    </script>
    <style type="text/css">
        .col-sm-3 {
            width: 15%;
            float: left;
            text-align: right;
        }

        .col-sm-9 {
            width: 85%;
            float: left;
            text-align: left;
        }

        label[class^="btn btn-default"] {
            margin-top: -4px;
        }
    </style>
</head>
<body>
<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
<form id="form" name="form" class="form-horizontal" method="post"
      action="${ctx}/order/addEntity.shtml">
    <section class="panel panel-default">
        <div class="panel-body">
            <div class="form-group">
                <label class="col-sm-3 control-label">客户</label>
                <div class="col-sm-9">
                    <select id="customerId" name="orderFormMap.customerId" style="width: 155px;height: 27.5px;">
                        <c:forEach items="${customer}" var="c">
                            <option value="${c.id}">${c.company}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">接单日期</label>
                <div class="col-sm-9">
                    <input type="text" class="Wdate" name="orderFormMap.receiveDate" id="receiveDate"
                           onClick="WdatePicker()">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">订单号</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control checkacc"
                           placeholder="请输入订单号" name="orderFormMap.orderNumber" id="orderNumber">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">订单性质</label>
                <div class="col-sm-9">
                    <select id="orderNatureId" name="orderFormMap.orderNatureId" style="width: 155px;height: 27.5px;">
                        <c:forEach items="${nature}" var="o">
                            <option value="${o.id}">${o.nature}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">采购金额（元）</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control checkacc"
                           placeholder="请输入采购金额" name="orderFormMap.money" id="money">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">币种</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control checkacc"
                           placeholder="请输入币种，如RMB" name="orderFormMap.currency" id="currency" onkeyup="this.value=this.value.toUpperCase()">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">税额</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control checkacc"
                           placeholder="请输入税额" name="orderFormMap.tax" id="tax">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">税率</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control checkacc"
                           placeholder="请输入税率" name="orderFormMap.cess" id="cess">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">交易方式</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control checkacc"
                           placeholder="请输入交易方式" name="orderFormMap.way" id="way">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">回签状态</label>
                <div class="col-sm-9">
                    <div class="btn-group m-r">
                        <button data-toggle="dropdown"
                                class="btn btn-sm btn-default dropdown-toggle">
                            <span class="dropdown-label">回签</span> <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu dropdown-select">
                            <li class=""><a href="#"><input type="radio"
                                                            name="orderFormMap.signStatus" value="0" checked="checked">回签</a>
                            </li>
                            <li class="active"><a href="#"><input type="radio"
                                                                  name="orderFormMap.signStatus" value="1">不回签</a></li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">回签日期</label>
                <div class="col-sm-9">
                    <input type="text" class="Wdate" name="orderFormMap.signDate" id="signDate" onClick="WdatePicker()">&nbsp;<span
                        style="color: red;">注：选择不回签时，无需选择此项！</span>
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">数量合计</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control checkacc"
                           placeholder="请输入数量合计" name="orderFormMap.count" id="count">
                </div>
            </div>
            <%--<div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">交货期</label>
                <div class="col-sm-9">
                    <input type="text" class="Wdate" name="orderFormMap.deliveryDate" id="deliveryDate"
                           onClick="WdatePicker()">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">真实交货期</label>
                <div class="col-sm-9">
                    <input type="text" class="Wdate" name="orderFormMap.relDeliveryDate" id="relDeliveryDate"
                           onClick="WdatePicker()">
                </div>
            </div>--%>
        </div>
        <footer class="panel-footer text-right bg-light lter">
            <button type="submit" class="btn btn-success btn-s-xs">提交</button>
        </footer>
    </section>
</form>
<script type="text/javascript">
    onloadurl();
</script>
<script type="text/javascript"
        src="${ctx}/notebook/notebook_files/bootstrap-filestyle.min.js"></script>
</body>
</html>