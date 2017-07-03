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
			colkey : "productId",
			name : "产品主键",
			hide : true
		}, {
			colkey : "productName",
			name : "产品名称",
			isSort:true,
			renderData : function( rowindex ,data, rowdata, colkeyn) {
				return "<a href='javascript:reload(\""+data+"\",\"1\")'>"+data+"</a>";
			}
		}, {
			colkey : "productPicNo",
			name : "图号",
			isSort:true,
			renderData : function( rowindex ,data, rowdata, colkeyn) {
				return "<a href='javascript:reload(\""+data+"\",\"2\")'>"+data+"</a>";
			}
		},  {
			colkey : "productMaterial",
			name : "材质",
			isSort:true
		},{
			colkey : "productWeight",
			name : "单重",
			isSort:true
		}, {
			colkey : "productUnit",
			name : "单位",
			isSort:true
		}, {
			colkey : "productPrice",
			name : "单价",
			isSort:true
		},{
			colkey : "stock",
			name : "库存",
			isSort:true
		}],
		jsonUrl : rootPath + '/model/findByPage.shtml',
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
function reload(data,type){
	if(type == '1'){
		$("#productName").val(data);
	}else{
		$("#productPicNo").val(data);
	}
	var searchParams = $("#searchForm").serializeJson();// 初始化传参数
	grid.setOptions({
		data : searchParams
	});
}
function addFun() {
	pageii = layer.open({
		title : "新增",
		type : 2,
		area : [ "700px", "42%" ],
		content : rootPath + '/model/addUI.shtml'
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
		area : [ "600px", "42%" ],
		content : rootPath + '/model/editUI.shtml?id=' + cbox
	});
}
function delFun() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/model/deleteEntity.shtml';
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
	$("#productName").val("");
	$("#productPicNo").val("");
	var searchParams = $("#searchForm").serializeJson();// 初始化传参数
	grid.setOptions({
		data: searchParams
	});
}