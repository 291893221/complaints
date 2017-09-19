function doSearch() {
	var params = getParams();
	$('#list').datagrid('load', {
		params : params
	});
}