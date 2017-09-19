<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.highcharts.com/highcharts.js"></script>
<script type="text/javascript">
	var xset = [];//X轴数据集  
	var yset = [];//Y轴数据集  
	var url = "../chaXMonth/chartJson";
	//返回数据
	function getData() {
		$.getJSON(url, function(data) {
			$.each(data, function(i, item) {
				$.each(item, function(k, v) {
					xset.push(k);
					yset.push(v);
				});
			})
			console.log(xset);
			console.log(yset);
			//根据时间序列生成折线图  
			showChart(xset, yset);
		});
	}
	//定义图表
	function showChart(xset, yset) {
		var options = {
			chart : {
				renderTo : 'container',
				type : 'line'
			},
			title : {
				text : '投诉量线性图'
			},
			tooltip : {
				headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
				pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
				   '<td style="padding:0"><b>{point.y} 条</b></td></tr>',
				footerFormat: '</table>',
				shared: true,
				useHTML: true
			},
			yAxis : {
				title : {
					text : '投诉量(条)'
				},
				plotLines : [ {
					value : 0,
					width : 1,
					color : '#808080'
				} ]
			},
			xAxis : {
				categories : xset
			},
			series : [ {
				name : '投诉量分析',
				data : yset
			} ]
		};
		var chart = new Highcharts.Chart(options);
	}

	//执行  
	getData();
</script>
</head>
<div id="container" style="width: auto; height: auto; margin: 0 auto"></div>