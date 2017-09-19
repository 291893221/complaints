<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>投诉工单详单分析</title>
<%@include file="../common/head.jsp"%>
<script type="text/javascript">
	$(function() {
		//datagrid初始化 
		$('#list').datagrid({
			title : '投诉工单详单分析',
			iconCls : 'icon-edit',//图标 
			width : 'auto',
			height : 'auto',
			//nowrap : false,
			striped : true,
			border : true,
			collapsible : false,//是否可折叠的 
			fit : true,//自动大小 
			url : 'listJson',
			loadMsg : '正在加载，请稍候！',
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
		//获取搜索条件
		var start = $("#start").datebox("getValue");
		var end = $("#end").datebox("getValue");
		var field28 = $("#field28").textbox("getValue");
		var field42 = $("#field42").textbox("getValue");
		var field39 = $("#field39").textbox("getValue");
		var field40 = $("#field40").textbox("getValue");
		var params = "start="+start 
		+"&end="+end
		+"&field28="+field28
		+"&field42="+field42
		+"&field39="+field39
		+"&field40="+field40;
		return params;
	}
	
</script>
</head>
<body>
	<div id="toolbar">
		<div style="margin-bottom: 5px">
			<table width="600px">
				<tr>
					<td align="right">（投诉时间筛选）开始时间: <input id="start" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" editable="false"></td>
					<td align="right">结束时间: <input id="end" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" editable="false"></td>
				</tr>
				<tr>
					<td align="right">投诉区域小区覆盖： <input id="field42" class="easyui-textbox" /></td>
					<td align="right">投诉号码： <input id="field28" class="easyui-textbox" /></td>
				</tr>
				<tr>
					<td align="right">二级关键字： <input id="field39" class="easyui-textbox" /></td>
					<td align="right">详细地址： <input id="field40" class="easyui-textbox" /></td>
				</tr>
			</table>
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true">导出</a>
		</div>
	</div>
	<table id="list" cellspacing="0" cellpadding="0" toolbar="#toolbar">
		<thead>
			<tr>
				<th field="field18" width="100">工单类型</th>
				<th field="field20" width="100">投诉原因</th>
				<th field="field21" width="100">工程或故障站名</th>
				<th field="field22" width="100">建议责任部门</th>
				<th field="field23" width="100">实施情况</th>
				<th field="field24" width="100">解决后回访情况</th>
				<th field="field25" width="100">最终解决情况</th>
				<th field="field27" width="150">工单号</th>
				<th field="field28" width="100">投诉号码</th>
				<th field="field29" width="100">客户级别</th>
				<th field="field32" width="300">投诉内容</th>
				<th field="field33" width="100">是否黑点库已有登记</th>
				<th field="field34" width="100">是否重复投诉</th>
				<th field="field35" width="100">投诉属性</th>
				<th field="field36" width="100">投诉时间</th>
				<th field="field38" width="100">一级关键字</th>
				<th field="field39" width="100">二级关键字</th>
				<th field="field40" width="100">详细地址</th>
				<th field="field41" width="100">所属区域</th>
				<th field="field42" width="100">投诉区域小区覆盖</th>
				<th field="field43" width="100" formatter="cellTooltipFormatter">受理的情况（回复内容）</th>
				<th field="field44" width="100">工单承诺解决时间</th>
				<th field="field47" width="100">经度</th>
				<th field="field48" width="100">纬度</th>
				<th field="field50" width="100">工单处理时间</th>
			</tr>
		</thead>
	</table>
</body>
</html>