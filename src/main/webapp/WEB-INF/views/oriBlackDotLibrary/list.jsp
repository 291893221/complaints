<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>黑点库ID信息表</title>
<%@include file="../common/head.jsp"%>
<script type="text/javascript">
	$(function() {
		//datagrid初始化 
		$('#list').datagrid({
			title : '黑点库ID信息表',
			iconCls : 'icon-edit',//图标 
			width : 700,
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
			//showPageList:true,
			pageSize : 10,//每页显示的记录条数，默认为10 
			pageList : [ 10, 20, 50, 100 ],//可以设置每页记录条数的列表 
			beforePageText : '第',//页数文本框前显示的汉字 
			afterPageText : '页    共 {pages} 页',
			displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录',
			onBeforeRefresh : function() {
				$(this).pagination('loading');
				alert('before refresh');
				$(this).pagination('loaded');
			}
		});
	})
	
	function getParams() {
		//获取搜索条件
		var search1 = $("#search1").textbox("getValue");
		var search2 = $("#search2").textbox("getValue");
		var search3 = $("#search3").datebox("getValue");
		var params = "search1="+search1+"&search2="+search2+"&search3="+search3;
		return params;
	}
</script>
</head>
<body>
	<div id="toolbar">
		<div style="margin-bottom: 5px">
			投诉点ID: <input id="search1" class="easyui-textbox" />
			网络类型: <input id="search2" class="easyui-textbox" />
			开始时间: <input id="search3" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" editable="false" />
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
				<th data-options="field:'field1',align:'left',width:100">网络类型</th>
				<th field="field2" width="100">投诉点ID</th>
				<th field="field3" width="100">投诉点名称</th>
				<th field="field4" width="100">投诉点类型</th>
				<th field="field5" width="100">开始时间</th>
				<th field="field6" width="100">审核状态</th>
				<th field="field7" width="300">故障原因</th>
				<th field="field8" width="300">影响范围</th>
				<th field="field9" width="100">地市名</th>
				<th field="field10" width="100">域</th>
				<th field="field11" width="100">地址</th>
				<th field="field12" width="100">投诉量</th>
				<th field="field13" width="100">投诉类型</th>
				<th field="field14" width="100">联系电话</th>
				<th field="field15" width="100">经度</th>
				<th field="field16" width="100">纬度</th>
				<th field="field17" width="100">解决办法</th>
				<th field="field18" width="1000">详细处理情况</th>
				<th field="field19" width="100">当前状态</th>
				<th field="field20" width="100">投诉点所属ID</th>
				<th field="field21" width="100">站点名称</th>
				<th field="field22" width="100">站点类型</th>
				<th field="field23" width="100">预期解决时间</th>
				<th field="field24" width="100">能否解决</th>
				<th field="field25" width="100">问题来源</th>
				<th field="field26" width="100">更新时间</th>
				<th field="field27" width="100">工程站点ID</th>
				<th field="field28" width="100">拟建站点名称</th>
				<th field="field29" width="100">实际站点名称</th>
				<th field="field30" width="100">站点经度</th>
				<th field="field31" width="100">站点纬度</th>
				<th field="field32" width="100">规划年份</th>
				<th field="field33" width="100">工程进度</th>
				<th field="field34" width="100">计划完成时间</th>
				<th field="field35" width="100">实际完成时间</th>
				<th field="field36" width="100">站点覆盖范围</th>
				<th field="field37" width="100">站点说明</th>
				<th field="field38" width="100">解决时间</th>
			</tr>
		</thead>
	</table>
</body>
</html>