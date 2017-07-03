<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/common/common.jspf"%>
<script type="text/javascript" src="${ctx}/js/system/product/edit.js"></script>
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
		action="${ctx}/product/editEntity.shtml">
		<input type="hidden" class="form-control checkacc" value="${product.id}"
			name="productFormMap.id" id="id">
		<section class="panel panel-default">
			<div class="panel-body">
				<div class="form-group">
					<label class="col-sm-3 control-label">图号</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkRole"
							placeholder="请输入图号" name="productFormMap.productPicNo" id="productPicNo" value="${product.productPicNo}"/>
					</div>
				</div>
				<%--<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">编号</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkacc"
							   placeholder="请输入产品编号" name="productFormMap.productNumber" id="productNumber" value=${product.productNumber}>
					</div>
				</div>--%>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">产品名称</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkacc"
							placeholder="请输入产品名称" name="productFormMap.productName" id="productName" value=${product.productName}>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">产品单重(KG)</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkacc"
							   placeholder="请输入产品单重" name="productFormMap.productWeight" id="productWeight" value=${product.productWeight}>
					</div>
				</div>
				<%--<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">产品单位</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkacc"
							   placeholder="请输入产品单位，如KG或T" name="productFormMap.productUnit" id="productUnit" value="${product.productUnit}" onkeyup="this.value=this.value.toUpperCase()">
					</div>
				</div>--%>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">产品材质</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkacc"
							   placeholder="请输入产品材质" name="productFormMap.productMaterial" id="productMaterial" value="${product.productMaterial}" onkeyup="this.value=this.value.toUpperCase()">
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">产品单价（元）</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkacc"
							   placeholder="请输入产品单价" name="productFormMap.productPrice" id="productPrice" value=${product.productPrice}>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
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