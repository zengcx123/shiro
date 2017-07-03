<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@include file="/common/common.jspf" %>
    <script type="text/javascript" src="${ctx}/js/autocomplete/jquery-migrate-1.1.0.js"></script>
    <script type="text/javascript" src="${ctx}/js/autocomplete/jquery.autocomplete.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx}/js/system/order/detail/add.js"></script>
    <link rel="Stylesheet" href="${ctx}/js/autocomplete/jquery.autocomplete.css"/>
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
      action="${ctx}/order/detail/addEntity.shtml">
    <input type="hidden" class="form-control checkacc" value="${id}"
           name="orderId" id="orderId">
    <section class="panel panel-default">
        <div class="panel-body">
            <div class="form-group">
                <label class="col-sm-3 control-label">产品图号</label>
                <div class="col-sm-9">
                    <%--<select id="productId" name="productId" style="width: 155px;height: 27.5px;">
                        <c:forEach items="${product}" var="p">
                            <option value="${p.id}">${p.productName}</option>
                        </c:forEach>
                    </select>--%>
                    <input type="hidden" class="form-control" placeholder="请输入产品"
                           name="productId" id="productId">
                    <input type="text" class="form-control" placeholder="请输入产品图号"
                           name="productPicNo" id="productPicNo">
                    <span id="productName" style="color:green;"></span>
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">需求总数</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入需求总数"
                           name="total" id="total">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">交货期</label>
                <div class="col-sm-9">
                    <input type="text" class="Wdate" name="deliveryDate" id="deliveryDate"
                           onClick="WdatePicker()">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">实际交货期</label>
                <div class="col-sm-9">
                    <input type="text" class="Wdate" name="relDeliveryDate" id="relDeliveryDate"
                           onClick="WdatePicker()">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">是否补退</label>
                <div class="col-sm-9">
                    <select id="isBack" name="isBack" style="width: 155px;height: 27.5px;">
                        <option value="0">补退</option>
                        <option value="1">不补退</option>
                    </select>
                </div>
            </div>
        </div>
        <footer class="panel-footer text-right bg-light lter">
            <button type="submit" class="btn btn-success btn-s-xs">提交</button>
        </footer>
    </section>
</form>
<script type="text/javascript">
    onloadurl();

    var product = '${product}';
    var info = JSON.parse(product);

    $(function () {
        $('#productPicNo').autocomplete(info, {
            max: 10,     // 列表里的条目数
            minChars: 0,     // 自动完成激活之前填入的最小字符
            width: 400,      // 提示的宽度，溢出隐藏
            scrollHeight: 300,    // 提示的高度，溢出显示滚动条
            matchContains: true,     // 包含匹配，就是data参数里的数据，是否只要包含文本框里的数据就显示
            autoFill: false,     // 自动填充
            formatItem: function (row, i, max) {
                return row.productPicNo;
            },
            formatMatch: function (row, i, max) {
                return row.productPicNo;
            },
            formatResult: function (row) {
                return row.productPicNo;
            }
        }).result(function (event, row, formatted) {
            $("#productId").val(row.id);
            $("#productName").html("产品名称:" + row.productName);
        });
    });
</script>
<script type="text/javascript"
        src="${ctx}/notebook/notebook_files/bootstrap-filestyle.min.js"></script>
</body>
</html>