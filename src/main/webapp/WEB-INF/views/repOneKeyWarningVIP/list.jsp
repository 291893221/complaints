<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>一键预警功能</title>
<%@include file="../common/head.jsp"%>
<%@include file="../common/net600Dialog.jsp"%>
<%@include file="../common/totalDialog.jsp"%>
<script type="text/javascript">
	$(function() {
		//datagrid初始化 
		$('#list').datagrid({
			title : '一键预警功能',
			iconCls : 'icon-edit',//图标 
			width : 'auto',
			height : 'auto',
			//nowrap : false,
			striped : true,
			border : true,
			collapsible : false,//是否可折叠的 
			fit : true,//自动大小 
			url : 'listJson',
			queryParams : {
				userType : 'VIP'
			},
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

	function doSearch() {
		//获取时间
		var start = $("#start").datebox("getValue");
		var end = $("#end").datebox("getValue");
		var userType = $("#userType").combobox("getValue");
		$('#list').datagrid('load', {
			start : start,
			end : end,
			userType: userType
		});
	}
	
	function rowFormatter (value, row, index){
		var field28 = row['FIELD28'];
		field28 = encodeURI(field28);
		return "<a href='#' onclick='openTab(" + field28 + ")' >" + value + "</a>";
	}
	
	function getParams() {
		var start = $("#start").datebox("getValue");
		var end = $("#end").datebox("getValue");
		var userType = $("#userType").combobox("getValue");
		var params = 'start=' + start + '&end=' + end + '&userType=' + userType;
		return params;
	}
	
	function getTotal() {
		var params = getParams();
		var url = "totalJson";
		// url = "totalJson?params=" + escape(params);
		openDialog(params, url);
	}
</script>
</head>
<body>
	<div id="toolbar">
		<div style="margin-bottom: 5px">
			(投诉时间筛选)
			开始时间: <input id="start" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" editable="false">
			结束时间: <input id="end" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" editable="false">
			客户群体：<select id="userType" name="userType" style="width:160px;" class="easyui-combobox">
			<option value="VIP">VIP</option>
			</select>
			<br/>
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true">导出</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-tip" plain="true" onclick="getTotal()">统计</a>
		</div>
	</div>
	<table id="list" cellspacing="0" cellpadding="0" toolbar="#toolbar">
		<thead>
			<tr>
				<th field="FIELD36" width="100">投诉时间</th>
				<th field="FIELD41" width="100">所属区域</th>
				<th field="FIELD18" width="100">工单类型</th>
				<th field="FIELD27" width="160">工单号</th>
				<!-- 
				<th field="FIELD28" width="100" formatter="rowFormatter">投诉号码</th>
				 -->
				<th field="FIELD28" width="100">投诉号码</th>
				<th field="ISMANY" width="100">是否多次投诉</th>
				<th field="PHONECOUNT" width="100" formatter="rowFormatter">投诉次数</th>
				<th field="CONVIP" width="100">是否VIP客户</th>
				<th field="FIELD29" width="100">客户级别</th>
				<th field="FIELD32" width="100">投诉内容</th>
				<th field="FIELD38" width="100">一级关键字</th>
				<th field="FIELD39" width="100">二级关键字</th>
				<th field="FIELD40" width="100">详细地址</th>
				<th field="FIELD42" width="100">投诉区域小区覆盖</th>
				<th field="FIELD51" width="100">导入时间</th>
			</tr>
		</thead>
	</table>
</body>
</html>