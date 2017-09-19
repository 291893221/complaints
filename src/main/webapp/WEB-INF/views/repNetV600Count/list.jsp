<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>投诉总量分析</title>
<%@include file="../common/head.jsp"%>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/common/dateUtil.js"></script>
<script type="text/javascript">
	$(function() {
		//设置上一周时间
		setDateWeek();
		
		//画图
		getChartUrl();
		
		//datagrid初始化 
		$('#list').datagrid({
			//title : '投诉总量分析',
			//iconCls : 'icon-edit',//图标 
			width : 'auto',
			height : 'auto',
			striped : true,
			border : true,
			collapsible : true,//是否可折叠的 
			fit : true,//自动大小 
			url : 'listJson',
			//sortName : 'account',
			//sortOrder : 'desc',
			remoteSort : false,
			idField : 'field0',
			singleSelect : false,//是否单选 
			pagination : true,//分页控件 
			rownumbers : true,//行号 
			frozenColumns : [ [ {
				field : 'ck',
				checkbox : true
			} ] ]
		});
		//设置分页控件 
		var p = $('#list').datagrid('getPager');
		$(p).pagination({
			pageSize : 10,//每页显示的记录条数，默认为10 
			pageList : [ 10, 20, 50, 100 ],//可以设置每页记录条数的列表 
			beforePageText : '第',//页数文本框前显示的汉字 
			afterPageText : '页    共 {pages} 页',
			displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
		});
		
	})

	function getParams() {
		var start = $("#start").datebox("getValue");
		var end = $("#end").datebox("getValue");
		var params = "start=" + start + "&end=" + end;
		return params;
	}

	function getChartUrl() {
		var params = getParams();
		var url = "chartJson?params="+escape(params);
		toChart(url);
	}
	
	function doSearchExt() {
		getChartUrl();
		doSearch();
	}
</script>
</head>
<body>

	<div id="toolbar">
		<div style="margin-bottom: 5px">
			开始时间: <input id="start" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" editable="false">
			结束时间: <input id="end" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" editable="false">
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearchExt()">查询</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true">导出</a>
		</div>
	</div>
	<div>
	<div id="pt" class="easyui-panel" title="报表" style="width:100%;height:160px;padding:0px;" data-options="iconCls:'icon-save',collapsible:true,minimizable:true,maximizable:true,closable:true">
	<table id="list" cellspacing="0" cellpadding="0" toolbar="#toolbar" loadMsg="正在查询...">
		<thead>
			<tr>
				<th field="FIELD7" width="100">开始时间</th>
				<th field="FIELD8" width="100">结束时间</th>
				<th field="FIELD1" width="100">上周期投诉量</th>
				<th field="FIELD2" width="100">本周期投诉量</th>
				<th field="FIELD3" width="100">去年往期投诉量</th>
				<th field="FIELD4" width="100">去年同期投诉量</th>
				<th field="FIELD5" width="100" formatter="percentFormatter">同比</th>
				<th field="FIELD6" width="100" formatter="percentFormatter">环比</th>
			</tr>
		</thead>
	</table>
	</div>
	
	<%@include file="../common/yCountLine.jsp"%>

	</div>
</body>
</html>