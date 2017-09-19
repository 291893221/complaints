<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>热点预警分析维度</title>
<%@include file="../common/head.jsp"%>
<script type="text/javascript">
	$(function() {
		//datagrid初始化 
		$('#list').datagrid({
			title : '热点预警分析维度',
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
				<th field="FIELD18" width="100" sortable="true">工单类型</th>
				<th field="FIELD20" width="100" sortable="true">投诉原因</th>
				<th field="FIELD21" width="100" sortable="true">工程或故障站名</th>
				<th field="FIELD22" width="100" sortable="true">建议责任部门</th>
				<th field="FIELD23" width="100" sortable="true">实施情况</th>
				<th field="FIELD24" width="100" sortable="true">解决后回访情况</th>
				<th field="FIELD25" width="100" sortable="true">最终解决情况</th>
				<th field="FIELD26" width="100" sortable="true">最终回复客户时间</th>
				<th field="HUAWULIANG" width="100" sortable="true">话务量</th>
				<th field="LIULIANG" width="100" sortable="true">流量</th>
				<th field="ISNPS" width="100" sortable="true">NPS客户满意度</th>
				<th field="ISMARKET" width="100" sortable="true">是否市场投诉</th>
				<th field="NEWCOUNT" width="100" sortable="true">出现次数</th>
				<th field="OLDCOUNT" width="100" sortable="true">历史出现次数</th>
				<th field="FIELD27" width="100" sortable="true">工单号</th>
				<th field="FIELD28" width="100" sortable="true">投诉号码</th>
				<th field="FIELD29" width="100" sortable="true">客户级别</th>
				<th field="FIELD32" width="100" sortable="true">投诉内容</th>
				<th field="BLACKDOT" width="100" sortable="true">是否黑点库已有登记</th>
				<th field="FIELD34" width="100" sortable="true">是否重复投诉</th>
				<th field="FIELD35" width="100" sortable="true">投诉属性</th>
				<th field="FIELD36" width="100" sortable="true">投诉时间</th>
				<th field="FIELD38" width="100" sortable="true">一级关键字</th>
				<th field="FIELD39" width="100" sortable="true">二级关键字</th>
				<th field="FIELD40" width="100" sortable="true">详细地址</th>
				<th field="FIELD41" width="100" sortable="true">所属区域</th>
				<th field="FIELD42" width="100" sortable="true">投诉区域小区覆盖</th>
				<th field="CHANGJING" width="100" sortable="true">覆盖场景</th>
				<th field="FIELD43" width="100" sortable="true" formatter="cellTooltipFormatter">受理的情况（回复内容）</th>
				<th field="FIELD44" width="100" sortable="true">工单承诺解决时间</th>
				<th field="FIELD47" width="100" sortable="true">经度</th>
				<th field="FIELD48" width="100" sortable="true">纬度</th>
				<th field="FIELD45" width="100" sortable="true">遗留问题</th>
				<th field="FIELD50" width="100" sortable="true">工单处理时间</th>
			</tr>
		</thead>
	</table>
</body>
</html>