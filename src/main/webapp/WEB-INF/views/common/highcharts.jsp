<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function toChart(url) {
		$('#chartDialog').dialog('open').dialog('setTitle','图表');
		var options = {
			//图表属性
			chart : {
				renderTo : 'container', //DIV容器ID
				type : 'column'//设置图表样式，可以为line,spline, scatter, splinearea bar,pie,area,column  
			},
			//报表名称
			title : {
				text : '一键图表'
			},
			//补充说明
			subtitle : {
				text : '图表展示'
			},
			//鼠标提示框
			tooltip : {
				headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
				pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
				   '<td style="padding:0"><b>{point.y:.1f} 条</b></td></tr>',
				footerFormat: '</table>',
				shared: true,
				useHTML: true
			},
			//y轴显示内容
			yAxis : {
				min : 0,
				title : {
					text : '单位(条)'
				}
			},
			//x轴显示内容
			xAxis : {
				categories : ['江门','新会','开平','台山','鹤山','恩平']
			},
			//数据        { name: '去年往期', data: [90.9, 91.9, 99.1, 91.3, 99.1, 90.1] }, { name: '去年同期', data: [83.6, 78.8, 98.5, 93.4, 106.0, 84.5] }, { name: '上周期', data: [99.1, 90.1, 91.3, 97.1, 91.1, 93.1] }, { name: '本周期', data: [90.1, 93.7, 97.3, 90.7, 91.3, 91.7] }
			series : []
		};
		//后台url
		$.getJSON(url, function(data) {
			options.series = data;
			var chart = new Highcharts.Chart(options);
		});
	}
</script>
</head>
<body>
	<div id="chartDialog" class="easyui-dialog" style="width:900px;height:400px;" closed="true" resizable="true">
		<div id="container" style="width: 700px; height: 300px; margin: 0 auto"></div>
	</div>
</body>