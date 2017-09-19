<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript">
function toChart(url) {
	var options = {
		//图表属性
		chart : {
			renderTo : 'container',
			type : 'line'  
		},
		//报表名称
		title : {
			text : '投诉总量'
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
			categories : ['上周','本周']
		},
		//数据
		series : [ ]
	};
	//后台url
	$.getJSON(url, function(data) {
		options.series = data;
		var chart = new Highcharts.Chart(options);
	});
}
</script>
</head>
<div id="p" class="easyui-panel" title="线性图" style="width:100%;height:600px;padding:0px;" data-options="iconCls:'icon-save',collapsible:true,minimizable:true,maximizable:true,closable:true">
	<div id="container" style="width: 600px; height: 300px; margin: 0 auto" loadMsg="正在查询..."></div>
</div>