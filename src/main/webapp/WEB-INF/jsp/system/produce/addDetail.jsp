<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/common.jspf"%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${ctx}/js/system/produce/addDetail.js"></script>
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
		action="${ctx}/produce/addDetail.shtml">
		<section class="panel panel-default">
		<div class="panel-body">
			<input type="hidden" value="${id}" id="planId" name="planId"/>
			<div class="form-group">
				<label class="col-sm-3 control-label">开始日期</label>
				<div class="col-sm-9">
					<input type="text" class="Wdate" name="startDate" id="startDate"
						   onClick="WdatePicker()">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">结束日期</label>
				<div class="col-sm-9">
					<input type="text" class="Wdate" name="endDate" id="endDate"
						   onClick="WdatePicker()">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">数量</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入数量" name="count" id="count">
					<%--<span style="color: red;">总数为${count}</span>--%>
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
	</script>
	<script type="text/javascript"
		src="${ctx}/notebook/notebook_files/bootstrap-filestyle.min.js"></script>
</body>
</html>