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
			width : "120px",
			isSort:true,
			renderData : function( rowindex ,data, rowdata, colkeyn) {
				return "<a href='javascript:reload(\""+data+"\",\"1\")'>"+data+"</a>";
			}
		},{
			colkey : "productName",
			name : "产品名称",
			width : "110px"/*,
			renderData : function( rowindex ,data, rowdata, colkeyn) {
				return "<a href='javascript:reload(\""+data+"\",\"2\")'>"+data+"</a>";
			}*/
		},/*{
			colkey : "createDate",
			name : "日期",
			renderData : function(rowindex,data, rowdata, column) {
				return (data == null || data == "" || data == undefined) ? "" : new Date(data).format("yyyy-MM-dd");
			}
		},*/{
			colkey : "productPicNo",
			name : "图号",
			width : "70px",
			renderData : function( rowindex ,data, rowdata, colkeyn) {
				return "<a href='javascript:reload(\""+data+"\",\"3\")'>"+data+"</a>";
			}
		},{
			colkey : "productMaterial",
			name : "材质",
			width : "70px"
		},{
			colkey : "productWeight",
			name : "单重",
			width : "50px"
		},{
			colkey : "total",
			name : "需求总数",
			width : "50px"
		},{
			colkey : "inspectionCount",
			name : "送检总数",
			width : "50px"
		},{
			colkey : "accBackCount",
			name : "验退总数",
			width : "50px"
		},{
			colkey : "inStockCount",
			name : "入库总数",
			width : "50px"
		},{
			colkey : "outStockCount",
			name : "出库总数",
			width : "50px"
		},{
			colkey : "stockCount",
			name : "库存总数",
			width : "50px",
			renderData : function(rowindex,data, rowdata, column) {
				return "<span style='color:orange;'>"+data+"</span>";
			}
		},{
			colkey : "oweCount",
			name : "欠货总数",
			width : "50px"
		},{
			colkey : "backCount",
			name : "退货总数",
			width : "50px"
		},{
			colkey : "deliveryDate",
			name : "交货期",
			width : "85px",
			renderData : function(rowindex,data, rowdata, column) {
				return (data == null || data == "" || data == undefined) ? "" : new Date(data).format("yyyy-MM-dd");
			}
		},{
			colkey : "relDeliveryDate",
			name : "实际交货期",
			width : "85px",
			renderData : function(rowindex,data, rowdata, column) {
				return (data == null || data == "" || data == undefined) ? "" : new Date(data).format("yyyy-MM-dd");
			}
		},{
			colkey : "isBack",
			name : "是否补退",
			width : "55px",
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
			width : "55px",
			renderData : function(rowindex,data, rowdata, column) {
				if(data == '0'){
					return "<span style='color: red;'>未完成</span>";
				}else if(data == '1'){
					return "<span style='color: green;'>完成</span>";
				}else{
					return "";
				}
			}
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
		jsonUrl : rootPath + '/analyse/findByPage.shtml'
	});

	$("#search").click("click", function() {// 绑定查询按扭
		var createDate1 = $("#createDate1").val();
		var createDate2 = $("#createDate2").val();
		if(createDate1 == "" || createDate2 == ""){
			layer.msg("请输入查询日期范围");
			return false;
		}
		var searchParams = $("#searchForm").serializeJson();// 初始化传参数
		grid.setOptions({
			data : searchParams
		});
	});

	$("#excel").click("click", function() {
		var createDate1 = $("#createDate1").val();
		var createDate2 = $("#createDate2").val();
		var customerId = $("#customerId").val();
		if(createDate1 == "" || createDate2 == ""){
			layer.msg("请输入导出日期范围");
			return false;
		}
		if(customerId == "" || customerId == ""){
			layer.msg("请选择导出客户");
			return false;
		}
		grid.exportDataWithCondition("/analyse/export.shtml",$("#orderNumber").val(),$("#productName").val(),$("#createDate1").val(),$("#createDate2").val(),$("#customerId").val());
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
function resetSearch() {
	$("#orderNumber").val("");
	$("#productName").val("");
	$("#productPicNo").val("");
	$("#createDate1").val("");
	$("#createDate2").val("");
	$("#customerId").prop('selectedIndex', 0);
	var searchParams = $("#searchForm").serializeJson();// 初始化传参数
	grid.setOptions({
		data: searchParams
	});
}