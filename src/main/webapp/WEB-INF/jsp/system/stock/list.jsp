<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/stock/list.js"></script>
	<div class="m-b-md">
		<form class="form-inline" role="form" id="searchForm"
			name="searchForm">
			<div class="form-group">
				<label class="control-label"> <span
					class="h4 font-thin v-middle">产品名称:</span></label> <input
					class="input-medium ui-autocomplete-input" id="productName"
					name="stock.productName">
			</div>
			<div class="form-group">
				<label class="control-label"> <span
						class="h4 font-thin v-middle">产品图号:</span></label> <input
					class="input-medium ui-autocomplete-input" id="productPicNo"
					name="stock.productPicNo">
			</div>
			<div class="form-group">
				<label class="control-label"> <span
						class="h4 font-thin v-middle">材质:</span></label>
				<select id="productMaterial" name="stock.productMaterial" style="width: 155px;height: 27.5px;">
					<option value="">请选择</option>
					<option value="HT">HT</option>
					<option value="QT">QT</option>
					<option value="WCB">WCB</option>
				</select>
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
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color: blue;">库存总量：灰铁${HT}KG，球铁${QT}KG，铸钢${WCB}KG</span>
	</div>
	</header>
	<div class="table-responsive">
		<div id="paging" class="pagclass"></div>
	</div>

	<div id="callback_div" class="table-responsive" style="display: none;">
		<div id="paging_callback" class="pagclass"></div>
	</div>
