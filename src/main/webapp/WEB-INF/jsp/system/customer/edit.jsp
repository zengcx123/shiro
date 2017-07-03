<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/common/common.jspf"%>
<script type="text/javascript" src="${ctx}/js/system/customer/edit.js"></script>
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
		action="${ctx}/customer/editEntity.shtml">
		<input type="hidden" class="form-control checkacc" value="${customer.id}"
			name="customerFormMap.id" id="id">
		<section class="panel panel-default">
			<div class="panel-body">
				<div class="form-group">
					<label class="col-sm-3 control-label">客户</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkRole"
							placeholder="请输入客户名称" name="customerFormMap.company" id="company" value="${customer.company}"/>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">编号</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkacc"
							   placeholder="请输入客户编号" name="customerFormMap.number" id="number" value=${customer.number}>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">联系人</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkacc"
							placeholder="请输入联系人姓名" name="customerFormMap.name" id="name" value=${customer.name}>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">性别</label>
					<div class="col-sm-9">
						<div class="btn-group m-r">
							<button data-toggle="dropdown"
								class="btn btn-sm btn-default dropdown-toggle">
								<span class="dropdown-label"><c:if test="${customer.sex eq '0'}">男</c:if><c:if test="${customer.sex eq '1'}">女</c:if></span> <span class="caret"></span>
							</button>
							<ul class="dropdown-menu dropdown-select">
								<li class=""><a href="#"><input type="radio"
										name="customerFormMap.sex" value="0"<c:if test="${customer.sex eq '0'}"> checked="checked"</c:if>>男</a></li>
								<li class="active"><a href="#"><input type="radio"
										name="customerFormMap.sex" value="1" <c:if test="${customer.sex eq '1'}"> checked="checked"</c:if>>女</a></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">联系方式</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkacc"
							   placeholder="请输入联系人手机号码" name="customerFormMap.telephone" id="telephone" value=${customer.telephone}>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">邮箱</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkacc"
							   placeholder="请输入联系人邮箱" name="customerFormMap.email" id="email" value=${customer.email}>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">QQ</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkacc"
							   placeholder="请输入联系人QQ" name="customerFormMap.qq" id="qq" value=${customer.qq}>
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