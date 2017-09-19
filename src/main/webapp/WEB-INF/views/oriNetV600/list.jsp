<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>网投+V600投诉工单</title>
<%@include file="../common/head.jsp"%>
<script type="text/javascript">
	$(function() {
		//datagrid初始化 
		$('#list').datagrid({
			title : '网投+V600投诉工单',
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
			loadMsg : '正在加载，请稍候！',
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
			pageList : [ 10, 100, 1000, 10000 ],//可以设置每页记录条数的列表 
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
		var params = "search1="+search1+"&search2="+search2+"&search3="+search3;
		return params;
	}
	
</script>
</head>
<body>
	<div id="toolbar">
		<div style="margin-bottom: 5px">
			工单号: <input id="search1" class="easyui-textbox" />
			投诉号码: <input id="search2" class="easyui-textbox" />
			投诉时间: <input id="search3" class="easyui-datebox" data-options="formatter:myformatter,parser:myparser" editable="false" />
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
				<th field="field1" width="100">储备站点</th>
				<th field="field2" width="100">工程基站（故障）</th>
				<th field="field3" width="100">维护基站（故障）</th>
				<th field="field4" width="100">工程直放站（故障）</th>
				<th field="field5" width="100">维护直放站（故障）</th>
				<th field="field6" width="100">内部干扰</th>
				<th field="field7" width="100">外部干扰</th>
				<th field="field8" width="100">基站设备、参数调整</th>
				<th field="field9" width="100">直放站设备、参数调整</th>
				<th field="field10" width="100">基本正常</th>
				<th field="field11" width="100">工程原因（基站）</th>
				<th field="field12" width="100">工程原因（直放站）</th>
				<th field="field13" width="100">后期规划</th>
				<th field="field14" width="100">系统升级</th>
				<th field="field15" width="100">漫游</th>
				<th field="field16" width="100">核心侧故障</th>
				<th field="field17" width="100">其它</th>
				<th field="field18" width="100">工单类型</th>
				<th field="field19" width="100">投诉类型</th>
				<th field="field20" width="100">投诉原因</th>
				<th field="field21" width="100">工程或故障站名</th>
				<th field="field22" width="100">建议责任部门</th>
				<th field="field23" width="100">实施情况</th>
				<th field="field24" width="100">解决后回访情况</th>
				<th field="field25" width="100">最终解决情况</th>
				<th field="field26" width="100">最终回复客户时间</th>
				<th field="field27" width="100">工单号</th>
				<th field="field28" width="100">投诉号码</th>
				<th field="field29" width="100">客户级别</th>
				<th field="field30" width="100">内部投诉经办人</th>
				<th field="field31" width="100">手机品牌型号</th>
				<th field="field32" width="100" formatter="cellTooltipFormatter">投诉内容</th>
				<th field="field33" width="100">是否黑点库已有登记</th>
				<th field="field34" width="100">是否重复投诉</th>
				<th field="field35" width="100">投诉属性</th>
				<th field="field36" width="100">投诉时间</th>
				<th field="field37" width="100">回复受理部门/人</th>
				<th field="field38" width="100">一级关键字</th>
				<th field="field39" width="100">二级关键字</th>
				<th field="field40" width="100">详细地址</th>
				<th field="field41" width="100">所属区域</th>
				<th field="field42" width="100">投诉区域小区覆盖</th>
				<th field="field43" width="100" formatter="cellTooltipFormatter">受理的情况（回复内容）</th>
				<th field="field44" width="100">工单承诺解决时间</th>
				<th field="field45" width="100">遗留问题</th>
				<th field="field46" width="100">实际解决时间</th>
				<th field="field47" width="100">经度</th>
				<th field="field48" width="100">纬度</th>
				<th field="field49" width="100">是否已经回访</th>
				<th field="field50" width="100">工单处理时间</th>
			</tr>
		</thead>
	</table>
</body>
</html>