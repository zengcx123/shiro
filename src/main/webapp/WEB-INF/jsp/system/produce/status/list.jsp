<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/produce/status/list.js"></script>
	<div class="m-b-md">
		<form class="form-inline" role="form" id="searchForm"
			name="searchForm">
			<div class="form-group">
				<label class="control-label"> <span
						class="h4 font-thin v-middle">录入日期:</span></label>
				<input class="Wdate" id="createDate"
					   name="planFormMap.createDate" onClick="WdatePicker()">
			</div>
			<a href="javascript:void(0)" class="btn btn-default" id="search">查询</a>
			<a href="javascript:void(0)" class="btn btn-default" id="resetSearch">重置</a>
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
