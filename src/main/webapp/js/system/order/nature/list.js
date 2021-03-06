var pageii = null;
var grid = null;
$(function() {
	
	grid = lyGrid({
		pagId : 'paging',
		l_column : [ {
			colkey : "id",
			name : "id",
			hide : true
		}, {
			colkey : "nature",
			name : "订单性质",
			isSort:true,
		},{
			colkey : "temp1",
			name : "备用1",
			hide : true
		}, {
			colkey : "temp2",
			name : "备用2",
			hide : true
		}, {
			colkey : "temp3",
			name : "备用3",
			hide : true
		}, {
			colkey : "temp4",
			name : "备用4",
			hide : true
		}, {
			colkey : "temp5",
			name : "备用5",
			hide : true
		}, {
			colkey : "temp6",
			name : "备用6",
			hide : true
		}, {
			colkey : "temp7",
			name : "备用7",
			hide : true
		}, {
			colkey : "temp8",
			name : "备用8",
			hide : true
		}, {
			colkey : "temp9",
			name : "备用9",
			hide : true
		}, {
			colkey : "temp10",
			name : "备用10",
			hide : true
		}],
		jsonUrl : rootPath + '/order/nature/findByPage.shtml',
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
	$("#editFun").click("click", function() {
		editFun();
	});
	$("#delFun").click("click", function() {
		delFun();
	});
	$("#resetSearch").click("click", function () {
		resetSearch();
	});
});

function addFun() {
	pageii = layer.open({
		title : "新增",
		type : 2,
		area : [ "50%", "40%" ],
		content : rootPath + '/order/nature/addUI.shtml'
	});
}
function editFun() {
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
		area : [ "50%", "40%" ],
		content : rootPath + '/order/nature/editUI.shtml?id=' + cbox
	});
}
function delFun() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/order/nature/deleteEntity.shtml';
		var s = CommnUtil.ajax(url, {
			ids : cbox.join(",")
		}, "json");
		if (s == "success") {
			layer.msg('删除成功');
			grid.loadData();
		} else {
			layer.msg('删除失败');
		}
	});
}
function resetSearch() {
	$("#nature").val("");
	var searchParams = $("#searchForm").serializeJson();// 初始化传参数
	grid.setOptions({
		data: searchParams
	});
}