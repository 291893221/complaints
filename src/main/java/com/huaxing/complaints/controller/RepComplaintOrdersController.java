package com.huaxing.complaints.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huaxing.complaints.model.RepComplaintOrders;
import com.huaxing.complaints.service.RepComplaintOrdersService;
import com.huaxing.complaints.util.DateUtil;
import com.huaxing.complaints.util.ParamUtil;

@Controller
@RequestMapping("/repComplaintOrders")
public class RepComplaintOrdersController {
	@Autowired
	private RepComplaintOrdersService service;

	/**
	 * http://localhost/complaints/repComplaintOrders/list
	 */
	@RequestMapping("/list")
	public String list() {
		return "repComplaintOrders/list";
	}

	@RequestMapping("/listJson")
	@ResponseBody
	public String listJson(@RequestParam("page") int page, @RequestParam("rows") int rows, String params) throws Exception {		
		// 分页参数
		int startP = (page - 1) * rows + 1;
		int endP = (page) * rows;
		// 参数封装
		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		paramMap = DateUtil.getDatePeriod(paramMap);
		paramMap.put("startP", String.valueOf(startP));
		paramMap.put("endP", String.valueOf(endP));
		
		List<RepComplaintOrders> list = service.selectPagingDate(paramMap);
		int total = service.selectPagingDateCount(paramMap);
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("total", total);
		jsonMap.put("rows", list);
		String jsonString = JSONObject.valueToString(jsonMap);
		System.out.println(jsonString);
		return jsonString;
	}
}
