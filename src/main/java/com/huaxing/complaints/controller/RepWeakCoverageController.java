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
@RequestMapping("/repWeakCoverage")
public class RepWeakCoverageController {
	@Autowired
	private OriNetV600Service service;

	/**
	 * http://localhost/complaints/repWeakCoverage/list
	 */
	@RequestMapping("/list")
	public String list() {
		return "repWeakCoverage/list";
	}

	@RequestMapping("/listJson")
	@ResponseBody
	public String listJson(String page, String rows, String params) throws Exception {
		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		DateUtil.getDateMap(paramMap);
		PageUtil.getPageMap(paramMap, page, rows);
		
		List<Map<String, Object>> list = service.selectWeakCoverage(paramMap);
		int total = service.selectWeakCoverageCount(paramMap);
		return StringUtil.getJsonStringFromList(list, total);
	}

	/** 
	 * http://localhost/complaints/repWeakCoverage/chartJson
	 */ 
	@RequestMapping("/chartJson")
	@ResponseBody
	public String chartJson(String params) throws Exception {
		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		DateUtil.getDateMap(paramMap);
		paramMap.remove("start");
		paramMap.remove("end");
		Map<String, Object> map = service.selectWeakCoverageChart(paramMap);
		return StringUtil.getJsonStringFromMap(map);

	}
}
