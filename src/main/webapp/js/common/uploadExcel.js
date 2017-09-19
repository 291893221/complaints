function uploadExcel() {
	// 得到上传文件的全路径
	var fileName = $('#uploadFilebox').filebox('getValue');
	// 进行基本校验
	if (fileName == "") {
		$.messager.alert('提示', '请选择上传文件！', 'info');
		return;
	}
	// 对文件格式进行校验
	var d1 = /\.[^\.]+$/.exec(fileName);
	if (d1 == ".xls" || d1 == ".xlsx") {
		// 提交表单
		// document.getElementById("uploadForm").submit();
		// 异步提交表单
		$('#uploadForm').form('submit', {
			url : "uploadExcel",
			success : function(data) {
				var json = $.parseJSON(data);
				$.messager.alert('提示', json.msg, 'info');
				$('#uploadWindow').window('close');
				$('#list').datagrid('reload');
			}
		});
	} else {
		$.messager.alert('提示', '请选择xls格式文件！', 'info');
		$('#uploadFilebox').filebox('setValue', '');
	}
}