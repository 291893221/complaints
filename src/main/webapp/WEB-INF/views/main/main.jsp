<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>主页</title>
<!-- 引用easyui样式与js -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.4/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/js/jquery-easyui-1.4.4/themes/icon.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.4/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-easyui-1.4.4/jquery.easyui.min.js"></script>

<script type="text/javascript">
	$(function() {
		//动态菜单数据
		var treeData = [ {
			text : "功能菜单",
			children : [ {
				text : "原始数据",
				//state : "closed",
				children : [ {
					text : "网投+V600投诉工单",
					attributes : {
						url : "../oriNetV600/list"
					}
				}, {
					text : "黑点库ID信息表",
					attributes : {
						url : "../oriBlackDotLibrary/list"
					}
				}, {
					text : "234G小区基础信息表",
					attributes : {
						url : "../ori234GCell/list"
					}
				}, {
					text : "V600市场类投诉工单",
					attributes : {
						url : "../oriV600Market/list"
					}
				}, {
					text : "NPS客户满意度调查表",
					attributes : {
						url : "../oriNPSCustomer/list"
					}
				}, {
					text : "234G流量&话务量统计表",
					attributes : {
						url : "../ori234GTraffic/list"
					}
				}, {
					text : "用户属性信息表",
					attributes : {
						url : "../oriCustomer/list"
					}
				} ]
			}, {
				text : "大数据统计分析",
				children : [ {
					text : "投诉工单详单分析",
					attributes : {
						url : "../repComplaintOrders/list"
					}
				}, {
					text : "用户投诉原因分析",
					children : [ {
						text : "投诉总量分析",
						attributes : {
							url : "../repNetV600Count/list"
						}
					}, {
						text : "所属区域分析",
						attributes : {
							url : "../repNetV600Area/list"
						}
					}, {
						text : "投诉原因分析",
						attributes : {
							url : "../repComplaintCause/list"
						}
					}, {
						text : "投诉原因分析（大类）",
						attributes : {
							url : "../repComplaintCauseLC/list"
						}
					}, {
						text : "弱覆盖类投诉详情",
						attributes : {
							url : "../repWeakCoverage/list"
						}
					}, {
						text : "弱覆盖类投诉分布详情",
						attributes : {
							url : "../repWeakCoverageCity/list"
						}
					} ]
				}, {
					text : "预警模块",
					children : [ {
						text : "重复投诉分析维度",
						attributes : {
							url : "../repWarningCell/list"
						}
					}, {
						text : "多次投诉分析维度",
						attributes : {
							url : "../repWarningPhone/list"
						}
					}, {
						text : "黑点库预警分析维度",
						attributes : {
							url : "../repWarningBlackDot/list"
						}
					}, {
						text : "热点预警分析维度",
						attributes : {
							url : "../repWarningHotPoint/list"
						}
					} ]
				}, {
					text : "LTE投诉分析",
					children : [ {
						text : "LTE类投诉所属区域分析",
						attributes : {
							url : "../repNetV600LTE/list"
						}
					}, {
						text : "LTE类投诉投诉原因分析",
						attributes : {
							url : "../repLTECause/list"
						}
					} ]
				}, {
					text : "一键统计分析",
					children : [ {
						text : "一键预警功能",
						attributes : {
							url : "../repOneKeyWarning/list"
						}
					}, {
						text : "一键预警功能（VIP客户）",
						attributes : {
							url : "../repOneKeyWarningVIP/list"
						}
					}, {
						text : "一键预警功能（NPS客户）",
						attributes : {
							url : "../repOneKeyWarningNPS/list"
						}
					}, {
						text : "一周投诉原因分析",
						attributes : {
							url : "../repOneKeyCause/list"
						}
					}, {
						text : "一键周报功能",
						attributes : {
							url : "../repOneKeyWeek/list"
						}
					}, {
						text : "一月投诉原因分析",
						attributes : {
							url : "../repOneKeyMonthCause/list"
						}
					}, {
						text : "一键月报功能",
						attributes : {
							url : "../repOneKeyMonth/list"
						}
					} ]
				} ]
			}, {
				text : "系统管理",
				//state : "closed",
				children : [ {
					text : "帐号管理",
					attributes : {
						url : "listAccounts"
					}
				}, {
					text : "权限管理",
					attributes : {
						url : ""
					}
				}, {
					text : "修改密码",
					attributes : {
						url : "editPassword"
					}
				} ]
			} ]
		} ];

		//实例化树形菜单
		$("#tree").tree({
			data : treeData,
			lines : true,
			onClick : function(node) {
				if (node.attributes) {
					openTab(node.text, node.attributes.url);
				}
			}
		});
		
		//绑定tabs的右键菜单
		$("#tabs").tabs({
			onContextMenu : function(e, title) {
				e.preventDefault();
				$('#tabsMenu').menu('show', {
					left : e.pageX,
					top : e.pageY
				}).data("tabTitle", title);
			}
		});

		//实例化menu的onClick事件
		$("#tabsMenu").menu({
			onClick : function(item) {
				closeTab(this, item.name);
			}
		});
	});
	
	//在右边center区域打开菜单，新增tab
	function openTab(text, url) {
		if ($("#tabs").tabs('exists', text)) {
			$('#tabs').tabs('select', text);
		} else {
			$('#tabs').tabs('add',
							{
								title : text,
								closable : true,
								content : '<iframe scrolling="auto" frameborder="0"  src="'
										+ url
										+ '" style="width:100%;height:100%;"></iframe>'
							});
		}
	}

	//几个关闭事件的实现
	function closeTab(menu, type) {
		var curTabTitle = $(menu).data("tabTitle");
		var tabs = $("#tabs");

		if (type === "close") {
			tabs.tabs("close", curTabTitle);
			return;
		}

		var allTabs = tabs.tabs("tabs");
		var closeTabsTitle = [];

		$.each(allTabs, function() {
			var opt = $(this).panel("options");
			if (opt.closable && opt.title != curTabTitle && type === "Other") {
				closeTabsTitle.push(opt.title);
			} else if (opt.closable && type === "All") {
				closeTabsTitle.push(opt.title);
			}
		});

		for (var i = 0; i < closeTabsTitle.length; i++) {
			tabs.tabs("close", closeTabsTitle[i]);
		}
	}
</script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north'" style="height: 100px" title="用户投诉大数据建模工具">
		<h3 align="center">用户投诉大数据建模工具</h3>
		<div>当前帐号：${account.account},&nbsp;<a href="logout" class="easyui-linkbutton"  plain="true">退出</a></div>
	</div>
	<div data-options="region:'west',split:true" title="功能菜单"
		style="width: 300px;">
		<ul id="tree"></ul>
	</div>
	<div id='content'
		data-options="region:'center',title:'用户投诉大数据建模工具',iconCls:'icon-ok'">
		<div class="easyui-tabs" fit="true" border="false" id="tabs">
			<div title="首页">
				<%@include file="../common/xMonthLine.jsp"%>
			</div>
		</div>
	</div>
	<div id="tabsMenu" class="easyui-menu" style="width: 120px;">
		<div name="close">关闭</div>
		<div name="Other">关闭其他</div>
		<div name="All">关闭所有</div>
	</div>
</body>
</html>