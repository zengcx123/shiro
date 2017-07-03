var pageii = null;
var grid = null;
$(function() {
	grid = lyGrid({
		id : 'paging',
		l_column : [ {
			colkey : "id",
			name : "id",
			hide : true
		}, {
			colkey : "name",
			name : "菜单名称",
			width : "150px",
			align : 'left'
		}, {
			colkey : "type",
			name : "菜单类型",
			width : "70px",
		}, {
			colkey : "resKey",
			name : "唯一KEY",
			width : "150px"
		}, {
			colkey : "resUrl",
			name : "URL地址",
			width : "200px"
		},{
			colkey : "ishide",
			name : "是否隐藏",
			width : "50px",
			renderData : function(rowindex, data, rowdata, column) {
				if(data=="0"){
					return "否";
				}else if(data=="1"){
					return "是";
				}
			}
		}, {
			colkey : "description",
			width : "300px",
			name : "描述"
		} ],
		jsonUrl : rootPath + '/resources/treelists.shtml',
		checkbox : true,
		usePage : false,
		records : "treelists",
		treeGrid : {
			type:1,
			tree : true,
			hide:false,
			name : 'name',
			id: "id",
			pid: "parentId"
		}
	});
	$("#seach").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJson();
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
	$("#lyGridUp").click("click", function() {// 上移
		var jsonUrl=rootPath + '/background/resources/sortUpdate.shtml';
		grid.lyGridUp(jsonUrl);
	});
	$("#lyGridDown").click("click", function() {// 下移
		var jsonUrl=rootPath + '/background/resources/sortUpdate.shtml';
		grid.lyGridDown(jsonUrl);
	});
});
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
		content : rootPath + '/resources/editUI.shtml?id=' + cbox
	});
}
function addFun() {
	pageii = layer.open({
		title : "新增",
		type : 2,
		area : [ "95%", "95%" ],
		content : rootPath + '/resources/addUI.shtml'
	});
}
function delFun() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.alert("请选择删除项！！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/resources/deleteEntity.shtml';
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
