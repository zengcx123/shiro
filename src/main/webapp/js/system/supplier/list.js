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
			colkey : "company",
			name : "供应商名称",
			isSort:true,
		}, {
			colkey : "number",
			name : "供应商编号",
			isSort:true
		}, {
			colkey : "product",
			name : "供应产品"
		}, {
			colkey : "name",
			name : "联系人"
		},  {
			colkey : "sex",
			name : "性别"
		},{
			colkey : "telephone",
			name : "联系方式"
		}, {
			colkey : "email",
			name : "邮箱"
		}, {
			colkey : "invoice",
			name : "开票资料"
		}],
		jsonUrl : rootPath + '/supplier/findByPage.shtml',
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
		area : [ "95%", "95%" ],
		content : rootPath + '/supplier/addUI.shtml'
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
		area : [ "95%", "95%" ],
		content : rootPath + '/supplier/editUI.shtml?id=' + cbox
	});
}
function delFun() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/supplier/deleteEntity.shtml';
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
	$("#company").val("");
	$("#name").val("");
	$("#telephone").val("");
	var searchParams = $("#searchForm").serializeJson();// 初始化传参数
	grid.setOptions({
		data: searchParams
	});
}