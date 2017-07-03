<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/system/analyse/list.js"></script>
<div class="m-b-md">
    <form class="form-inline" role="form" id="searchForm"
          name="searchForm">
        <div class="form-group">
            <label class="control-label"> <span
                    class="h4 font-thin v-middle">订单号:</span></label> <input
                class="input-medium ui-autocomplete-input" id="orderNumber"
                name="analyse.orderNumber">
        </div>
        <%--<div class="form-group">
            <label class="control-label"> <span
                    class="h4 font-thin v-middle">产品名称:</span></label> <input
                class="input-medium ui-autocomplete-input" id="productName"
                name="analyse.productName">
        </div>--%>
        <div class="form-group">
            <label class="control-label"> <span
                    class="h4 font-thin v-middle">产品图号:</span></label> <input
                class="input-medium ui-autocomplete-input" id="productPicNo"
                name="analyse.productPicNo">
        </div>
        <p></p>
        <div class="form-group">
            <label class="control-label"> <span
                    class="h4 font-thin v-middle">日期:</span></label>
            <input class="Wdate" id="createDate1"
                   name="analyse.createDate1" onClick="WdatePicker()">&nbsp;至
            <input class="Wdate" id="createDate2"
                   name="analyse.createDate2" onClick="WdatePicker()">
        </div>
        <div class="form-group">
            <label class="control-label"> <span
                    class="h4 font-thin v-middle">所属客户:</span></label>
            <select id="customerId" name="analyse.customerId" style="width: 155px;height: 27.5px;">
                <option value="">请选择</option>
                <c:forEach items="${customer}" var="c">
                    <option value="${c.id}">${c.company}</option>
                </c:forEach>
            </select>
        </div>
        <a href="javascript:void(0)" class="btn btn-default" id="search">统计查询</a>
        <a href="javascript:void(0)" class="btn btn-default" id="resetSearch">重置</a>
        <a href="javascript:void(0)" class="btn btn-info" id="excel">导出excel</a>
        <div class="form-group"><h5 style="color: red;">注：请输入查询日期范围，再进行统计查询！</h5></div>
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
