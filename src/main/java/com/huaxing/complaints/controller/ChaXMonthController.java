package com.huaxing.complaints.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huaxing.complaints.service.ChaService;
import com.huaxing.complaints.util.StringUtil;

@Controller
@RequestMapping("/chaXMonth")
public class ChaXMonthController {
	@Autowired
	private ChaService service;

	/** 
	 * http://localhost/complaints/chaXMonth/chartJson
	 */ 
	@RequestMapping("/chartJson")
	@ResponseBody
	public String chartJson() throws Exception {
		List<Map<String, Object>> list = service.getChaXMonth();
		return StringUtil.getJsonString(list);
	}
	
}
