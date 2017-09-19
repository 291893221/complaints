<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
				renderTo : 'container',
				type : 'column'  
			},
			//报表名称
			title : {
				text : '各地市投诉量分布详情'
			},
			//鼠标提示框
			tooltip : {
				headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
				pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
				   '<td style="padding:0"><b>{point.y} 条</b></td></tr>',
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
			//数据
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