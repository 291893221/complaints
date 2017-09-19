<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>234G小区基础信息表</title>
<%@include file="../common/head.jsp"%>
<script type="text/javascript">
	$(function() {
		//datagrid初始化 
		$('#list').datagrid({
			title : '234G小区基础信息表',
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
	
	function getParams() {
		//获取搜索条件
		var search1 = $("#search1").textbox("getValue");
		var search2 = $("#search2").textbox("getValue");
		var search3 = $("#search3").textbox("getValue");
		var search4 = $("#search4").textbox("getValue");
		var search5 = $("#search5").textbox("getValue");
		var search6 = $("#search6").textbox("getValue");
		search1 = encodeURI(search1);
		search2 = encodeURI(search2);
		search3 = encodeURI(search3);
		search4 = encodeURI(search4);
		search5 = encodeURI(search5);
		search6 = encodeURI(search6);
		var params = "search1="+search1+"&search2="+search2+"&search3="+search3
					+"&search4="+search4+"&search5="+search5+"&search6="+search6;
		return params;
	}
	
</script>
</head>
<body>
	<div id="toolbar">
		<div style="margin-bottom: 5px">
			城&nbsp;&nbsp;市: <input id="search1" class="easyui-textbox" />
			县&nbsp;&nbsp;区: <input id="search2" class="easyui-textbox" />
			乡&nbsp;&nbsp;镇: <input id="search3" class="easyui-textbox" />
			<br/>
			基站名: <input id="search4" class="easyui-textbox" />
			小区名: <input id="search5" class="easyui-textbox" />
			&nbsp;&nbsp;&nbsp;&nbsp;CI: <input id="search6" class="easyui-textbox" />
			<br/>
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="$('#uploadWindow').window('open')">导入</a> 
			<a href="#" class="easyui-linkbutton" iconCls="icon-remove" plain="true" onclick="deleteBatch()">删除</a> 
			<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true" onclick="$('#list').datagrid('reload');">刷新</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true" onclick="exportExcel()">导出</a>
		</div>
		<div id="uploadWindow" class="easyui-window" title="导入excel文件" closed="true" data-options="iconCls:'icon-save'" style="width:500px;height:200px;padding:5px;">
			<div style="margin-bottom: 5px">
				<form id="uploadForm" method="post" action="uploadFile" enctype="multipart/form-data">
					选择文件： 
					<input id="uploadFilebox" name="uploadFilebox" class="easyui-filebox" style="width: 200px" data-options="prompt:'请选择文件...',buttonText: '浏览'"> 
					<a href="#" class="easyui-linkbutton" iconCls="icon-save" onclick="uploadExcel()" plain="true">上传</a> 
				</form>
			</div>
		</div>
	</div>
	<table id="list" cellspacing="0" cellpadding="0" toolbar="#toolbar">
		<thead>
			<tr>
				<th width="100" field="field0" hidden="true">UUID</th>
				<th width="100" field="field1">网络制式</th>
				<th width="100" field="field2">城市</th>
				<th width="100" field="field3">县区</th>
				<th width="100" field="field4">乡镇</th>
				<th width="100" field="field5">基站名</th>
				<th width="100" field="field6">小区名</th>
				<th width="100" field="field7">CI</th>
				<th width="100" field="field8">BSC/RNC</th>
				<th width="100" field="field9">经度</th>
				<th width="100" field="field10">纬度</th>
				<th width="100" field="field11">方向角</th>
				<th width="100" field="field12">覆盖场景</th>
				<th width="100" field="field13">是否VIP小区</th>
			</tr>
		</thead>
	</table>
</body>
</html>