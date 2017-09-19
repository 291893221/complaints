package com.huaxing.complaints.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huaxing.complaints.model.RepOneKey;
import com.huaxing.complaints.service.OriNetV600Service;
import com.huaxing.complaints.util.DateUtil;
import com.huaxing.complaints.util.ExportExcelUtil;
import com.huaxing.complaints.util.ParamUtil;
import com.huaxing.complaints.util.StringUtil;

@Controller
@RequestMapping("/repOneKeyWeek")
public class RepOneKeyWeekController {
	@Autowired
	private OriNetV600Service service;
	/**
	 * http://localhost/complaints/repOneKeyWeek/list
	 */
	@RequestMapping("/list")
	public String list() {
		return "repOneKeyWeek/list";
	}

	@RequestMapping("/listJson")
	@ResponseBody
	public String listJson(String params) throws Exception {
		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		DateUtil.getOneKeyWeek(paramMap);
		List<Map<String, Object>> list = service.selectOneKeyMonth(paramMap);
		return StringUtil.getJsonStringFromList(list, 6);
	}

	/** 
	 * http://localhost/complaints/repOneKeyWeek/chartJson
	 */ 
	@RequestMapping("/chartJson")
	@ResponseBody
	public String chartJson(String params) throws Exception {
		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		DateUtil.getOneKeyWeek(paramMap);
		List<Map<String, Object>> list = service.selectChartList(paramMap);
		return StringUtil.getJsonString(list);

	}
	
	@RequestMapping("/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String params) throws Exception {
		String codedFileName = java.net.URLEncoder.encode("一键周报导出", "UTF-8");
		response.setHeader("content-disposition", "attachment;filename=" + codedFileName + ".xls");

		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		DateUtil.getOneKeyWeek(paramMap);
		List<Map<String, Object>> mlist = service.selectOneKeyMonth(paramMap);
		List<RepOneKey> list = new ArrayList<RepOneKey>();
		for (Map<String, Object> map : mlist) {
			RepOneKey object = new RepOneKey();
			BeanUtils.populate(object, map);
			list.add(object);
		}

		ServletOutputStream outputStream = response.getOutputStream();
		ExportExcelUtil<RepOneKey> util = new ExportExcelUtil<RepOneKey>();
		String[] headers = { "区域", "上周期投诉量", "本周期投诉量", "去年往期投诉量", "去年同期投诉量", "同比", "环比", "开始时间", "结束时间" };
		util.exportExcel(headers, list, outputStream);
	}
}
