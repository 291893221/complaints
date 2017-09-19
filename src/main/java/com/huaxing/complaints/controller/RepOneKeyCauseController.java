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
@RequestMapping("/repOneKeyCause")
public class RepOneKeyCauseController {
	@Autowired
	private OriNetV600Service service;

	/**
	 * http://localhost/complaints/repOneKeyCause/list
	 */
	@RequestMapping("/list")
	public String list() {
		return "repOneKeyCause/list";
	}

	@RequestMapping("/listJson")
	@ResponseBody
	public String listJson(String page, String rows, String params) throws Exception {
		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		DateUtil.getDateMap(paramMap);
		PageUtil.getPageMap(paramMap, page, rows);
		
		List<Map<String, String>> list = service.selectCauseGroupPM(paramMap);
		int total = service.selectCauseGroupCountPM(paramMap);
		return StringUtil.getJsonString(list, total);
	}

}
