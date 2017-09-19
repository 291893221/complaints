<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>V600市场投诉类投诉工单</title>
<%@include file="../common/head.jsp"%>
<script type="text/javascript">
	$(function() {
		//datagrid初始化 
		$('#list').datagrid({
			title : 'V600市场投诉类投诉工单',
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
		var search5 = $("#search5").datebox("getValue");
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
			投诉类型: <input id="search1" class="easyui-textbox" />
			&nbsp;&nbsp;流水号: <input id="search2" class="easyui-textbox" />
			受理号码: <input id="search3" class="easyui-textbox" />
			<br/>
			问题分类: <input id="search4" class="easyui-textbox" />
			受理时间: <input id="search5" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" editable="false" />
			受理工号: <input id="search6" class="easyui-textbox" />
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
				<th width="100" field="field1">投诉类型</th>
				<th width="100" field="field2">流水号</th>
				<th width="100" field="field3">受理号码</th>
				<th width="100" field="field4">服务请求类别</th>
				<th width="100" field="field5">问题分类</th>
				<th width="100" field="field6">问题细项</th>
				<th width="100" field="field7">投诉内容</th>
				<th width="100" field="field8">客户回复内容</th>
				<th width="100" field="field9">是否下发调查短信</th>
				<th width="100" field="field10">受理时间</th>
				<th width="100" field="field11">客户归属地</th>
				<th width="100" field="field12">客户品牌</th>
				<th width="100" field="field13">客户级别</th>
				<th width="100" field="field14">受理工号</th>
				<th width="100" field="field15">受理部门</th>
				<th width="100" field="field16">业务地市</th>
				<th width="100" field="field17">投诉途径</th>
				<th width="100" field="field18">受理方式</th>
				<th width="100" field="field19">紧急程度</th>
				<th width="100" field="field20">受理短信</th>
				<th width="100" field="field21">信用度星级数</th>
				<th width="100" field="field22">升级预警</th>
				<th width="100" field="field23">客户分类</th>
				<th width="100" field="field24">语种</th>
				<th width="100" field="field25">营销方案名称</th>
				<th width="100" field="field26">请求编号</th>
				<th width="100" field="field27">录音流水</th>
				<th width="100" field="field28">录音时间</th>
				<th width="100" field="field29">反馈时间</th>
				<th width="100" field="field30">是否敏感客户</th>
				<th width="100" field="field31">主叫号码</th>
				<th width="100" field="field32">联系人姓名</th>
				<th width="100" field="field33">联系电话</th>
				<th width="100" field="field34">联系方式</th>
				<th width="100" field="field35">联系地址</th>
				<th width="100" field="field36">责任部门</th>
				<th width="100" field="field37">责任原因</th>
				<th width="100" field="field38">派单质量评价</th>
				<th width="100" field="field39">评价备注</th>
				<th width="100" field="field40">终端品牌型号</th>
				<th width="100" field="field41">批量故障名称</th>
			</tr>
		</thead>
	</table>
</body>
</html>