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

import com.huaxing.complaints.util.StringUtil;

public class TestChaMapper {
	private static Logger logger = Logger.getLogger(TestChaMapper.class);
	private ChaMapper mapper;

	@Before
	public void before() {
		// ʹ��"spring.xml"��"spring-mybatis.xml"�����������ļ�����Spring������
		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "spring.xml", "spring-mybatis.xml" });
		// ��Spring�����и���bean��idȡ������Ҫʹ�õ�userService����
		mapper = (ChaMapper) ac.getBean("chaMapper");
	}

	@Test
	public void getChaXMonth() throws Exception {
		List<Map<String, Object>> returnList = new ArrayList<Map<String,Object>>(); 
		List<Map<String, Object>> list = mapper.getChaXMonth();
		for (Map<String, Object> map : list) {
			Object ym = map.get("YM");
			Object cnt = map.get("CNT");
			System.out.println(ym + " " + cnt);
			Map<String, Object> tempMap = new HashMap<String, Object>();
			tempMap.put(ym.toString(), cnt);
			returnList.add(tempMap);
			
			// for (Entry<String, Object> entry : map.entrySet()) {
			// System.out.println("Key = " + entry.getKey() + ", Value = " +
			// entry.getValue());
			// }

			// ����map�е�keyֵ
			// for (String key : map.keySet()) {
			// System.out.println("Key = " + key);
			// }
			// ����map�е�valueֵ
			// for (Object value : map.values()) {
			// System.out.println("Value = " + value);
			// }
		}
		String jsonString = StringUtil.getJsonString(returnList);
		logger.info(jsonString);
	}

}
