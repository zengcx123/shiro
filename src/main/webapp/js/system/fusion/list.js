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
			colkey : "useId1",
			name : "useId1",
			hide : true
		},{
			colkey : "fusionNo1",
			name : "炉号"
		},{
			colkey : "createDate1",
			name : "熔炼日期",
			isSort:true,
			renderData : function(rowindex,data, rowdata, column) {
				if(data == '' || data == null){
					return "";
				}else{
					return new Date(data).format("yyyy-MM-dd");
				}
			}
		},{
			colkey : "result1",
			name : "熔炼结果",
			renderData : function(rowindex,data, rowdata, column) {
				if(data == '1'){
					return "铁";
				}else if(data == '2'){
					return "钢";
				}else{
					return "";
				}
			}
		},{
			colkey : "person1",
			name : "操作员"
		},{
			colkey : "detail",
			name : "操作",
			isSort:true,
			renderData : function(rowindex,data, rowdata, column) {
				return "<a href='javascript:addMeterial(\""+rowdata.rawId1+"\",\""+rowdata.useId1+"\")'><span style='color:blue;'>增加熔炼记录</span></a>&nbsp;&nbsp;&nbsp;<a href='javascript:detail(\""+rowdata.rawId1+"\")'><span style='color:blue;'>查看详情</span></a>";
			}
		}],
		jsonUrl : rootPath + '/fusion/findByPage.shtml',
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
		area : [ "60%", "65%" ],
		content : rootPath + '/fusion/addUI.shtml'
	});
}
function addMeterial(rawId,useId){
	pageii = layer.open({
		title : "新增材料",
		type : 2,
		area : [ "50%", "50%" ],
		content : rootPath + '/fusion/addMeterialUI.shtml?rawId=' + rawId + '&useId=' + useId
	});
}
function detail(rawId){
	pageii = layer.open({
		title : "熔炼记录详情",
		type : 2,
		area : [ "80%", "80%" ],
		content : rootPath + '/fusion/meterialUI.shtml?rawId=' + rawId
	});
}
function resetSearch() {
	$("#createDate1").val("");
	$("#fusionNo1").val("");
	var searchParams = $("#searchForm").serializeJson();// 初始化传参数
	grid.setOptions({
		data: searchParams
	});
}