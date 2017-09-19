<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>一键月报功能</title>
<%@include file="../common/head.jsp"%>
<%@include file="../common/xCityColumn.jsp"%>
<%@include file="../common/detailDialog.jsp"%>
<script type="text/javascript">
	$(function() {
		//datagrid初始化 
		$('#list').datagrid({
			title : '一键月报功能',
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
		paramsArr = [];
		paramsArr.length=0
		//获取时间
		var selectIdY=document.getElementById("selectIdY");
		var selectIdM=document.getElementById("selectIdM");
		
		var y = selectIdY.options[selectIdY.selectedIndex].text;
		var m = selectIdM.options[selectIdM.selectedIndex].text;
		
		var params = 'y=' + y + '&m=' + m;
		
		return params;
	}
	
	function doSearch() {
		var params = getParams();
		$('#list').datagrid('load', {
			params : params
		});
	}
	
	window.onload = function(){
		var currentYear = new Date().getFullYear();
		var currentMonth = new Date().getMonth();
		
		var selectIdY=document.getElementById("selectIdY");
		selectIdY.options.length=0;
		for (var i = 0; i <= 3; i++) {
			var theOption = document.createElement("option");
			theOption.innerHTML = currentYear-i ;
			theOption.value = currentYear-i;
			selectIdY.appendChild(theOption);
		}
		
		var selectIdM=document.getElementById("selectIdM");
		selectIdM.options.length=0;
		for (var i = 1; i <= 12; i++) {
			var theOption = document.createElement("option");
			theOption.innerHTML = i ;
			theOption.value = i;
			if (currentMonth == i) {
				theOption.selected = 'selected';
			}
			selectIdM.appendChild(theOption);
		}
	}

	function getChart() {
		var url = "chartJson";
		var params = getParams();
		url = url + "?params=" + escape(params);
		toChart(url);
	}
	
	var paramsArr = [];
	function rowFormatter (value, row, index){
		debugger;
		var startDate = row['FIELD8'];
		var endDate = row['FIELD9'];
		var field41 = row['FIELD7'];
		if(field41 == '总计'){			
			return value;
		}
		field41 = encodeURI(field41);
		var params = "startDate="+startDate+"&endDate="+endDate+"&field41="+field41+"&view=repOneKeyMonth";
		paramsArr.push(params);
		var url = '"../repOneKeyMonthCause/listJson"';
		return "<a href='#' onclick='openTab("+index+","+url+")' >" + value + "</a>";
	}
	
	//重写 doSearch() 方法
	function doSearch() {
		paramsArr = [];
		paramsArr.length=0;
		
		var params = getParams();
		$('#list').datagrid('load', {
			params : params
		});
	}
	
</script>
</head>
<body>
	<div id="toolbar">
		<div style="margin-bottom: 5px">
			<select id="selectIdY" name="selectIdY" style="width:100px;" class="easyui-linkbutton">
			</select>
			年
			<select id="selectIdM" name="selectIdM" style="width:100px;" class="easyui-linkbutton">
			</select>
			月
			<a href="#" class="easyui-linkbutton" iconCls="icon-search" plain="true" onclick="doSearch()">查询</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-reload" plain="true">刷新</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-save" plain="true">导出</a>
			<a href="#" class="easyui-linkbutton" iconCls="icon-tip" plain="true" onclick="getChart()">图表</a>
		</div>
	</div>
	<table id="list" cellspacing="0" cellpadding="0" toolbar="#toolbar">
		<thead>
			<tr>
				<th field="FIELD8" width="100">开始时间</th>
				<th field="FIELD9" width="100">结束时间</th>
				<th field="FIELD7" width="100">区域</th>
				<th field="FIELD1" width="100">上周期投诉量</th>
				<th field="FIELD2" width="100" formatter="rowFormatter">本周期投诉量</th>
				<th field="FIELD3" width="100">去年往期投诉量</th>
				<th field="FIELD4" width="100">去年同期投诉量</th>
				<th field="FIELD5" width="100" formatter="percentFormatter">同比</th>
				<th field="FIELD6" width="100" formatter="percentFormatter">环比</th>
			</tr>
		</thead>
	</table>
</body>
</html>