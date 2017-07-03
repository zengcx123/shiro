<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/common/common.jspf"%>
<script type="text/javascript" src="${ctx}/js/system/supplier/edit.js"></script>
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
		action="${ctx}/supplier/editEntity.shtml">
		<input type="hidden" class="form-control checkacc" value="${supplier.id}"
			name="supplierFormMap.id" id="id">
		<section class="panel panel-default">
			<div class="panel-body">
				<div class="form-group">
					<label class="col-sm-3 control-label">供应商</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkRole"
							placeholder="请输入供应商名称" name="supplierFormMap.company" id="company" value="${supplier.company}"/>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">编号</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkacc"
							   placeholder="请输入供应商编号，如A1234567" name="supplierFormMap.number" id="number" value=${supplier.number}>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">供应产品</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkacc"
							   placeholder="请输入供应产品，以【，】分隔" name="supplierFormMap.product" id="product" value=${supplier.product}>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">联系人</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkacc"
							placeholder="请输入联系人姓名" name="supplierFormMap.name" id="name" value=${supplier.name}>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">性别</label>
					<div class="col-sm-9">
						<div class="btn-group m-r">
							<button data-toggle="dropdown"
								class="btn btn-sm btn-default dropdown-toggle">
								<span class="dropdown-label"><c:if test="${supplier.sex eq '0'}">男</c:if><c:if test="${supplier.sex eq '1'}">女</c:if></span> <span class="caret"></span>
							</button>
							<ul class="dropdown-menu dropdown-select">
								<li class=""><a href="#"><input type="radio"
										name="supplierFormMap.sex" value="0"<c:if test="${supplier.sex eq '0'}"> checked="checked"</c:if>>男</a></li>
								<li class="active"><a href="#"><input type="radio"
										name="supplierFormMap.sex" value="1" <c:if test="${supplier.sex eq '1'}"> checked="checked"</c:if>>女</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">联系方式</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkacc"
							   placeholder="请输入联系人手机号码" name="supplierFormMap.telephone" id="telephone" value=${supplier.telephone}>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">邮箱</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkacc"
							   placeholder="请输入联系人邮箱" name="supplierFormMap.email" id="email" value=${supplier.email}>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">开票资料</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkacc"
							   placeholder="请输入开票资料" name="supplierFormMap.invoice" id="invoice" value=${supplier.invoice}>
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