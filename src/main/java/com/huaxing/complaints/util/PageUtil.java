package com.huaxing.complaints.util;

import java.util.HashMap;
import java.util.Map;

public class PageUtil {
	public static Map<String, Object> getPageMap(Map<String, Object> paramMap, String pageString, String rowsString) {
		// 参数校验
		if (null == paramMap) {
			paramMap = new HashMap<String, Object>();
		}
		if (null == pageString || "".equals(pageString) || "NaN".equals(pageString)) {
			pageString = "1";
		}
		if (null == rowsString || "".equals(rowsString) || "NaN".equals(rowsString)) {
			rowsString = "10";
		}
		// 分页参数
		int page = 1;
		int rows = 10;
		try {
			page = Integer.valueOf(pageString);
			rows = Integer.valueOf(rowsString);
		} catch (Exception e) {
			e.printStackTrace();
		}

		int startP = (page - 1) * rows + 1;
		int endP = page * rows;

		paramMap.put("start", String.valueOf(startP));
		paramMap.put("end", String.valueOf(endP));
		return paramMap;
	}
}
