<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/common.jspf"%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${ctx}/js/system/orderlow/detail/status/add.js">
	
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
		action="${ctx}/order/detail/status/addEntity.shtml">
		<input type="hidden" class="form-control checkacc" value="${id}"
			   name="detailStatus.orderDetailId" id="orderDetailId">
		<section class="panel panel-default">
			<div class="panel-body">
			<div class="form-group">
				<label class="col-sm-3 control-label">请选择日期</label>
				<div class="col-sm-9">
					<input type="text" class="Wdate" name="detailStatus.createDate" id="createDate" onClick="WdatePicker()">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">送检数量</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入送检数量"
						   name="detailStatus.inspection" id="inspection">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">验退数量</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入验退数量"
						   name="detailStatus.accBack" id="accBack">
				</div>
			</div>
			<%--<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">入库数量</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入入库数量"
						   name="detailStatus.inStock" id="inStock">
				</div>
			</div>--%>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">出库数量</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入出库数量"
						   name="detailStatus.outStock" id="outStock">
					<span style="color: red;">剩余库存量为${stockCount}</span>
					<input type="hidden" id="stockCount" name="stockCount" value="${stockCount}"/>
				</div>
			</div>
			<%--<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">欠货数量</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入欠货数量"
						   name="detailStatus.owe" id="owe">
				</div>
			</div>--%>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">退货数量</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入退货数量"
						   name="detailStatus.back" id="back">
				</div>
			</div>
		</div>
		<footer class="panel-footer text-right bg-light lter">
		<button type="submit" class="btn btn-success btn-s-xs">提交</button>
		</footer> </section>
	</form>
	<script type="text/javascript">
	onloadurl();
	</script>
	<script type="text/javascript"
		src="${ctx}/notebook/notebook_files/bootstrap-filestyle.min.js"></script>
</body>
</html>