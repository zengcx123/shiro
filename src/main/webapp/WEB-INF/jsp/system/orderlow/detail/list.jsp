<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/orderlow/detail/list.js"></script>
<div class="m-b-md">
    <form class="form-inline" role="form" id="searchForm"
          name="searchForm">
        <div class="form-group">
            <label class="control-label"> <span
                    class="h4 font-thin v-middle">订单号:</span></label> <input
                class="input-medium ui-autocomplete-input" id="orderNumber"
                name="detail.orderNumber">
        </div>
        <div class="form-group">
            <label class="control-label"> <span
                    class="h4 font-thin v-middle">产品名称:</span></label> <input
                class="input-medium ui-autocomplete-input" id="productName"
                name="detail.productName">
        </div>
        <div class="form-group">
            <label class="control-label"> <span
                    class="h4 font-thin v-middle">产品图号:</span></label> <input
                class="input-medium ui-autocomplete-input" id="productPicNo"
                name="detail.productPicNo">
        </div>
        <div class="form-group">
            <label class="control-label"> <span
                    class="h4 font-thin v-middle">是否完成:</span></label>
            <select id="isFinish" name="detail.isFinish" style="width: 155px;height: 27.5px;">
                <option value="">请选择</option>
                <option value="0">未完成</option>
                <option value="1">已完成</option>
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
    </div>
</header>
<div class="table-responsive">
    <div id="paging" class="pagclass"></div>
</div>

<div id="callback_div" class="table-responsive" style="display: none;">
    <div id="paging_callback" class="pagclass"></div>
</div>