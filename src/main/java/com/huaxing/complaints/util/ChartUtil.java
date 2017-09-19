package com.huaxing.complaints.util;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ChartUtil {

	public static Map<String, Object> toChartMap(List<Map<String, Object>> list) {

		List<Object> categoriesList = new ArrayList<Object>();
		List<Object> benzhouList = new ArrayList<Object>();
		List<Object> qianzhouList = new ArrayList<Object>();
		List<Object> oldbenzhouList = new ArrayList<Object>();
		List<Object> oldqianzhouList = new ArrayList<Object>();

		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> map = list.get(i);

			Object field41 = map.get("FIELD41");// 所属区域
			Object benzhoucnt = map.get("BENZHOUCNT");
			Object qianzhoucnt = map.get("QIANZHOUCNT");
			Object oldbenzhoucnt = map.get("OLDBENZHOUCNT");
			Object oldqianzhoucnt = map.get("OLDQIANZHOUCNT");

			categoriesList.add(field41);
			benzhouList.add(benzhoucnt);
			qianzhouList.add(qianzhoucnt);
			oldbenzhouList.add(oldbenzhoucnt);
			oldqianzhouList.add(oldqianzhoucnt);

		}

		List<Object> dataList = new ArrayList<Object>();
		dataList.add(qianzhouList);
		dataList.add(benzhouList);
		dataList.add(oldqianzhouList);
		dataList.add(oldbenzhouList);

		String[] nameArray = new String[] { "上周期", "本周期", "去年往期", "去年同期" };
		List<Map<String, Object>> seriesList = new ArrayList<Map<String, Object>>();
		
		Map<String, Object> tempMap = null;
		for (int i = 0; i < nameArray.length; i++) {
			tempMap = new HashMap<String, Object>();
			tempMap.put("name", nameArray[i]);
			tempMap.put("data", dataList.get(i));

			seriesList.add(tempMap);

		}
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("series", seriesList);
		returnMap.put("categories", categoriesList);

		return returnMap;
	}

	public static List<Map<String, Object>> toChartList(String[] nameArray, List<Integer> list, int loop) {
		List<Map<String, Object>> returnlist = new ArrayList<Map<String, Object>>();
		Map<String, Object> tempMap = new HashMap<String, Object>();
		List<Integer> tempList = new ArrayList<Integer>();
		for (int i = 0; i < list.size(); i++) {
			tempList.add(list.get(i));
			tempMap.put("data", tempList);
			int j = (i + 1) % loop;
			int k = (i + 1) / loop - 1;
			if (j == 0) {
				tempMap.put("name", nameArray[k]);
				returnlist.add(tempMap);
				tempMap = new HashMap<String, Object>();
				tempList = new ArrayList<Integer>();
			}
		}
		return returnlist;
	}

	public static Map<String, Object> getCauseGroupChart(List<Map<String, Object>> list) {
		List<Object> categoriesList = new ArrayList<Object>();
		List<Object> benzhouList = new ArrayList<Object>();
		List<Object> qianzhouList = new ArrayList<Object>();
		List<Object> oldbenzhouList = new ArrayList<Object>();
		List<Object> oldqianzhouList = new ArrayList<Object>();

		for (int i = 0; i < list.size(); i++) {
			Map<String, Object> map = list.get(i);

			Object tousuyanyin = map.get("TOUSUYANYIN");
			Object benzhoucnt = map.get("BENZHOUCNT");
			Object qianzhoucnt = map.get("QIANZHOUCNT");
			Object oldbenzhoucnt = map.get("OLDBENZHOUCNT");
			Object oldqianzhoucnt = map.get("OLDQIANZHOUCNT");

			categoriesList.add(tousuyanyin);
			benzhouList.add(benzhoucnt);
			qianzhouList.add(qianzhoucnt);
			oldbenzhouList.add(oldbenzhoucnt);
			oldqianzhouList.add(oldqianzhoucnt);

		}

		List<Map<String, Object>> seriesList = new ArrayList<Map<String, Object>>();

		Map<String, Object> tempMap = new HashMap<String, Object>();
		tempMap.put("name", "本周期");
		tempMap.put("data", benzhouList);
		seriesList.add(tempMap);

		tempMap = new HashMap<String, Object>();
		tempMap.put("name", "上周期");
		tempMap.put("data", qianzhouList);
		seriesList.add(tempMap);

		tempMap = new HashMap<String, Object>();
		tempMap.put("name", "去年同期");
		tempMap.put("data", oldbenzhouList);
		seriesList.add(tempMap);

		tempMap = new HashMap<String, Object>();
		tempMap.put("name", "去年往期");
		tempMap.put("data", oldqianzhouList);
		seriesList.add(tempMap);

		tempMap = new HashMap<String, Object>();
		tempMap.put("categories", categoriesList);

		List<Map<String, Object>> xAxisList = new ArrayList<Map<String, Object>>();
		xAxisList.add(tempMap);

		tempMap = new HashMap<String, Object>();
		tempMap.put("series", seriesList);
		tempMap.put("xAxis", xAxisList);

		return tempMap;
	}
}
