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
@RequestMapping("/repOneKeyMonth")
public class RepOneKeyMonthController {
	@Autowired
	private OriNetV600Service service;
	/**
	 * http://localhost/complaints/repOneKeyMonth/list
	 */
	@RequestMapping("/list")
	public String list() {
		return "repOneKeyMonth/list";
	}

	@RequestMapping("/listJson")
	@ResponseBody
	public String listJson(HttpServletRequest request, @RequestParam("page") int page, @RequestParam("rows") int rows, String params) throws Exception {
		// ·ÖÒ³²ÎÊý
		int startP = (page - 1) * rows + 1;
		int endP = (page) * rows;

		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		DateUtil.getOneKeyMonth(paramMap);
		paramMap.put("startP", String.valueOf(startP));
		paramMap.put("endP", String.valueOf(endP));

		List<Map<String, Object>> list = service.selectOneKeyMonth(paramMap);
		int total = 6;
		return StringUtil.getJsonStringFromList(list, total);

	}

	/** 
	 * http://localhost/complaints/repOneKeyMonth/chartJson
	 */ 
	@RequestMapping("/chartJson")
	@ResponseBody
	public String chartJson(String params) throws Exception {
		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		DateUtil.getOneKeyMonth(paramMap);
		List<Map<String, Object>> list = service.selectChartList(paramMap);
		return StringUtil.getJsonString(list);

	}
}
