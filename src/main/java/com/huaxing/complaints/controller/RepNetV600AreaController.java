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
@RequestMapping("/repNetV600Area")
public class RepNetV600AreaController {
	@Autowired
	private OriNetV600Service service;

	/**
	 * http://localhost/complaints/repNetV600Area/list
	 */
	@RequestMapping("/list")
	public String list() {
		return "repNetV600Area/list";
	}

	@RequestMapping("/listJson")
	@ResponseBody
	public String listJson(int page, int rows, String params) throws Exception {
		// ·ÖÒ³²ÎÊý
		int startP = (page - 1) * rows + 1;
		int endP = (page) * rows;

		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		DateUtil.getDateMap(paramMap);

		List<Map<String, Object>> list = service.selectAreaCountsByWeek(paramMap);
		return StringUtil.getJsonStringFromList(list, list.size());

	}
	
	/** 
	 * http://localhost/complaints/repOneKeyMonth/chartJson
	 */ 
	@RequestMapping("/chartJson")
	@ResponseBody
	public String chartJson(String params) throws Exception {
		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		DateUtil.getDateMap(paramMap);
		List<Map<String, Object>> list = service.selectChartList(paramMap);
		return StringUtil.getJsonString(list);

	}
}
