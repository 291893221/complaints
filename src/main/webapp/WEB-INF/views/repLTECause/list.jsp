<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LTE类投诉投诉原因分析</title>
<%@include file="../common/head.jsp"%>
<script type="text/javascript">
	$(function() {
		//datagrid初始化 
		$('#list').datagrid({
			title : 'LTE类投诉投诉原因分析',
			iconCls : 'icon-edit',//图标 
			width : 'auto',
			height : 'auto',
			//nowrap : false,
			striped : true,
			border : true,
			collapsible : false,//是否可折叠的 
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

	function doSearch() {
		//获取时间
		var start = $("#start").datebox("getValue");
		var end = $("#end").datebox("getValue");
		$('#list').datagrid('load', {
			start : start,
			end : end
		});
	}
</script>
</head>
<body>
	<div id="toolbar">
		<div style="margin-bottom: 5px">
			开始时间: <input id="start" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" editable="false">
			结束时间: <input id="end" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" editable="false">
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true">导出</a>
		</div>
	</div>
	<table id="list" cellspacing="0" cellpadding="0" toolbar="#toolbar">
		<thead>
			<tr>
				<th field="TIMEPERIOD1" width="100" sortable="true">开始时间</th>
				<th field="TIMEPERIOD2" width="100" sortable="true">结束时间</th>
				<th field="FIELD20" width="100" sortable="true">投诉原因</th>
				<th field="QIANZHOUCNT" width="100" sortable="true">上周期投诉量</th>
				<th field="BENZHOUCNT" width="100" sortable="true">本周期投诉量</th>
				<th field="OLDQIANZHOUCNT" width="100" sortable="true">去年往期投诉量</th>
				<th field="OLDBENZHOUCNT" width="100" sortable="true">去年同期投诉量</th>
				<th field="COVER" width="100" sortable="true" formatter="percentFormatter">投诉量占比</th>
				<th field="TONGBI" width="100" sortable="true" formatter="percentFormatter">同比</th>
				<th field="HUANBI" width="100" sortable="true" formatter="percentFormatter">环比</th>
			</tr>
		</thead>
	</table>
</body>
</html>