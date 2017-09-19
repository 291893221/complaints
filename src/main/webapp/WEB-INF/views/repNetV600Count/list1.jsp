<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>投诉总量分析</title>
<%@include file="../common/head.jsp"%>
<script type="text/javascript">
	$(function() {
		//datagrid初始化 
		$('#list').datagrid({
			title : '投诉总量分析',
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
			} ] ],
			/*toolbar : [ {
				text : '刷新',
				iconCls : 'icon-reload',
				handler : function() {
					$('#list').datagrid('load');
				}
			}, '-', {
				text : '导出',
				iconCls : 'icon-save',
				handler : function() {
					
				}
			} ]*/
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

</script>
</head>
<body>
	<div id="toolbar">
		<div style="margin-bottom: 5px">
			开始时间: <input class="easyui-datebox" style="width: 170px"> 
			结束时间: <input class="easyui-datebox" style="width: 170px"> 
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true">查询</a> 
			<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a> 
			<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true">导出</a>
		</div>
	</div>
	<table id="tt" class="easyui-datagrid" style="width: 600px; height: 250px" url="listJson" toolbar="#toolbar" title="Load Data" iconCls="icon-save" rownumbers="true" pagination="true">
		<thead>
			<tr>
				<th field="FIELD1" width="100">上周期投诉量</th>
				<th field="FIELD2" width="100">本周期投诉量</th>
				<th field="FIELD3" width="100">去年往期投诉量</th>
				<th field="FIELD4" width="100">去年同期投诉量</th>
				<th field="FIELD5" width="100" formatter="percentFormatter">同比</th>
				<th field="FIELD6" width="100" formatter="percentFormatter">环比</th>
			</tr>
		</thead>
	</table>
</body>
</html>