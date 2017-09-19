<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>统计占比</title>
<script type="text/javascript">
	function openDialog(params, url) {
		$('#totalDialog').dialog('open').dialog('setTitle', '钻取');

		$('#totalList').datagrid({
			title : '统计占比',
			iconCls : 'icon-edit',//图标 
			width : 'auto',
			height : 'auto',
			//nowrap : false,
			striped : true,
			border : true,
			collapsible : false,//是否可折叠的 
			fit : true,//自动大小
			url : url,
			queryParams : {
				params : params
			},
			//sortName : 'account',
			//sortOrder : 'desc',
			remoteSort : false,
			idField : 'DUOCI',
			singleSelect : false,//是否单选 
			pagination : true,//分页控件 
			rownumbers : true,//行号 
			frozenColumns : [ [ {
				field : 'ck',
				checkbox : true
			} ] ],
			onLoadSuccess : function(data) {
				//初始化
				var duoci = 0;
				var other = 0;
				//取值
				duoci = data.rows[0].DUOCI;
				var total = data.rows[0].TOTAL;
				other = total - duoci;
				//定义属性
				var options = {
					chart : {
						plotBackgroundColor : null,
						plotBorderWidth : null,
						plotShadow : false
					},
					title : {
						text : '统计占比'
					},
					tooltip : {
						pointFormat : '{series.name}: <b>{point.percentage:.1f}%</b>'
					},
					plotOptions : {
						pie : {
							allowPointSelect : true,
							cursor : 'pointer',
							dataLabels : {
								enabled : true,
								color : '#000000',
								connectorColor : '#000000',
								format : '<b>{point.name}</b>: {point.percentage:.1f} %'
							}
						}
					},
					series : [ {
						type : 'pie',
						name : '占比',
						data : [ {
							name : '多次投诉',
							y : duoci,
							sliced : true,
							selected : true
						}, {
							name : '其他',
							y : other
						} ]
					} ]
				};
				//绘制饼图装载到容器
				$('#container').highcharts(options);
			}
		});

		//设置分页控件 
		var pager = $('#totalList').datagrid('getPager');
		$(pager).pagination({
			pageSize : 10,//每页显示的记录条数，默认为10 
			pageList : [ 10, 100, 1000 ],//可以设置每页记录条数的列表 
			beforePageText : '第',//页数文本框前显示的汉字 
			afterPageText : '页    共 {pages} 页',
			displayMsg : '当前显示 {from} - {to} 条记录   共 {total} 条记录'
		});

	}
</script>
</head>
<body>
	<div id="totalDialog" class="easyui-dialog" style="width: 915px; height: 490px;" closed="true" resizable="true">
		<div style="width: 900px; height: 115px;">
			<table id="totalList" cellspacing="0" cellpadding="0">
				<thead>
					<tr>
						<th field="STARTDATE1" width="100" sortable="true">开始时间</th>
						<th field="ENDDATE1" width="100" sortable="true">结束时间</th>
						<th field="DUOCI" width="100" sortable="true">多次投诉次数</th>
						<th field="TOTAL" width="100" sortable="true">总投诉次数</th>
						<th field="ZHANBI" width="100" sortable="true" formatter="percentFormatter">占比</th>
					</tr>
				</thead>
			</table>
		</div>
		<div id="p" class="easyui-panel" title="饼图" style="width: 900px; height: 330px; padding: 0px;">
			<div id="container" style="width: 600px; height: 300px; margin: 0 auto" loadMsg="正在查询..."></div>
		</div>
	</div>
</body>
</html>