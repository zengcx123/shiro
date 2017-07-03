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
			colkey : "buyNo",
			name : "采购单号",
			width : "200px",
		}, {
			colkey : "company",
			name : "供应商",
			isSort:true,
		}, {
			colkey : "material",
			name : "材料",
			isSort:true
		}, {
			colkey : "count",
			name : "数量"
		}, {
			colkey : "createDate",
			name : "录入日期",
			width : "90px",
			isSort:true,
			renderData : function(rowindex,data, rowdata, column) {
				if(data == '' || data == null){
					return "";
				}else{
					return new Date(data).format("yyyy-MM-dd");
				}
			}
		},{
			colkey : "needDate",
			name : "需交日期",
			isSort:true,
			width : "90px",
			renderData : function(rowindex,data, rowdata, column) {
				if(data == '' || data == null){
					return "";
				}else{
					return new Date(data).format("yyyy-MM-dd");
				}
			}
		}, {
			colkey : "deliveryDate",
			name : "交货日期",
			isSort:true,
			width : "90px",
			renderData : function(rowindex,data, rowdata, column) {
				if(data == '' || data == null){
					return "";
				}else{
					return new Date(data).format("yyyy-MM-dd");
				}
			}
		}, {
			colkey : "inspectionDate",
			name : "检验日期",
			isSort:true,
			width : "90px",
			renderData : function(rowindex,data, rowdata, column) {
				if(data == '' || data == null){
					return "";
				}else{
					return new Date(data).format("yyyy-MM-dd");
				}
			}
		}, {
			colkey : "inStockDate",
			name : "入库日期",
			isSort:true,
			width : "90px",
			renderData : function(rowindex,data, rowdata, column) {
				if(data == '' || data == null){
					return "";
				}else{
					return new Date(data).format("yyyy-MM-dd");
				}
			}
		},{
			colkey : "identification",
			name : "标识号"
		},{
			colkey : "remark",
			name : "备注"
		},{
			colkey : "person",
			name : "采购人员"
		}, {
			colkey : "isFinish",
			name : "是否完成",
			isSort:true,
			renderData : function(rowindex,data, rowdata, column) {
				if(data == '1'){
					return "<span style='color:green;'>完成</span>";
				}else if(data == '0'){
					return "<span style='color:red;'>未完成</span>";
				}else{
					return "";
				}
			}
		}],
		jsonUrl : rootPath + '/buy/findByPage.shtml',
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
		content : rootPath + '/buy/addUI.shtml'
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
	var row = grid.selectRow();
	var isFinish = eval(JSON.stringify(row))[0].isFinish;
	if (isFinish == 1) {
		layer.msg("此采购单已完成");
		return;
	}
	pageii = layer.open({
		title : "编辑",
		type : 2,
		area : [ "95%", "95%" ],
		content : rootPath + '/buy/editUI.shtml?id=' + cbox
	});
}
function delFun() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！");
		return;
	}
	var row = grid.selectRow();
	var isFinish = eval(JSON.stringify(row))[0].isFinish;
	if (isFinish == 1) {
		layer.msg("此采购单已完成");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/buy/deleteEntity.shtml';
		var s = CommnUtil.ajax(url, {
			ids : cbox.join(",")
		}, "json");
		if (s == "success") {
			layer.msg('删除成功');
			grid.loadData();
		} else if(s == '1'){
			layer.msg("此采购单已完成");
			return;
		}else {
			layer.msg('删除失败');
		}
	});
}
function resetSearch() {
	$("#supplierName").val("");
	$("#material").val("");
	$("#createDate").val("");
	$("#isFinish").prop('selectedIndex', 0);
	var searchParams = $("#searchForm").serializeJson();// 初始化传参数
	grid.setOptions({
		data: searchParams
	});
}