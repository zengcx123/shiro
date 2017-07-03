var pageii = null;
var grid = null;
$(function() {
	
	grid = lyGrid({
		pagId : 'paging',
		l_column : [ {
			colkey : "id1",
			name : "序号",
			hide : true
		},{
			colkey : "rawId",
			name : "rawId1",
			hide : true
		},{
			colkey : "useNo1",
			name : "领用单号"
		},{
			colkey : "createDate1",
			name : "领用日期",
			isSort:true,
			renderData : function(rowindex,data, rowdata, column) {
				if(data == '' || data == null){
					return "";
				}else{
					return new Date(data).format("yyyy-MM-dd");
				}
			}
		},{
			colkey : "person1",
			name : "领用人员"
		},{
			colkey : "detail",
			name : "操作",
			renderData : function(rowindex,data, rowdata, column) {
				return "<a href='javascript:addMeterial(\""+rowdata.rawId1+"\")'><span style='color:blue;'>增加材料</span></a>&nbsp;&nbsp;&nbsp;<a href='javascript:detail(\""+rowdata.rawId1+"\")'><span style='color:blue;'>查看详情</span></a>";
			}
		}],
		jsonUrl : rootPath + '/use/findByPage.shtml',
		checkbox : true
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJson();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});

	$("#addFun").click("click", function() {
		addFun();
	});
	$("#resetSearch").click("click", function () {
		resetSearch();
	});
});

function addFun() {
	pageii = layer.open({
		title : "新增",
		type : 2,
		area : [ "50%", "50%" ],
		content : rootPath + '/use/addUI.shtml'
	});
}
function addMeterial(rawId){
	pageii = layer.open({
		title : "新增材料",
		type : 2,
		area : [ "50%", "50%" ],
		content : rootPath + '/use/addMeterialUI.shtml?rawId=' + rawId
	});
}
function detail(rawId){
	pageii = layer.open({
		title : "领用材料详情",
		type : 2,
		area : [ "80%", "80%" ],
		content : rootPath + '/use/meterialUI.shtml?rawId=' + rawId
	});
}
function resetSearch() {
	$("#createDate1").val("");
	var searchParams = $("#searchForm").serializeJson();// 初始化传参数
	grid.setOptions({
		data: searchParams
	});
}