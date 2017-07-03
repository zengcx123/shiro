var pageii = null;
var grid = null;
$(function() {
	
	grid = lyGrid({
		pagId : 'paging',
		l_column : [ {
			colkey : "id",
			name : "序号",
			hide : true
		},{
			colkey : "productId",
			name : "productId",
			hide : true
		},{
			colkey : "planNo",
			name : "生产计划编号",
			width:"200px"
		},{
			colkey : "company",
			name : "委铸单位",
			width:"90px"
		},{
			colkey : "productName",
			name : "产品名称",
			width:"90px"
		},{
			colkey : "productPicNo",
			name : "产品图号",
			width:"90px"
		},{
			colkey : "count",
			name : "数量",
			width:"50px"
		},{
			colkey : "needDate",
			name : "需交日期",
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
			name : "造型总数",
			width:"50px"
		},{
			colkey : "box",
			name : "配箱总数",
			width:"50px"
		},{
			colkey : "bell",
			name : "浇注总数",
			width:"50px"
		},{
			colkey : "openBox",
			name : "开箱总数",
			width:"50px"
		},{
			colkey : "polish",
			name : "打磨总数",
			width:"50px"
		},{
			colkey : "hot",
			name : "热处理总数",
			width:"50px"
		},{
			colkey : "sand",
			name : "抛沙总数",
			width:"50px"
		},{
			colkey : "inspection",
			name : "送检总数",
			width:"50px"
		},{
			colkey : "back",
			name : "验退总数",
			width:"50px"
		},{
			colkey : "inStock",
			name : "入库总数",
			width:"50px"
		},{
			colkey : "reject",
			name : "报废总数",
			width:"50px"
		},{
			colkey : "owe",
			name : "欠货总数",
			width:"50px"
		},{
			colkey : "isFinish",
			name : "是否完成",
			width:"60px",
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
		},{
			colkey : "detail",
			name : "操作",
			width:"200px",
			renderData : function(rowindex,data, rowdata, column) {
				return "<a href='javascript:addDetail(\""+rowdata.id+"\")'><span style='color:blue;'>新增详情</span></a>&nbsp;&nbsp;&nbsp;<a href='javascript:deleteDetail(\""+rowdata.id+"\")'><span style='color:blue;'>删除详情</span></a>&nbsp;&nbsp;&nbsp;<a href='javascript:detail(\""+rowdata.id+"\")'><span style='color:blue;'>查看详情</span></a>";
			}
		}],
		jsonUrl : rootPath + '/produce/findByPage.shtml',
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
	$("#addProduceDetailStatus").click("click", function() {
		addProduceDetailStatus();
	});
	$("#resetSearch").click("click", function () {
		resetSearch();
	});
});

function addFun() {
	pageii = layer.open({
		title : "新增",
		type : 2,
		area : [ "60%", "70%" ],
		content : rootPath + '/produce/addUI.shtml'
	});
}

function addDetail(id){
	pageii = layer.open({
		title : "新增具体生产计划",
		type : 2,
		area : [ "50%", "50%" ],
		content : rootPath + '/produce/addDetailUI.shtml?id=' + id
	});
}

function deleteDetail(id){
	layer.confirm('是否删除生产计划详情？', function(index) {
		var url = rootPath + '/produce/deleteDetailEntity.shtml';
		var s = CommnUtil.ajax(url, {
			id : id
		}, "json");
		if (s == "success") {
			layer.msg('删除成功');
			grid.loadData();
		} else {
			layer.msg('删除失败');
		}
	});
}

function detail(id){
	pageii = layer.open({
		title : "生产计划详情",
		type : 2,
		area : [ "80%", "80%" ],
		content : rootPath + '/produce/detailUI.shtml?id=' + id
	});
}

function resetSearch() {
	$("#productName").val("");
	$("#productPicNo").val("");
	$("#needDate").val("");
	$("#isFinish").prop('selectedIndex', 0);
	var searchParams = $("#searchForm").serializeJson();// 初始化传参数
	grid.setOptions({
		data: searchParams
	});
}

function addProduceDetailStatus(){
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
		layer.msg("此生产计划已完成");
		return;
	}
	pageii = layer.open({
		title : "新增生产详情状态",
		type : 2,
		area : [ "1000px", "95%" ],
		content : rootPath + '/produce/addStatusUI.shtml?planId=' + cbox
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
		area : [ "60%", "70%" ],
		content : rootPath + '/produce/editUI.shtml?id=' + cbox
	});
}
function delFun() {
	var cbox = grid.getSelectedCheckbox();
	if (cbox == "") {
		layer.msg("请选择删除项！");
		return;
	}
	layer.confirm('是否删除？', function(index) {
		var url = rootPath + '/produce/deleteEntity.shtml';
		var s = CommnUtil.ajax(url, {
			ids : cbox.join(",")
		}, "json");
		if (s == "success") {
			layer.msg('删除成功');
			grid.loadData();
		} else if(s == "1"){
			layer.msg('生产计划有关联信息，不可删除');
		} else {
			layer.msg('删除失败');
		}
	});
}