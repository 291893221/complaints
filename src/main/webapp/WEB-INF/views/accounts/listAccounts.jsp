<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>帐号列表</title>

<!-- 引用easyui样式与js -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.4/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.4/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>

<script type="text/javascript">
	$(function() {
		//datagrid初始化 
		$('#accountsList').datagrid({
			title : '帐号管理列表',
			iconCls : 'icon-edit',//图标 
			width : 700,
			height : 'auto',
			nowrap : false,
			striped : true,
			border : true,
			collapsible : false,//是否可折叠的 
			fit : true,//自动大小 
			url : 'listAccountsJson',
			sortName : 'account',
			sortOrder : 'desc',
			remoteSort : false,
			idField : 'field0',
			singleSelect : false,//是否单选 
			pagination : true,//分页控件 
			rownumbers : true,//行号 
			frozenColumns : [ [ {
				field : 'ck',
				checkbox : true
			} ] ],
			toolbar : [ {
				text : '添加',
				iconCls : 'icon-add',
				handler : function() {
					openDialog("add_dialog", "add");
				}
			}, '-', {
				text : '修改',
				iconCls : 'icon-edit',
				handler : function() {
					openDialog("add_dialog", "edit");
				}
			}, '-', {
				text : '删除',
				iconCls : 'icon-remove',
				handler : function() {
					delAppInfo();
				}
			} ],
		});
		//设置分页控件 
		var p = $('#accountsList').datagrid('getPager');
		$(p).pagination({
			pageSize : 10,//每页显示的记录条数，默认为10 
			pageList : [ 5, 10, 15, 20, 50, 100 ],//可以设置每页记录条数的列表 
			beforePageText : '第',//页数文本框前显示的汉字 
			afterPageText : '页    共 {pages} 页',
			displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录',
		/*onBeforeRefresh:function(){
		    $(this).pagination('loading');
		    alert('before refresh');
		    $(this).pagination('loaded');
		}*/
		});
	})
</script>
</head>
<body>
	<table id="accountsList" cellspacing="0" cellpadding="0">
		<thead>
			<tr>
				<th field="account" width="100">帐号</th>
				<th field="password" width="100">密码</th>
			</tr>
		</thead>
	</table>
</body>
</html>