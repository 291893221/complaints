function exportExcel() {
	// var test = escape(params);
	// var test = encodeURI(params);
	// alert(test);
	var params = getParams();
	var url = "exportExcel?params=" + escape(params);
	window.open(url);
}