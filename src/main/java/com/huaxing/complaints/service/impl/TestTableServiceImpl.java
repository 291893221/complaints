package com.huaxing.complaints.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huaxing.complaints.dao.TestTableMapper;
import com.huaxing.complaints.model.TestTable;
import com.huaxing.complaints.service.TestTableService;

@Service("testTableService")
public class TestTableServiceImpl implements TestTableService {
	@Autowired
	private TestTableMapper mapper;
	public void addTestTable(TestTable testTable) {
		mapper.insert(testTable);
	}

	public TestTable getTestTableById(String field1) {
		return mapper.selectByPrimaryKey(field1);
	}

	public int insertBatch(List<TestTable> list) {
		Map<String, List> map = new HashMap<String, List>();
		map.put("list", list);
		return mapper.insertBatch(map);
	}

}
