package com.huaxing.complaints.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;

public class JSONUtil {
	public static void main(String[] args) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("text", "¹¦ÄÜ²Ëµ¥");
		Map<String, Object> url = new HashMap<String, Object>();
		url.put("url", "../oriNetV600/list");
		map.put("attributes", url);
		list.add(map);
		String jsonString = JSONObject.valueToString(list);
		System.out.println(jsonString);
	}
}
