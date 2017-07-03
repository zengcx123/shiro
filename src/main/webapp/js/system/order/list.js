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
			colkey : "orderNumber",
			name : "订单号",
			isSort:true,
			width:"135px",
			renderData : function( rowindex ,data, rowdata, colkeyn) {
				return "<a href='javascript:reload(\""+data+"\",\"1\")'>"+data+"</a>";
			}

		}, {
			colkey : "createTime",
			name : "录入日期",
			width:"85px",
			isSort:true,
			renderData : function(rowindex,data, rowdata, column) {
				if(data == '' || data == null){
					return "";
				}else{
					return new Date(data).format("yyyy-MM-dd");
				}
			}
		}, {
			colkey : "receiveDate",
			name : "接单日期",
			width:"85px",
			isSort:true,
			renderData : function(rowindex,data, rowdata, column) {
				if(data == '' || data == null){
					return "";
				}else{
					return new Date(data).format("yyyy-MM-dd");
				}
			}
		}, {
			colkey : "customerId",
			name : "客户",
			isSort:true,
		},  {
			colkey : "orderNatureId",
			name : "订单性质",
			width:"80px",
			isSort:true,
		},{
			colkey : "money",
			name : "采购金额（元）",
			isSort:true
		}, {
			colkey : "currency",
			name : "币种",
			width:"50px",
		}, {
			colkey : "tax",
			name : "税额",
			width:"50px",
		},{
			colkey : "cess",
			name : "税率",
			width:"50px",
		},{
			colkey : "way",
			name : "交易方式",
			width:"80px",
		},{
			colkey : "signStatus",
			name : "回签状态",
			width:"80px",
			isSort:true,
			renderData : function(rowindex,data, rowdata, column) {
				if(data == 0){
					return "回签";
				}else{
					return "不回签";
				}
			}
		},{
			colkey : "signDate",
			name : "回签日期",
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
			colkey : "count",
			name : "数量合计",
			width:"85px",
			isSort:true,
		},/*{
			colkey : "deliveryDate",
			name : "交货期",
			renderData : function(rowindex,data, rowdata, column) {
				return (data == null || data == "" || data == undefined) ? "" : new Date(data).format("yyyy-MM-dd");
			}
		},{
			colkey : "relDeliveryDate",
			name : "真实交货期",
			renderData : function(rowindex,data, rowdata, column) {
				return (data == null || data == "" || data == undefined) ? "" : new Date(data).format("yyyy-MM-dd");
			}
		},*/{
			colkey : "single",
			name : "下单人员",
			width:"60px",
			isSort:true
		},{
			colkey : "isFinish",
			name : "是否完成",
			width:"60px",
			isSort:true,
			renderData : function(rowindex,data, rowdata, column) {
				if(data == '1'){
					return "<a href='javascript:searchDetail(\""+rowdata.id+"\")'><span style='color:green;'>完成</span></a>";
				}else if(data == '0'){
					return "<a href='javascript:searchDetail(\""+rowdata.id+"\")'><span style='color:red;'>未完成</span></a>";
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
		}*//*,{
			name : "操作",
			renderData : function( rowindex ,data, rowdata, colkeyn) {
				return "<a href='javascript:detail("+rowdata.id+")'>订单详情</a>";
			}
		}*/],
		jsonUrl : rootPath + '/order/findByPage.shtml',
		//dymCol:true,
		checkbox : true,
		//serNumber : true
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
	$("#addDetail").click("click", function() {
		addDetail();
	});
	$("#resetSearch").click("click", function () {
		resetSearch();
	});
});

function searchDetail(id){
	pageii = layer.open({
		title : "订单详情",
		type : 2,
		area : [ "900px", "90%" ],
		content : rootPath + '/order/searchDetailUI.shtml?id=' + id
	});
}

function addDetail(){
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
		layer.msg("此订单已完成");
		return;
	}
	pageii = layer.open({
		title : "新增订单详情",
		type : 2,
		area : [ "800px", "70%" ],
		content : rootPath + '/order/detail/addUI.shtml?id=' + cbox
	});
}

function addFun() {
	pageii = layer.open({
		title : "新增",
		type : 2,
		area : [ "95%", "95%" ],
		content : rootPath + '/order/addUI.shtml'
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
		content : rootPath + '/order/editUI.shtml?id=' + cbox
	});
}
function delFun() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/order/deleteEntity.shtml';
		var s = CommnUtil.ajax(url, {
			ids : cbox.join(",")
		}, "json");
		if (s == "success") {
			layer.msg('删除成功');
			grid.loadData();
		} else if(s == "1"){
			layer.msg('订单有关联信息，不可删除');
		} else {
			layer.msg('删除失败');
		}
	});
}

function selectUrl(rel){
	$("li[name=sys_menu_li]").each(function(){
		$(this).attr("class","");
		if(rel == $(this).attr("rel")){
			$(this).parent().prev().click();
			$(this).attr("class","active");
		}
	});
}

function reload(data,type){
	if(type=='1'){
		$("#orderNumber").val(data);
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
	$("#customerId").prop('selectedIndex', 0);
	$("#createTime").val("");
	$("#isFinish").prop('selectedIndex', 0);
	var searchParams = $("#searchForm").serializeJson();// 初始化传参数
	grid.setOptions({
		data: searchParams
	});
}