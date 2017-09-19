<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>NPS客户满意度调查表</title>
<%@include file="../common/head.jsp"%>
<script type="text/javascript">
	$(function() {
		//datagrid初始化 
		$('#list').datagrid({
			title : 'NPS客户满意度调查表',
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
		var search3 = $("#search3").datebox("getValue");
		search1 = encodeURI(search1);
		search2 = encodeURI(search2);
		search3 = encodeURI(search3);
		var params = "search1="+search1+"&search2="+search2+"&search3="+search3;
		return params;
	}
	
</script>
</head>
<body>
	<div id="toolbar">
		<div style="margin-bottom: 5px">
			手机号码: <input id="search1" class="easyui-textbox" />
			用户投诉区域: <input id="search2" class="easyui-textbox" />
			登记时间: <input id="search3" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" editable="false" />
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
				<th width="100" field="field1">手机号码</th>
				<th width="100" field="field2">用户投诉区域</th>
				<th width="100" field="field3">市场提供的区域</th>
				<th width="100" field="field4">是否对应</th>
				<th width="100" field="field5">推荐意愿评分</th>
				<th width="100" field="field6">回访批次</th>
				<th width="100" field="field7">登记时间</th>
				<th width="100" field="field8">不推荐原因</th>
				<th width="100" field="field9">初步原因分类</th>
				<th width="100" field="field10">回访用户后的原因</th>
				<th width="100" field="field11">回访用户后的原因分类</th>
				<th width="100" field="field12">是否已恢复</th>
				<th width="100" field="field13">网络问题分类</th>
				<th width="100" field="field14">是否已有规划</th>
				<th width="100" field="field15">信号问题地址</th>
				<th width="100" field="field16">经度</th>
				<th width="100" field="field17">维度</th>
				<th width="100" field="field18">备注</th>
				<th width="100" field="field19">是否现场测试</th>
				<th width="100" field="field20">测试情况</th>
				<th width="100" field="field21">是否网优调整</th>
				<th width="100" field="field22">规划站点</th>
				<th width="100" field="field23">距离(KM)</th>
				<th width="100" field="field24">区域类型</th>
				<th width="100" field="field25">现网站点</th>
				<th width="100" field="field26">距离(KM)</th>
				<th width="100" field="field27">未规划原因</th>
				<th width="100" field="field28">是否现网黑点</th>
				<th width="100" field="field29">网优调整优化预计完成时间</th>
				<th width="100" field="field30">客户类型</th>
			</tr>
		</thead>
	</table>
</body>
</html>