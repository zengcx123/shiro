<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html lang="en"
	class="app js no-touch no-android chrome no-firefox no-iemobile no-ie no-ie10 no-ie11 no-ios no-ios7 ipad">
<head>
<%@include file="/common/common.jspf"%>
<script src="${pageContext.request.contextPath}/echarts/esl/esl.js"
	type="text/javascript"></script>
<script src="${pageContext.request.contextPath}/echarts/echarts-all.js"
	type="text/javascript"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/system/monitor/systemInfo.js"></script>
	<script type="text/javascript">
	function modifySer(key){
		$.ajax({
	        async: false,
	        url: "${pageContext.request.contextPath}/monitor/modifySer.shtml",
	        data:{"key":key,"value":$("#"+key).val()},
	        dataType: "json",
	        success: function (data) {
	    	    if(data.flag){
	    	    	alert("更新成功！");
	    	    }else{
	    	    	alert("更新失败！");
	    	    }
	        }
		});
	}
	</script>
</head>
<body class="" style="">
	<section class="vbox">
		<div class="row"
			style="padding-right: 8px; padding-left: 8px; padding-top: 8px; padding-bottom: 30px;">
			<div class="col-md-12 portlet ui-sortable"
				style="padding-bottom: 15px">
				<section class="panel panel-success portlet-item">
					<header class="panel-heading">
						<i class="fa fa-briefcase"></i> 实时监控
					</header>
					<table class="table table-striped table-bordered table-hover"
						width="100%" style="vertical-align: middle;">
						<thead>
							<tr style="background-color: #faebcc; text-align: center;">
								<td width="300">名称</td>
								<td width="500">参数</td>
								<%--<td width="205">预警设置</td>--%>
								<%--<td width="375">邮箱设置</td>--%>
							</tr>
						</thead>
						<tbody id="tbody">
							<tr style="text-align: center;">
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>CPU</td>
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>当前使用率：<span
									id="td_cpuUsage" style="color: red;">50</span> %
								</td>
							</tr>
							<tr style="text-align: center;">
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>服务器内存</td>
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>当前使用率：<span
									id="td_serverUsage" style="color: blue;">50</span> %
								</td>
							</tr>
							<tr style="text-align: center;">
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>JVM内存</td>
								<td style='padding-left: 10px; text-align: left;vertical-align: middle;'>当前使用率：<span
									id="td_jvmUsage" style="color: green;">50</span> %
								</td>
							</tr>
						</tbody>
					</table>
				</section>
			</div>
			<div class="col-md-6">
				<section class="panel panel-info portlet-item">
					<header class="panel-heading">
						<i class="fa fa-th-list"></i> 服务器信息
					</header>
					<div class="panel-body" style="padding: 0px"
						data-url="/monitor/systemInfo.shtml"></div>
				</section>
			</div>
			<div class="col-md-6">
				<section class="panel panel-danger portlet-item">
					<header class="panel-heading">
						<i class="fa fa-fire"></i> 实时监控
					</header>

					<div class="panel-body">
						<div id="main" style="height: 370px;"></div>
					</div>
				</section>
			</div>
			<!-- /.span -->
			<div class="col-md-12" style="margin-top: 10px; height: 330px">
				<section class="panel panel-primary portlet-item">
					<header class="panel-heading">
						<i class="fa fa-rss-square"></i> 实时监控
					</header>

					<div class="panel-body">
						<table style="width: 100%;">
							<tr>
								<td width="33.3%"><div id="main_one" style="height: 240px;"></div></td>
								<td width="33.3%"><div id="main_two" style="height: 240px;"></div></td>
								<td width="33.3%"><div id="main_three"
										style="height: 240px;"></div></td>
							</tr>
						</table>
					</div>
				</section>
			</div>
			<!-- /.span -->
		</div>
	</section>
</body>
</html>
