package com.huaxing.complaints.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.huaxing.complaints.controller.TestTableController;
import com.huaxing.complaints.model.RepComplaintOrders;
import com.huaxing.complaints.model.TestTable;
import com.huaxing.complaints.util.UUIDUtil;

public class TestView {
	private static Logger logger = Logger.getLogger(TestView.class);
	private RepComplaintOrdersService service;

	@Before
	public void before() {
		// 使用"spring.xml"和"spring-mybatis.xml"这两个配置文件创建Spring上下文
		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "spring.xml", "spring-mybatis.xml" });
		// 从Spring容器中根据bean的id取出我们要使用的userService对象
		service = (RepComplaintOrdersService) ac.getBean("repComplaintOrdersService");
	}

	@Test
	public void testSelectAll() {
		List<RepComplaintOrders> list = service.selectAll();
		logger.info("=== || " + list.size());
	}

}
