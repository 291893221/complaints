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
		// 使用"spring.xml"和"spring-mybatis.xml"这两个配置文件创建Spring上下文
		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "spring.xml", "spring-mybatis.xml" });
		// 从Spring容器中根据bean的id取出我们要使用的userService对象
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

			// 遍历map中的key值
			// for (String key : map.keySet()) {
			// System.out.println("Key = " + key);
			// }
			// 遍历map中的value值
			// for (Object value : map.values()) {
			// System.out.println("Value = " + value);
			// }
		}
		String jsonString = StringUtil.getJsonString(returnList);
		logger.info(jsonString);
	}

}
