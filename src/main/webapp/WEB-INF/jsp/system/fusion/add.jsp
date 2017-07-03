<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@include file="/common/common.jspf" %>
    <script type="text/javascript" src="${ctx}/js/autocomplete/jquery-migrate-1.1.0.js"></script>
    <script type="text/javascript" src="${ctx}/js/autocomplete/jquery.autocomplete.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx}/js/system/fusion/add.js"></script>
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
      action="${ctx}/fusion/addEntity.shtml">
    <section class="panel panel-default">
        <div class="panel-body">
            <div class="form-group">
                <label class="col-sm-3 control-label">材料领用单</label>
                <div class="col-sm-9">
                    <%--<select id="useId" name="useId" style="width: 250px;height: 27.5px;">
                        <c:forEach items="${use}" var="u">
                            <option value="${u.id}">${u.useNo}</option>
                        </c:forEach>
                    </select>--%>
                    <input type="hidden" class="form-control" placeholder="请输入材料领用单"
                           name="useId" id="useId">
                    <input type="text" class="form-control" placeholder="请输入材料领用单"
                           name="useNo" id="useNo">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">熔炼结果</label>
                <div class="col-sm-9">
                    <select id="result" name="result" style="width: 155px;height: 27.5px;">
                        <option value="">请选择</option>
                        <option value="1">铁</option>
                        <option value="2">钢</option>
                    </select>
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">炉号</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control checkacc"
                           placeholder="请输入炉号" name="fusionNo" id="fusionNo">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">操作员</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control checkacc"
                           placeholder="请输入操作员" name="person" id="person">
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

    var use = '${use}';
    var info = JSON.parse(use);

    $(function () {
        $('#useNo').autocomplete(info, {
            max: 10,     // 列表里的条目数
            minChars: 0,     // 自动完成激活之前填入的最小字符
            width: 400,      // 提示的宽度，溢出隐藏
            scrollHeight: 300,    // 提示的高度，溢出显示滚动条
            matchContains: true,     // 包含匹配，就是data参数里的数据，是否只要包含文本框里的数据就显示
            autoFill: false,     // 自动填充
            formatItem: function (row, i, max) {
                return row.useNo;
            },
            formatMatch: function (row, i, max) {
                return row.useNo;
            },
            formatResult: function (row) {
                return row.useNo;
            }
        }).result(function (event, row, formatted) {
            $("#useId").val(row.id);
        });
    });
</script>
<script type="text/javascript"
        src="${ctx}/notebook/notebook_files/bootstrap-filestyle.min.js"></script>
</body>
</html>