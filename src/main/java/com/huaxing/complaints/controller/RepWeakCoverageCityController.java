package com.huaxing.complaints.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huaxing.complaints.service.OriNetV600Service;
import com.huaxing.complaints.util.DateUtil;
import com.huaxing.complaints.util.PageUtil;
import com.huaxing.complaints.util.ParamUtil;
import com.huaxing.complaints.util.StringUtil;

@Controller
@RequestMapping("/repWeakCoverageCity")
public class RepWeakCoverageCityController {
	@Autowired
	private OriNetV600Service service;

	/**
	 * http://localhost/complaints/repWeakCoverageCity/list
	 */
	@RequestMapping("/list")
	public String list() {
		return "repWeakCoverageCity/list";
	}

	@RequestMapping("/listJson")
	@ResponseBody
	public String listJson(String page, String rows, String params) throws Exception {
		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		DateUtil.getDateMap(paramMap);
		PageUtil.getPageMap(paramMap, page, rows);
		
		List<Map<String, Object>> list = service.selectWeakCoverageCity(paramMap);
		int total = service.selectWeakCoverageCityCount(paramMap);
		return StringUtil.getJsonStringFromList(list, total);
	}
	
	/** 
	 * http://localhost/complaints/repWeakCoverageCity/chartJson
	 */ 
	@RequestMapping("/chartJson")
	@ResponseBody
	public String chartJson(String params) throws Exception {
		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		DateUtil.getDateMap(paramMap);
		Map<String, Object> map = service.selectWeakCoverageCityChart(paramMap);
		return StringUtil.getJsonStringFromMap(map);

	}

}
