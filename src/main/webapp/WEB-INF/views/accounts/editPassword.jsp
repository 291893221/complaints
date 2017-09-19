<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>修改密码</title>

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

	function submitForm() {
		$('#editPasswordForm').form('submit', {
			success : function(data) {
				var data = eval('(' + data + ')');
				if (data.success) {
					alert(data.message);
				} else {
					alert(data.message);
					clearForm();
				}
			}
		});
	}
	function clearForm() {
		$('#editPasswordForm').form('clear');
	}
	
	//必须和某个字段相等
	$.extend($.fn.validatebox.defaults.rules, {
		equalTo : {
			validator : function(value, param) {
				return $(param[0]).val() == value;
			},
			message : '字段不匹配'
		}
	});
</script>
</head>
<body>
	<div align="center">
		<div class="easyui-panel" title="修改密码" style="width: 400px">
			<div style="padding: 10px 60px 20px 60px">
				<form id="editPasswordForm" method="post"
					action="editPasswordSubmit">
					<table cellpadding="5">
						<tr>
							<td>帐号:</td>
							<td><input class="easyui-textbox" type="text" name="account"
								value="${account.account}" readonly="readonly"></input></td>
						</tr>
						<tr>
							<td>密码:</td>
							<td><input id="password" name="password"
								validType="length[3,32]" class="easyui-textbox" required="true"
								type="password" value="" /></td>
						</tr>
						<tr>
							<td>确认密码:</td>
							<td><input type="password" name="repassword" id="repassword"
								required="true" class="easyui-textbox"
								validType="equalTo['#password']" invalidMessage="两次输入密码不匹配" /></td>
						</tr>
					</table>
				</form>
				<div style="text-align: center; padding: 5px">
					<a href="javascript:void(0)" class="easyui-linkbutton"
						onclick="submitForm()">确定</a>
					<!-- 取消 -->
					<a href="javascript:void(0)" class="easyui-linkbutton"
						onclick="clearForm()">取消</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>