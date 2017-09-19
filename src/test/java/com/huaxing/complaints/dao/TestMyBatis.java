package com.huaxing.complaints.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.huaxing.complaints.util.ChartUtil;
import com.huaxing.complaints.util.DateUtil;
import com.huaxing.complaints.util.StringUtil;

public class TestMyBatis {
	private static Logger logger = Logger.getLogger(TestMyBatis.class);
	private OriNetV600Mapper mapper;

	@Before
	public void before() {
		// 使用"spring.xml"和"spring-mybatis.xml"这两个配置文件创建Spring上下文
		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "spring.xml", "spring-mybatis.xml" });
		// 从Spring容器中根据bean的id取出我们要使用的userService对象
		mapper = (OriNetV600Mapper) ac.getBean("oriNetV600Mapper");
	}

	@Test
	public void selectCount() {
		// mapper.getClass();
		int selectCount = mapper.selectCount(null);
		logger.info(selectCount);
	}

	@Test
	public void selectOneKeyChart() throws Exception {
		String[] nameArray = new String[] { "上周期", "本周期", "去年往期", "去年同期" };
		Map<String, Object> paramMap = DateUtil.getOneKeyMonth(null);
		List<Integer> list = mapper.selectOneKeyChart(paramMap);
		logger.info(list.size());
		List<Map<String, Object>> returnlist = new ArrayList<Map<String, Object>>();
		Map<String, Object> tempMap = new HashMap<String, Object>();
		List<Integer> tempList = new ArrayList<Integer>();
		for (int i = 0; i < list.size(); i++) {
			tempList.add(list.get(i));
			tempMap.put("data", tempList);
			int j = (i + 1) % 6;
			if (j == 0) {
				tempMap.put("name", nameArray[(i + 1) / 6 - 1]);
				returnlist.add(tempMap);
				tempMap = new HashMap<String, Object>();
				tempList = new ArrayList<Integer>();
			}
		}

		String jsonString = StringUtil.getJsonString(returnlist);
		System.out.println(jsonString);
	}
	
	@Test
	public void selectOneKeyChartFZ() throws Exception {
		String[] nameArray = new String[] { "上周期", "本周期", "去年往期", "去年同期" };
		Map<String, Object> paramMap = DateUtil.getOneKeyMonth(null);
		List<Integer> list = mapper.selectOneKeyChart(paramMap);
		logger.info(list.size());
		List<Map<String, Object>> returnlist =  ChartUtil.toChartList(nameArray, list, 6);

		String jsonString = StringUtil.getJsonString(returnlist);
		System.out.println(jsonString);
	}
	
	@Test
	public void selectCountsChart() throws Exception {
		String[] nameArray = new String[] { "今年同期", "去年往期" };
		Map<String, Object> paramMap = DateUtil.getOneKeyMonth(null);
		List<Integer> list = mapper.selectCountsChart(paramMap);
		logger.info(list.size());
		List<Map<String, Object>> returnlist = ChartUtil.toChartList(nameArray, list, 2);
		String jsonString = StringUtil.getJsonString(returnlist);
		System.out.println(jsonString);
	}

	@Test
	public void selectCauseGroupChartLC() throws Exception {
		Map<String, Object> paramMap = DateUtil.getOneKeyWeek(null);
		List<Map<String, Object>> list = mapper.selectCauseGroupLC(paramMap);
		
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
			
			//System.out.println(tousuyanyin+ " , " +benzhoucnt+ " , " +qianzhoucnt+ " , " +oldbenzhoucnt+ " , " +oldqianzhoucnt);
			
		}
		
		List<Map<String, Object>> seriesList = new ArrayList<Map<String, Object>>();
		
		Map<String, Object> tempMap = new HashMap<String, Object>();
		tempMap.put("name","本周期");
		tempMap.put("data", benzhouList);
		seriesList.add(tempMap);
		
		tempMap = new HashMap<String, Object>();
		tempMap.put("name","上周期");
		tempMap.put("data", qianzhouList);
		seriesList.add(tempMap);
		
		tempMap = new HashMap<String, Object>();
		tempMap.put("name","去年同期");
		tempMap.put("data", oldbenzhouList);
		seriesList.add(tempMap);
		
		tempMap = new HashMap<String, Object>();
		tempMap.put("name","去年往期");
		tempMap.put("data", oldqianzhouList);
		seriesList.add(tempMap);
		
		tempMap = new HashMap<String, Object>();
		tempMap.put("categories", categoriesList);
		
		List<Map<String, Object>> xAxisList = new ArrayList<Map<String, Object>>();
		xAxisList.add(tempMap);
		
		
		tempMap = new HashMap<String, Object>();
		tempMap.put("series", seriesList);
		tempMap.put("xAxis", xAxisList);
		
//		List<Map<String, Object>> returnlist = new ArrayList<Map<String, Object>>();
//		returnlist.add(tempMap);
		
		String jsonString = StringUtil.getJsonStringFromMap(tempMap);
		System.out.println(jsonString);
	}
	
	public static void main(String[] args) {
		System.out.println(24 / 4);
		System.out.println(24 % 4);
	}
}
