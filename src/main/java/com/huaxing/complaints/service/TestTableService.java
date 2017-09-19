package com.huaxing.complaints.service;

import java.util.List;

import com.huaxing.complaints.model.TestTable;


public interface TestTableService {
	public void addTestTable(TestTable testTable);
	public TestTable getTestTableById(String field1);
	public int insertBatch(List<TestTable> list);
}
