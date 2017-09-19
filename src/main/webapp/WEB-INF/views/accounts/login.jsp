<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登录</title>

<!-- 引用easyui样式与js -->
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.4/themes/icon.css">
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.4/jquery.min.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>

</head>
<body>
	<div style="margin: 20px 0;"></div>
	<h3 align="center">用户投诉大数据建模工具</h3>
	<div align="center">
		<div class="easyui-panel" title="用户登录" style="width: 400px">
			<div style="padding: 10px 60px 20px 60px">
				<form id="loginForm" method="post" action="loginSubmit">
					<table cellpadding="5">
						<tr>
							<td>帐号:</td>
							<td><input class="easyui-textbox" type="text" name="account"
								data-options="required:true"></input></td>
						</tr>
						<tr>
							<td>密码:</td>
							<td><input class="easyui-textbox" type="password"
								name="password" data-options="required:true"></input></td>
						</tr>
						<tr>
							<td><input type="submit" value="登录" class="easyui-linkbutton"></td>
							<td><input type="reset" value="取消" class="easyui-linkbutton"></td>
						</tr>
					</table>
				</form>
				<div>${message}</div>
			</div>
		</div>
	</div>
</body>
</html>