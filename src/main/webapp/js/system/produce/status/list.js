var pageii = null;
var grid = null;
$(function() {
	
	grid = lyGrid({
		pagId : 'paging',
		l_column : [ {
			colkey : "id",
			name : "id",
			hide : true
		},{
			colkey : "planId",
			name : "planId",
			hide : true
		},{
			colkey : "planNo",
			name : "生产计划编号",
			width:"200px"
		},{
			colkey : "createDate",
			name : "录入日期",
			width:"105px",
			isSort:true,
			renderData : function(rowindex,data, rowdata, column) {
				if(data == '' || data == null){
					return "";
				}else{
					return new Date(data).format("yyyy-MM-dd");
				}
			}
		},{
			colkey : "model",
			name : "造型数",
			width:"50px"
		},{
			colkey : "modelReject",
			name : "造型报废数",
			width:"50px"
		},{
			colkey : "box",
			name : "配箱数",
			width:"50px"
		},{
			colkey : "boxReject",
			name : "配箱报废数",
			width:"50px"
		},{
			colkey : "bell",
			name : "浇注数",
			width:"50px"
		},{
			colkey : "bellReject",
			name : "浇注报废数",
			width:"50px"
		},{
			colkey : "openBox",
			name : "开箱数",
			width:"50px"
		},{
			colkey : "openBoxReject",
			name : "开箱报废数",
			width:"50px"
		},{
			colkey : "polish",
			name : "打磨数",
			width:"50px"
		},{
			colkey : "polishReject",
			name : "打磨报废数",
			width:"50px"
		},{
			colkey : "hot",
			name : "热处理数",
			width:"50px"
		},{
			colkey : "hotReject",
			name : "热处理报废数",
			width:"50px"
		},{
			colkey : "sand",
			name : "抛沙数",
			width:"50px"
		},{
			colkey : "sandReject",
			name : "抛沙报废数",
			width:"50px"
		},{
			colkey : "inspection",
			name : "送检数",
			width:"50px"
		},{
			colkey : "back",
			name : "验退数",
			width:"50px"
		},{
			colkey : "inStock",
			name : "入库数",
			width:"50px"
		}],
		jsonUrl : rootPath + '/produce/status/findByPage.shtml',
		checkbox : true
	});
	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJson();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});

	/*$("#editFun").click("click", function() {
		editFun();
	});
	$("#delFun").click("click", function() {
		delFun();
	});*/
	$("#resetSearch").click("click", function () {
		resetSearch();
	});
});
/*function editFun() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox.length > 1) {
		layer.msg("只能选中一个");
		return;
	}
	if (cbox == "") {
		layer.msg("请选中一个");
		return;
	}
	pageii = layer.open({
		title : "编辑",
		type : 2,
		area : [ "95%", "95%" ],
		content : rootPath + '/produce/status/editUI.shtml?id=' + cbox
	});
}
function delFun() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/produce/status/deleteEntity.shtml';
		var s = CommnUtil.ajax(url, {
			ids : cbox.join(",")
		}, "json");
		if (s == "success") {
			layer.msg('删除成功');
			grid.loadData();
		}else {
			layer.msg('删除失败');
		}
	});
}*/
function resetSearch() {
	$("#createDate").val("");
	var searchParams = $("#searchForm").serializeJson();// 初始化传参数
	grid.setOptions({
		data: searchParams
	});
}
