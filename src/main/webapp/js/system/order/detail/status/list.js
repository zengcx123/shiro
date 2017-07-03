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
			colkey : "orderNumber",
			name : "订单号",
			width : "150px",
			isSort:true,
			renderData : function( rowindex ,data, rowdata, colkeyn) {
				return "<a href='javascript:reload(\""+data+"\",\"1\")'>"+data+"</a>";
			}
		},{
			colkey : "productName",
			name : "产品名称",
			width : "120px",
			isSort:true,
			renderData : function( rowindex ,data, rowdata, colkeyn) {
				return "<a href='javascript:reload(\""+data+"\",\"2\")'>"+data+"</a>";
			}
		}, {
			colkey : "productPicNo",
			name : "图号",
			isSort:true,
			renderData : function( rowindex ,data, rowdata, colkeyn) {
				return "<a href='javascript:reload(\""+data+"\",\"3\")'>"+data+"</a>";
			}
		},{
			colkey : "createDate",
			name : "录入日期",
			isSort:true,
			renderData : function(rowindex,data, rowdata, column) {
				return (data == null || data == "" || data == undefined) ? "" : new Date(data).format("yyyy-MM-dd");
			}
		}, {
			colkey : "total",
			name : "需求总量"
		},{
			colkey : "inspection",
			name : "送检数量"
		},{
			colkey : "accBack",
			name : "验退数量"
		}, {
			colkey : "inStock",
			name : "入库数量"
		},{
			colkey : "outStock",
			name : "出库数量"
		}/*,{
			colkey : "stock",
			name : "库存数量"
		},{
			colkey : "owe",
			name : "欠货数量"
		}*/,{
			colkey : "back",
			name : "退货数量"
		}/*,{
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
		}*/],
		jsonUrl : rootPath + '/order/detail/status/findByPage.shtml',
		checkbox : true
	});

	$("#search").click("click", function() {// 绑定查询按扭
		var searchParams = $("#searchForm").serializeJson();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
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
	if(type=='1'){
		$("#orderNumber").val(data);
	}else if(type=='3'){
		$("#productPicNo").val(data);
	}else{
		$("#productName").val(data);
	}
	var searchParams = $("#searchForm").serializeJson();// 初始化传参数
	grid.setOptions({
		data : searchParams
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
		area : [ "900px", "95%" ],
		content : rootPath + '/order/detail/status/editUI.shtml?id=' + cbox
	});
}
function delFun() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/order/detail/status/deleteEntity.shtml';
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
	$("#orderNumber").val("");
	$("#productName").val("");
	$("#productPicNo").val("");
	$("#createDate1").val("");
	$("#createDate2").val("");
	var searchParams = $("#searchForm").serializeJson();// 初始化传参数
	grid.setOptions({
		data: searchParams
	});
}