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
import com.huaxing.complaints.util.StringUtil;

@Controller
@RequestMapping("/repNetV600LTE")
public class RepNetV600LTEController {
	@Autowired
	private OriNetV600Service service;

	/**
	 * http://localhost/complaints/repNetV600LTE/list
	 */
	@RequestMapping("/list")
	public String list() {
		return "repNetV600LTE/list";
	}

	@RequestMapping("/listJson")
	@ResponseBody
	public String listJson(HttpServletRequest request, @RequestParam("page") int page, @RequestParam("rows") int rows, String start, String end) {
		// ·ÖÒ³²ÎÊý
		int startP = (page - 1) * rows + 1;
		int endP = (page) * rows;

		Map<String, String> map = DateUtil.getDateMap(start, end);
		map.put("startP", String.valueOf(startP));
		map.put("endP", String.valueOf(endP));

		List<Map<String, String>> list = service.selectLTECountsByWeek(map);
		int total = 6;
		return StringUtil.getJsonString(list, total);

	}
}
