<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@include file="/common/common.jspf"%>
	<script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
	<script type="text/javascript" src="${ctx}/js/system/buy/edit.js"></script>
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
		action="${ctx}/buy/editEntity.shtml">
		<input type="hidden" class="form-control checkacc" value="${buy.id}"
			name="buy.id" id="id">
		<section class="panel panel-default">
			<div class="panel-body">
				<div class="form-group">
					<label class="col-sm-3 control-label">采购单号</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkacc"
							   placeholder="请输入采购单号" name="buy.buyNo" id="buyNo" value="${buy.buyNo}" readonly>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">供应商</label>
					<div class="col-sm-9">
						<select id="supplierId" name="buy.supplierId" style="width: 155px;height: 27.5px;" disabled>
							<c:forEach items="${supplier}" var="s">
								<option value="${s.id}" <c:if test="${s.id == buy.supplierId}">selected="selected"</c:if>>${s.company}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">材料</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkacc"
							   placeholder="请输入材料" name="buy.material" id="material" value="${buy.material}" readonly>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">数量</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkacc"
							   placeholder="请输入数量" name="buy.count" id="count" value="${buy.count}" readonly>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">单位</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkacc"
							   placeholder="请输入单位,例如'个'" name="buy.unit" id="unit" value="${buy.unit}" readonly>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">录入日期</label>
					<div class="col-sm-9">
						<input type="text" class="Wdate" name="buy.createDate" id="createDate"
							   onClick="WdatePicker()" value="<fmt:formatDate value="${buy.createDate}" type="date"></fmt:formatDate>" readonly>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">需交日期</label>
					<div class="col-sm-9">
						<input type="text" class="Wdate" name="buy.needDate" id="needDate"
							   onClick="WdatePicker()" value="<fmt:formatDate value="${buy.needDate}" type="date"></fmt:formatDate>">
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">交货日期</label>
					<div class="col-sm-9">
						<input type="text" class="Wdate" name="buy.deliveryDate" id="deliveryDate"
							   onClick="WdatePicker()" value="<fmt:formatDate value="${buy.deliveryDate}" type="date"></fmt:formatDate>">
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">检验日期</label>
					<div class="col-sm-9">
						<input type="text" class="Wdate" name="buy.inspectionDate" id="inspectionDate"
							   onClick="WdatePicker()" value="<fmt:formatDate value="${buy.inspectionDate}" type="date"></fmt:formatDate>">
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">入库日期</label>
					<div class="col-sm-9">
						<input type="text" class="Wdate" name="buy.inStockDate" id="inStockDate"
							   onClick="WdatePicker()" value="<fmt:formatDate value="${buy.inStockDate}" type="date"></fmt:formatDate>">
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">标识号</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" placeholder="请输入标识号"
							   name="buy.identification" id="identification" value="${buy.identification}" readonly>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">备注</label>
					<div class="col-sm-9">
						<input type="text" class="form-control" placeholder="请输入备注"
							   name="buy.remark" id="remark" value="${buy.remark}">
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">采购人员</label>
					<div class="col-sm-9">
						<input type="text" class="form-control checkacc"
							   placeholder="请输入采购人员" name="buy.person" id="person" value="${buy.person}" readonly>
					</div>
				</div>
				<div class="line line-dashed line-lg pull-in"></div>
				<div class="form-group">
					<label class="col-sm-3 control-label">是否完成</label>
					<div class="col-sm-9">
						<div class="btn-group m-r">
							<button data-toggle="dropdown"
									class="btn btn-sm btn-default dropdown-toggle">
                            <span class="dropdown-label"><c:if test="${buy.isFinish == '0'}">未完成</c:if>
                            <c:if test="${buy.isFinish == '1'}">完成</c:if></span> <span class="caret"></span>
							</button>
							<ul class="dropdown-menu dropdown-select">
								<li class=""><a href="#"><input type="radio"
																name="buy.isFinish" value="0" <c:if test="${buy.isFinish == '0'}">checked="checked"</c:if>>未完成</a></li>
								<li class="active"><a href="#"><input type="radio"
																	  name="buy.isFinish" value="1" <c:if test="${buy.isFinish == '1'}">checked="checked"</c:if>>完成</a></li>
							</ul>
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