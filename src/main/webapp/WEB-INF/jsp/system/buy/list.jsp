<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/buy/list.js"></script>
	<div class="m-b-md">
		<form class="form-inline" role="form" id="searchForm"
			name="searchForm">
			<div class="form-group">
				<label class="control-label"> <span
						class="h4 font-thin v-middle">供应商:</span></label>
				<select id="supplierId" name="buy.supplierId" style="width: 155px;height: 27.5px;">
					<option value="">请选择</option>
					<c:forEach items="${supplier}" var="s">
						<option value="${s.id}">${s.company}</option>
					</c:forEach>
				</select>
			</div>

			<div class="form-group">
				<label class="control-label"> <span
						class="h4 font-thin v-middle">原材料:</span></label> <input
					class="input-medium ui-autocomplete-input" id="material"
					name="buy.material">
			</div>
			<div class="form-group">
				<label class="control-label"> <span
						class="h4 font-thin v-middle">录入日期:</span></label>
				<input class="Wdate" id="createDate"
					   name="buy.createDate" onClick="WdatePicker()">
			</div>
			<div class="form-group">
				<label class="control-label"> <span
						class="h4 font-thin v-middle">是否完成:</span></label>
				<select id="isFinish" name="buy.isFinish" style="width: 155px;height: 27.5px;">
					<option value="">请选择</option>
					<option value="0">未完成</option>
					<option value="1">已完成</option>
				</select>
			</div>
			<a href="javascript:void(0)" class="btn btn-default" id="search">查询</a>
			<a href="javascript:void(0)" class="btn btn-default" id="resetSearch">重置</a>
			<%--<a href="javascript:void(0)" class="btn btn-warning" id="callback_test">测试表格回调函数</a>--%>
			<%--<a href="javascript:grid.exportData('/user/export.shtml')" class="btn btn-info" id="search">导出excel</a>--%>
		</form>
	</div>
	<header class="panel-heading">
	<div class="doc-buttons">
		<c:forEach items="${res}" var="key">
			${key.description}
		</c:forEach>
	</div>
	</header>
	<div class="table-responsive">
		<div id="paging" class="pagclass"></div>
	</div>

	<div id="callback_div" class="table-responsive" style="display: none;">
		<div id="paging_callback" class="pagclass"></div>
	</div>
