package com.huaxing.complaints.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huaxing.complaints.service.RepWarningService;
import com.huaxing.complaints.util.DateUtil;
import com.huaxing.complaints.util.StringUtil;


@Controller
@RequestMapping("/repWarningHotPoint")
public class RepWarningHotPointController {
	@Autowired
	private RepWarningService service;

	/**
	 * http://localhost/complaints/repWarningHotPoint/list
	 */
	@RequestMapping("/list")
	public String list() {
		return "repWarningHotPoint/list";
	}

	@RequestMapping("/listJson")
	@ResponseBody
	public String listJson(HttpServletRequest request, @RequestParam("page") int page, @RequestParam("rows") int rows, String start, String end) {
		// ·ÖÒ³²ÎÊý
		int startP = (page - 1) * rows + 1;
		int endP = (page) * rows;
		
		Map<String, String> map = DateUtil.getDateMapMonthPeriod(start, end);
		map.put("startP", String.valueOf(startP));
		map.put("endP", String.valueOf(endP));
		
		List<Map<String, String>> list = service.getRepWarningHotPoint(map);
		int total = service.getRepWarningHotPointCount(map);
		return StringUtil.getJsonString(list, total);
	
	}
}
