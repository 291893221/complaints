package com.huaxing.complaints.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.huaxing.complaints.service.RepOneKeyService;
import com.huaxing.complaints.util.DateUtil;
import com.huaxing.complaints.util.ParamUtil;
import com.huaxing.complaints.util.StringUtil;

@Controller
@RequestMapping("/repOneKeyWarning")
public class RepOneKeyWarningController {
	@Autowired
	private RepOneKeyService service;
	private static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

	/**
	 * http://localhost/complaints/repOneKeyWarning/list
	 */
	@RequestMapping("/list")
	public String list() {
		return "repOneKeyWarning/list";
	}

	@RequestMapping("/listJson")
	@ResponseBody
	public String listJson(HttpServletRequest request, @RequestParam("page") int page, @RequestParam("rows") int rows, String start, String end) {
		// 分页参数
		int startP = (page - 1) * rows + 1;
		int endP = (page) * rows;

		Map<String, String> map = null;
		// 首次访问，默认加载当天导入的数据
		if (null == start || "".equals(start) || null == end || "".equals(end)) {
			map = new HashMap<String, String>();
			start = df.format(new Date());
			map.put("importDate", start);
		} else {
			map = DateUtil.getLastWeekMap(start, end);
		}
		map.put("start", String.valueOf(startP));
		map.put("end", String.valueOf(endP));

		List<Map<String, String>> list = service.selectOneKeyWarning(map);
		int total = service.selectOneKeyWarningCount(map);
		return StringUtil.getJsonString(list, total);
	}

	/**
	 * http://localhost/complaints/repOneKeyWarning/totalJson?params=start%3D2015-05-01%26end%3D2015-05-10
	 */
	@RequestMapping("/totalJson")
	@ResponseBody
	public String totalJson(String params) throws Exception {
		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		DateUtil.getLastWeekMap(paramMap);
		List<Map<String, Object>> list = service.selectTotal(paramMap);
		return StringUtil.getJsonString(list);

	}
}
