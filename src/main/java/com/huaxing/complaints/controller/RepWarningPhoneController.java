package com.huaxing.complaints.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huaxing.complaints.service.RepWarningService;
import com.huaxing.complaints.util.DateUtil;
import com.huaxing.complaints.util.ParamUtil;
import com.huaxing.complaints.util.StringUtil;

@Controller
@RequestMapping("/repWarningPhone")
public class RepWarningPhoneController {
	@Autowired
	private RepWarningService service;

	/**
	 * http://localhost/complaints/repWarningPhone/list
	 */
	@RequestMapping("/list")
	public String list() {
		return "repWarningPhone/list";
	}

	@RequestMapping("/listJson")
	@ResponseBody
	public String listJson(int page, int rows, String params) throws Exception {
		// ·ÖÒ³²ÎÊý
		int startP = (page - 1) * rows + 1;
		int endP = (page) * rows;

		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		DateUtil.getDateMapMonthPeriod(paramMap);
		paramMap.put("start", startP);
		paramMap.put("end", endP);
		
		List<Map<String, Object>> list = service.getRepWarningPhone(paramMap);
		int total = service.getRepWarningPhoneCount(paramMap);
		return StringUtil.getJsonStringFromList(list, total); 

	}
}
