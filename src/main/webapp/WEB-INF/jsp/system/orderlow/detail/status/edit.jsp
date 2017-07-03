<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@include file="/common/common.jspf"%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${ctx}/js/system/orderlow/detail/status/edit.js"></script>
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
	  action="${ctx}/order/detail/status/editEntity.shtml">
	<input type="hidden" class="form-control checkacc" value="${detailStatus.id}"
		   name="detailStatus.id" id="id">
	<input type="hidden" class="form-control checkacc" value="${detailStatus.orderDetailId}"
		   name="detailStatus.orderDetailId" id="orderDetailId">
	<section class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<label class="col-sm-3 control-label">录入日期</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入录入日期"
						   name="detailStatus.createDate" id="createDate" value="<fmt:formatDate value="${detailStatus.createDate}" type="date"></fmt:formatDate>" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">订单号</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入订单号"
						   name="detailStatus.orderNumber" id="orderNumber" value="${detailStatus.orderNumber}" readonly="readonly">
				</div>
			</div>
			<div class="form-group">
				<label class="col-sm-3 control-label">产品名称</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入产品名称"
						   name="detailStatus.productName" id="productName" value="${detailStatus.productName}" readonly="readonly">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">送检数量</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入送检数量"
						   name="detailStatus.inspection" id="inspection" value="${detailStatus.inspection}">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">验退数量</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入验退数量"
						   name="detailStatus.accBack" id="accBack" value="${detailStatus.accBack}">
				</div>
			</div>
			<%--<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">入库数量</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入入库数量"
						   name="detailStatus.inStock" id="inStock" value="${detailStatus.inStock}">
				</div>
			</div>--%>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">出库数量</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入出库数量"
						   name="detailStatus.outStock" id="outStock" value="${detailStatus.outStock}">
				</div>
			</div>
			<%--<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">欠货数量</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入欠货数量"
						   name="detailStatus.owe" id="owe" value="${detailStatus.owe}">
				</div>
			</div>--%>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">退货数量</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入退货数量"
						   name="detailStatus.back" id="back" value="${detailStatus.back}">
				</div>
			</div>
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