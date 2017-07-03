<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="/common/common.jspf"%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${ctx}/js/system/fusion/addMeterial.js"></script>
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

<script type="application/javascript">
	function changeRaw(obj) {
		var opt = obj.options[obj.selectedIndex];
		var id = opt.value;
		$("#stock").html("剩余库存量为"+$("#"+id).val()+$("#unit_"+id).val());
		$("#stockCount").val($("#"+id).val());
		$("#id2").val($("#id2_"+id).val());
	}
</script>
</head>
<body>
	<div class="l_err" style="width: 100%; margin-top: 2px;"></div>
	<form id="form" name="form" class="form-horizontal" method="post"
		action="${ctx}/fusion/addMeterialEntity.shtml">
		<section class="panel panel-default">
		<div class="panel-body">
			<input type="hidden" value="${rawId}" id="rawId" name="rawId"/>
			<div class="form-group">
				<label class="col-sm-3 control-label">原材料</label>
				<div class="col-sm-9">
					<select id="id" name="id" style="width: 155px;height: 27.5px;" onchange="changeRaw(this);">
						<option value="">请选择</option>
						<c:forEach items="${useMeterial}" var="rm">
							<option value="${rm.id3}">${rm.name3}</option>
						</c:forEach>
					</select>
					<c:forEach items="${useMeterial}" var="rm">
						<input type="hidden" id="${rm.id3}" value="${rm.overplus2}"/>
						<input type="hidden" id="unit_${rm.id3}" value="${rm.unit3}"/>
						<input type="hidden" id="id2_${rm.id3}" value="${rm.id2}"/>
					</c:forEach>
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
					<input type="hidden" id="id2" name="id2"/>
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