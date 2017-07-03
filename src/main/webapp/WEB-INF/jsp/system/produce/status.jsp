<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%@include file="/common/common.jspf" %>
    <script type="text/javascript" src="${ctx}/js/autocomplete/jquery-migrate-1.1.0.js"></script>
    <script type="text/javascript" src="${ctx}/js/autocomplete/jquery.autocomplete.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx}/js/system/produce/status.js"></script>
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
      action="${ctx}/produce/addStatusEntity.shtml">
    <input type="hidden" class="form-control checkacc" value="${planId}"
           name="planFormMap.planId" id="planId">
    <section class="panel panel-default">
        <div class="panel-body">
            <div class="form-group">
                <label class="col-sm-3 control-label">请选择日期</label>
                <div class="col-sm-9">
                    <input type="text" class="Wdate" name="planFormMap.createDate" id="createDate"
                           onClick="WdatePicker()">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">炉号</label>
                <div class="col-sm-9">
                    <%--<select id="planFormMap" name="planFormMap.fusionId" style="width: 155px;height: 27.5px;">
                        <c:forEach items="${fusion}" var="f">
                            <option value="${f.id1}">${f.fusionNo1}</option>
                        </c:forEach>
                    </select>--%>
                    <input type="hidden" class="form-control" placeholder="请输入炉号"
                           name="planFormMap.fusionId" id="fusionId">
                    <input type="text" class="form-control" placeholder="请输入炉号"
                           name="planFormMap.fusionNo" id="fusionNo">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">造型数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入造型数量"
                           name="planFormMap.model" id="model">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">造型报废数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入造型报废数量"
                           name="planFormMap.modelReject" id="modelReject">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">配箱数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入配箱数量"
                           name="planFormMap.box" id="box">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">配箱报废数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入配箱报废数量"
                           name="planFormMap.boxReject" id="boxReject">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">浇注数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入浇注数量"
                           name="planFormMap.bell" id="bell">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">浇注报废数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入浇注报废数量"
                           name="planFormMap.bellReject" id="bellReject">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">开箱数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入开箱数量"
                           name="planFormMap.openBox" id="openBox">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">开箱报废数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入开箱报废数量"
                           name="planFormMap.openBoxReject" id="openBoxReject">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">打磨数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入打磨数量"
                           name="planFormMap.polish" id="polish">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">打磨报废数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入打磨报废数量"
                           name="planFormMap.polishReject" id="polishReject">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">热处理数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入热处理数量"
                           name="planFormMap.hot" id="hot">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">热处理报废数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入热处理报废数量"
                           name="planFormMap.hotReject" id="hotReject">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">抛沙数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入抛沙数量"
                           name="planFormMap.sand" id="sand">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">抛沙报废数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入抛沙报废数量"
                           name="planFormMap.sandReject" id="sandReject">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">送检数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入送检数量"
                           name="planFormMap.inspection" id="inspection">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">验退数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入验退数量"
                           name="planFormMap.back" id="back">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">入库数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入入库数量"
                           name="planFormMap.inStock" id="inStock">
                </div>
            </div>
        </div>
        <footer class="panel-footer text-right bg-light lter">
            <button onclick="addEntity();" class="btn btn-success btn-s-xs">提交</button>
        </footer>
    </section>
</form>
<script type="text/javascript">
    onloadurl();

    var fusion = '${fusion}';
    var info = JSON.parse(fusion);

    $(function () {
        $('#fusionNo').autocomplete(info, {
            max: 10,     // 列表里的条目数
            minChars: 0,     // 自动完成激活之前填入的最小字符
            width: 400,      // 提示的宽度，溢出隐藏
            scrollHeight: 300,    // 提示的高度，溢出显示滚动条
            matchContains: true,     // 包含匹配，就是data参数里的数据，是否只要包含文本框里的数据就显示
            autoFill: false,     // 自动填充
            formatItem: function (row, i, max) {
                return row.fusionNo1;
            },
            formatMatch: function (row, i, max) {
                return row.fusionNo1;
            },
            formatResult: function (row) {
                return row.fusionNo1;
            }
        }).result(function (event, row, formatted) {
            $("#fusionId").val(row.id1);
        });
    });
</script>
<script type="text/javascript"
        src="${ctx}/notebook/notebook_files/bootstrap-filestyle.min.js"></script>
</body>
</html>