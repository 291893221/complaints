package com.huaxing.complaints.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huaxing.complaints.service.OriNetV600Service;
import com.huaxing.complaints.util.DateUtil;
import com.huaxing.complaints.util.ParamUtil;
import com.huaxing.complaints.util.StringUtil;

@Controller
@RequestMapping("/repComplaintCauseLC")
public class RepComplaintCauseLCController {
	@Autowired
	private OriNetV600Service service;

	/**
	 * http://localhost/complaints/repComplaintCauseLC/list
	 */
	@RequestMapping("/list")
	public String list() {
		return "repComplaintCauseLC/list";
	}

	@RequestMapping("/listJson")
	@ResponseBody
	public String listJson(HttpServletRequest request, @RequestParam("page") int page, @RequestParam("rows") int rows, String params) throws Exception {
		// ·ÖÒ³²ÎÊý
		int start = (page - 1) * rows + 1;
		int end = (page) * rows;
		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		DateUtil.getDateMap(paramMap);
		paramMap.put("start", start);
		paramMap.put("end", end);
		
		List<Map<String, Object>> list = service.selectCauseGroupLC(paramMap);
		int total = service.selectCauseGroupCountLC(paramMap);
		return StringUtil.getJsonStringFromList(list, total);
	}

	/** 
	 * http://localhost/complaints/repComplaintCauseLC/chartJson
	 */ 
	@RequestMapping("/chartJson")
	@ResponseBody
	public String chartJson(String params) throws Exception {
		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		DateUtil.getDateMap(paramMap);
		paramMap.remove("start");
		paramMap.remove("end");
		Map<String, Object> map = service.selectCauseGroupChartLC(paramMap);
		return StringUtil.getJsonStringFromMap(map);

	}
}
