<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/common.jspf"%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${ctx}/js/system/buy/add.js">
	
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
		action="${ctx}/buy/addEntity.shtml">
		<section class="panel panel-default">
		<div class="panel-body">
			<div class="form-group">
				<label class="col-sm-3 control-label">供应商</label>
				<div class="col-sm-9">
					<select id="supplierId" name="buy.supplierId" style="width: 155px;height: 27.5px;">
						<c:forEach items="${supplier}" var="s">
							<option value="${s.id}">${s.company}</option>
						</c:forEach>
					</select>
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">材料</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						   placeholder="请输入材料" name="buy.material" id="material">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">数量</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						placeholder="请输入数量" name="buy.count" id="count">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">单位</label>
				<div class="col-sm-9">
					<input type="text" class="form-control checkacc"
						   placeholder="请输入单位,例如'个'" name="buy.unit" id="unit">
				</div>
			</div>
			<%--<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">录入日期</label>
				<div class="col-sm-9">
					<input type="text" class="Wdate" name="buy.createDate" id="createDate"
						   onClick="WdatePicker()">
				</div>
			</div>--%>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">需交日期</label>
				<div class="col-sm-9">
					<input type="text" class="Wdate" name="buy.needDate" id="needDate"
						   onClick="WdatePicker()">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">交货日期</label>
				<div class="col-sm-9">
					<input type="text" class="Wdate" name="buy.deliveryDate" id="deliveryDate"
						   onClick="WdatePicker()">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">检验日期</label>
				<div class="col-sm-9">
					<input type="text" class="Wdate" name="buy.inspectionDate" id="inspectionDate"
						   onClick="WdatePicker()">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">入库日期</label>
				<div class="col-sm-9">
					<input type="text" class="Wdate" name="buy.inStockDate" id="inStockDate"
						   onClick="WdatePicker()">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">标识号</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入标识号"
						   name="buy.identification" id="identification">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">备注</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入备注"
						   name="buy.remark" id="remark">
				</div>
			</div>
			<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">采购人员</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入采购人员"
						   name="buy.person" id="person">
				</div>
			</div>
			<%--<div class="line line-dashed line-lg pull-in"></div>
			<div class="form-group">
				<label class="col-sm-3 control-label">是否完成</label>
				<div class="col-sm-9">
					<input type="text" class="form-control" placeholder="请输入是否完成"
						   name="buy.isFinish" id="isFinish">
				</div>
			</div>--%>
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