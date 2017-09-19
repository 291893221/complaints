package com.huaxing.complaints.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huaxing.complaints.service.OriNetV600Service;
import com.huaxing.complaints.util.DateUtil;
import com.huaxing.complaints.util.ParamUtil;
import com.huaxing.complaints.util.StringUtil;

@Controller
@RequestMapping("/repNetV600Count")
public class RepNetV600CountController {
	@Autowired
	private OriNetV600Service service;

	/**
	 * http://localhost/complaints/repNetV600Count/list
	 */
	@RequestMapping("/list")
	public String list() {
		return "repNetV600Count/list";
	}

	@RequestMapping("/listJson")
	@ResponseBody
	public String listJson(String params) throws Exception {
		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		DateUtil.getOneKeyWeek(paramMap);
		List<Map<String, Object>> list = service.selectCountsByWeek(paramMap);
		return StringUtil.getJsonStringFromList(list, 1);
	}
	
	
	/** 
	 * http://localhost/complaints/repNetV600Count/chartJson
	 */ 
	@RequestMapping("/chartJson")
	@ResponseBody
	public String chartJson(String params) throws Exception {
		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		DateUtil.getOneKeyWeek(paramMap);
		List<Map<String, Object>> list = service.selectCountsChart(paramMap);
		return StringUtil.getJsonString(list);
	}
}
