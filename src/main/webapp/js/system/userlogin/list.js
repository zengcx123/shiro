var pageii = null;
var grid = null;
$(function() {
	grid = lyGrid({
		id : 'paging',
		l_column : [ {
			colkey : "id",
			name : "id",
			width : "50px",
			hide : true
		}, {
			colkey : "accountName",
			name : "账号"
		},{
			colkey : "loginTime",
			name : "登入时间",
			renderData : function(rowindex,data, rowdata, column) {
				return new Date(data).format("yyyy-MM-dd hh:mm:ss");
			}
		} , {
			colkey : "loginIP",
			name : "登入IP"
		}],
		jsonUrl : rootPath + '/userlogin/findByPage.shtml',
		checkbox : true
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJson();
		grid.setOptions({
			data : searchParams
		});
	});

	$("#resetSearch").click("click", function () {
		resetSearch();
	});
});
function resetSearch() {
	$("#accountName").val("");
	var searchParams = $("#searchForm").serializeJson();// 初始化传参数
	grid.setOptions({
		data: searchParams
	});
}