package com.huaxing.complaints.service;

import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.huaxing.complaints.model.TestTable;
import com.huaxing.complaints.util.UUIDUtil;

public class TestService {
	private TestTableService testTableService;

	@Before
	public void before() {
		// ʹ��"spring.xml"��"spring-mybatis.xml"�����������ļ�����Spring������
		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "spring.xml", "spring-mybatis.xml" });
		// ��Spring�����и���bean��idȡ������Ҫʹ�õ�userService����
		testTableService = (TestTableService) ac.getBean("testTableService");
	}

	@Test
	public void testAddTable() {
		TestTable testTable = new TestTable();
		testTable.setField1(UUIDUtil.getRandomUUID());
		testTable.setField2("TEST");
		testTable.setField3("TEST");
		testTable.setField4("TEST");
		testTable.setField5("TEST");
		testTable.setField6("TEST");
		testTableService.addTestTable(testTable);
	}
	
	@Test
	public void testInsertBatch() {
		List<TestTable> list = new ArrayList<TestTable>();
		for (int i = 0; i < 3; i++) {
			TestTable testTable = new TestTable();
			testTable.setField1(UUIDUtil.getRandomUUID());
			testTable.setField2("TEST"+i);
			testTable.setField3("TEST"+i);
			testTable.setField4("TEST"+i);
			testTable.setField5("TEST"+i);
			testTable.setField6("TEST"+i);
			testTable.setField7("TEST"+i);
			testTable.setField8("TEST"+i);
			testTable.setField9("TEST"+i);
			testTable.setField10("TEST"+i);
			list.add(testTable);
		}
		int insertBatch = testTableService.insertBatch(list);
		System.out.println("=== || "+insertBatch);
	}

}
