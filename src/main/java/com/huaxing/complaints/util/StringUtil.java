package com.huaxing.complaints.util;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONObject;

public class StringUtil {
	public static void main(String[] args) {
		String jsonString = getJsonString(getJsonStringTest());
		System.out.println(jsonString);
	}
	
	public static List<String> getListFromString(String ids) {
		if (null == ids || "".equals(ids.trim())) {
			return null;
		}
		String[] idArr = ids.split(",");
		List<String> idList = Arrays.asList(idArr);
		return idList;
	}
	
	public static String getJsonString(boolean b,int i, String msg) {
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("success", b);
		jsonMap.put("rows", i);
		jsonMap.put("msg", msg);
		String jsonString = JSONObject.valueToString(jsonMap);
		return jsonString;
	}
	
	public static String getJsonString(List<Map<String, String>> list, int total) {
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("total", total);
		jsonMap.put("rows", list);
		String jsonString = JSONObject.valueToString(jsonMap);
		return jsonString;
	}
	
	public static String getJsonStringFromList(List<Map<String, Object>> list, int total) {
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("total", total);
		jsonMap.put("rows", list);
		String jsonString = JSONObject.valueToString(jsonMap);
		return jsonString;
	}
	
	public static String getJsonString(Map<String, String> map,int total) {
		List<Map<String, String>> list = new ArrayList<Map<String, String>>();
		list.add(map);
		String jsonString = getJsonString(list, total);
		return jsonString;
	}
	
	public static String getJson(List list, int total) {
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("total", total);
		jsonMap.put("rows", list);
		String jsonString = JSONObject.valueToString(jsonMap);
		return jsonString;
	}
	
	public static String getJsonString(Map<String, String> map) {
		String jsonString = JSONObject.valueToString(map);
		return jsonString;
	}

	public static String getJsonStringFromMap(Map<String, Object> map) {
		String jsonString = JSONObject.valueToString(map);
		return jsonString;
	}
	
	public static String getJsonString(List<Map<String, Object>> list) {
		String jsonString = JSONObject.valueToString(list);
		return jsonString;
	}
	
	public static List<Map<String, Object>> getJsonStringTest() {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>> ();
		for (int i = 0; i < 4; i++) {			
			Map<String, Object> map = new HashMap<String, Object>();
			List<Float> tempList = new ArrayList<Float>();
			tempList.add(90.9f);
			tempList.add(90.9f);
			tempList.add(90.9f);
			tempList.add(90.9f);
			tempList.add(90.9f);
			tempList.add(90.9f);
			map.put("data", tempList);
			map.put("name", "2016-03-01 TO 2016-03-31");
			list.add(map);
		}
		return list;
	}
}
