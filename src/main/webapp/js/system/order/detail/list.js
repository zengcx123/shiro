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
			width:"150px",
			isSort:true,
			renderData : function( rowindex ,data, rowdata, colkeyn) {
				return "<a href='javascript:reload(\""+data+"\",\"1\")'>"+data+"</a>";
			}
		},{
			colkey : "productName",
			name : "产品名称",
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
		}/*, {
			colkey : "productNumber",
			name : "产品编号"
		}*/,  {
			colkey : "productWeight",
			name : "产品单重",
			isSort:true
		}, {
			colkey : "productUnit",
			name : "产品单位",
			isSort:true
		}, {
			colkey : "productPrice",
			name : "产品单价（元）",
			isSort:true
		},{
			colkey : "productMaterial",
			name : "产品材质"
		},{
			colkey : "total",
			name : "需求总量",
			isSort:true
		},{
			colkey : "deliveryDate",
			name : "交货期",
			width:"85px",
			isSort:true,
			renderData : function(rowindex,data, rowdata, column) {
				if(data == '' || data == null){
					return "";
				}else{
					return new Date(data).format("yyyy-MM-dd");
				}
			}

		},{
			colkey : "relDeliveryDate",
			name : "实际交货期",
			width:"85px",
			isSort:true,
			renderData : function(rowindex,data, rowdata, column) {
				if(data == '' || data == null){
					return "";
				}else{
					return new Date(data).format("yyyy-MM-dd");
				}
			}
		},{
			colkey : "isBack",
			name : "是否补退",
			isSort:true,
			renderData : function(rowindex,data, rowdata, column) {
				if(data == '0'){
					return "补退";
				}else if(data == '1'){
					return "不补退";
				}else{
					return "";
				}
			}
		},{
			colkey : "isFinish",
			name : "是否完成",
			isSort:true,
			renderData : function(rowindex,data, rowdata, column) {
				if(data == '1'){
					return "<span style='color:green;'>完成</span>";
				}else if(data == '0'){
					return "<a href='javascript:updateStatus(\""+rowdata.id+"\")'><span style='color:red;'>未完成</span></a>";
				}else{
					return "";
				}
			}
		},{
			colkey : "remark",
			name : "备注"
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
		jsonUrl : rootPath + '/order/detail/findByPage.shtml',
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
	$("#addDetailStatus").click("click", function() {
		addDetailStatus();
	});
	$("#resetSearch").click("click", function () {
		resetSearch();
	});
});
function updateStatus(id){
	pageii = layer.open({
		title : "修改完成状态",
		type : 2,
		area : [ "500px", "40%" ],
		content : rootPath + '/order/detail/updateStatusUI.shtml?id=' + id
	});
}
function addDetailStatus(){
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
		layer.msg("此订单详情已完成");
		return;
	}
	pageii = layer.open({
		title : "新增订单详情状态",
		type : 2,
		area : [ "800px", "80%" ],
		content : rootPath + '/order/detail/status/addUI.shtml?id=' + cbox
	});
}

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
		area : [ "800px", "70%" ],
		content : rootPath + '/order/detail/editUI.shtml?id=' + cbox
	});
}
function delFun() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/order/detail/deleteEntity.shtml';
		var s = CommnUtil.ajax(url, {
			ids : cbox.join(",")
		}, "json");
		if (s == "success") {
			layer.msg('删除成功');
			grid.loadData();
		} else if(s == "1"){
			layer.msg('订单详情有关联信息，不可删除');
		} else {
			layer.msg('删除失败');
		}
	});
}
function resetSearch() {
	$("#orderNumber").val("");
	$("#productName").val("");
	$("#productPicNo").val("");
	$("#isFinish").prop('selectedIndex', 0);
	var searchParams = $("#searchForm").serializeJson();// 初始化传参数
	grid.setOptions({
		data: searchParams
	});
}