function deleteBatch() {
	var rows = $('#list').datagrid('getSelections');
	var field0Array = [];
	var message = "确定删除选中行?";
	if (rows == null || rows.length == 0) {
		//message = "未选中数据，将默认删除所有数据，确定清空该表？";
		$.messager.alert("提示", "请选择要删除的行！");
		return;
	} else{		
		for (var i = 0; i < rows.length; i++) {
			var row = rows[i];
			field0Array.push(row.field0);
		}
		message = "确定删除所选中的"+field0Array.length+"行数据?";
	}
	$('#list').datagrid('clearSelections'); 
	$.messager.confirm('提示', message, function(r) {
		if (r) {
			$.ajax({
				type : 'post',
				url : "deleteBatch",
				dataType : "json",
				data : {
					field0s : field0Array.join(",")
				},
				success : function(data) {
					if (data.success == true) {
						$('#list').datagrid('reload');
					} else {
						alert(data.msg);
					}
				}
			});
		}
	});
}