<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <%@include file="/common/common.jspf" %>
    <script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" src="${ctx}/js/system/produce/status/edit.js"></script>
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
<form id="form" name="form" class="form-horizontal" method="post" action="${ctx}/produce/status/editEntity.shtml">
    <input type="hidden" class="form-control checkacc" value="${planFormMap.id}"
           name="planFormMap.id" id="id">
    <section class="panel panel-default">
        <div class="panel-body">
            <div class="form-group">
                <label class="col-sm-3 control-label">请选择日期</label>
                <div class="col-sm-9">
                    <input type="text" class="Wdate" name="planFormMap.createDate" id="createDate" readonly
                           onClick="WdatePicker()" value="<fmt:formatDate value="${planFormMap.createDate}" type="date"></fmt:formatDate>">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">造型数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入造型数量"
                           name="planFormMap.model" id="model" value="${planFormMap.model}">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">造型报废数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入造型报废数量"
                           name="planFormMap.modelReject" id="modelReject" value="${planFormMap.modelReject}">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">配箱数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入配箱数量"
                           name="planFormMap.box" id="box" value="${planFormMap.box}">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">配箱报废数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入配箱报废数量"
                           name="planFormMap.boxReject" id="boxReject" value="${planFormMap.boxReject}">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">浇注数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入浇注数量"
                           name="planFormMap.bell" id="bell" value="${planFormMap.bell}">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">浇注报废数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入浇注报废数量"
                           name="planFormMap.bellReject" id="bellReject" value="${planFormMap.bellReject}">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">开箱数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入开箱数量"
                           name="planFormMap.openBox" id="openBox" value="${planFormMap.openBox}">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">开箱报废数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入开箱报废数量"
                           name="planFormMap.openBoxReject" id="openBoxReject" value="${planFormMap.openBoxReject}">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">打磨数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入打磨数量"
                           name="planFormMap.polish" id="polish" value="${planFormMap.polish}">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">打磨报废数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入打磨报废数量"
                           name="planFormMap.polishReject" id="polishReject" value="${planFormMap.polishReject}">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">热处理数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入热处理数量"
                           name="planFormMap.hot" id="hot" value="${planFormMap.hot}">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">热处理报废数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入热处理报废数量"
                           name="planFormMap.hotReject" id="hotReject" value="${planFormMap.hotReject}">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">抛沙数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入抛沙数量"
                           name="planFormMap.sand" id="sand" value="${planFormMap.sand}">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">抛沙报废数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入抛沙报废数量"
                           name="planFormMap.sandReject" id="sandReject" value="${planFormMap.sandReject}">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">送检数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入送检数量"
                           name="planFormMap.inspection" id="inspection" value="${planFormMap.inspection}">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">验退数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入验退数量"
                           name="planFormMap.back" id="back" value="${planFormMap.back}">
                </div>
            </div>
            <div class="line line-dashed line-lg pull-in"></div>
            <div class="form-group">
                <label class="col-sm-3 control-label">入库数量</label>
                <div class="col-sm-9">
                    <input type="text" class="form-control" placeholder="请输入入库数量"
                           name="planFormMap.inStock" id="inStock" value="${planFormMap.inStock}">
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