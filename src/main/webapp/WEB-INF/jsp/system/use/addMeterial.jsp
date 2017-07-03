<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@include file="/common/common.jspf" %>
    <script type="text/javascript" src="${ctx}/js/autocomplete/jquery-migrate-1.1.0.js"></script>
    <script type="text/javascript" src="${ctx}/js/autocomplete/jquery.autocomplete.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx}/js/system/use/addMeterial.js"></script>
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

    <%--<script type="application/javascript">
        var index = 0;

        function changeRaw(obj) {
            var opt = obj.options[obj.selectedIndex];
            var id = opt.value;
            $("#stock").html("剩余库存量为" + $("#count_" + id).val() + $("#unit_" + id).val());
            $("#stockCount").val($("#count_" + id).val());
        }

        function add() {
            index++;
            var addSpan = '<div class="line line-dashed line-lg pull-in"></div><div class="form-group"><label class="col-sm-3 control-label">原材料</label><div class="col-sm-9"><select id="id' + index + '" name="id' + index + '" style="width: 155px;height: 27.5px;" onchange="changeRaw(this,' + index + ');"><option value="">请选择</option><c:forEach items="${raw}" var="r"><option value="${r.id}">${r.name}</option></c:forEach></select><c:forEach items="${raw}" var="r"><input type="hidden" id="${r.id}" value="${r.count}"/></c:forEach></div></div><div class="line line-dashed line-lg pull-in"></div><div class="form-group"><label class="col-sm-3 control-label">数量</label><div class="col-sm-9"><input type="text" class="form-control checkacc" placeholder="请输入数量" name="count' + index + '" id="count' + index + '"><span id="stock' + index + '" style="color: red;"></span></div></div>';
            $("#addSpan").append(addSpan);
        }
    </script>--%>
</head>
<body>
<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
<form id="form" name="form" class="form-horizontal" method="post"
      action="${ctx}/use/addMeterialEntity.shtml">
    <section class="panel panel-default">
        <div class="panel-body">
            <input type="hidden" value="${rawId}" id="rawId" name="rawId"/>
            <div class="form-group">
                <label class="col-sm-3 control-label">原材料</label>
                <div class="col-sm-9">
                    <%--<select id="id" name="id" style="width: 155px;height: 27.5px;" onchange="changeRaw(this);">
                        <option value="">请选择</option>
                        <c:forEach items="${raw}" var="r">
                            <option value="${r.id}">${r.name}</option>
                        </c:forEach>
                    </select>--%>
                    <input type="hidden" class="form-control" placeholder="请输入原材料"
                           name="id" id="id">
                    <input type="text" class="form-control" placeholder="请输入原材料"
                           name="name" id="name">
                    <%--<c:forEach items="${raw}" var="r">
                        <input type="hidden" id="count_${r.id}" value="${r.count}"/>
                        <input type="hidden" id="unit_${r.id}" value="${r.unit}"/>
                    </c:forEach>--%>
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control checkacc"
                           placeholder="请输入数量" name="count" id="count">
                    <span id="stock" style="color: red;"></span>
                    <input type="hidden" id="stockCount" name="stockCount"/>
                </div>
            </div>

            <%--<span id="addSpan"></span>--%>
        </div>
        <footer class="panel-footer text-right bg-light lter">
            <button type="submit" class="btn btn-success btn-s-xs">提交</button>
        </footer>
    </section>
</form>
<script type="text/javascript">
    onloadurl();

    var raw = '${raw}';
    var info = JSON.parse(raw);

    $(function () {
        $('#name').autocomplete(info, {
            max: 10,     // 列表里的条目数
            minChars: 0,     // 自动完成激活之前填入的最小字符
            width: 400,      // 提示的宽度，溢出隐藏
            scrollHeight: 300,    // 提示的高度，溢出显示滚动条
            matchContains: true,     // 包含匹配，就是data参数里的数据，是否只要包含文本框里的数据就显示
            autoFill: false,     // 自动填充
            formatItem: function (row, i, max) {
                return row.name;
            },
            formatMatch: function (row, i, max) {
                return row.name;
            },
            formatResult: function (row) {
                return row.name;
            }
        }).result(function (event, row, formatted) {
            $("#id").val(row.id);
            $("#stock").html("剩余库存量为" + row.count + row.unit);
            $("#stockCount").val(row.count);
        });
    });
</script>
<script type="text/javascript"
        src="${ctx}/notebook/notebook_files/bootstrap-filestyle.min.js"></script>
</body>
</html>