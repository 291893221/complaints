package com.huaxing.complaints.dao;

import java.util.Map;

import com.huaxing.complaints.model.TestTable;

public interface TestTableMapper {
    int deleteByPrimaryKey(String field1);

    int insert(TestTable record);
    
    int insertBatch(Map map);

    int insertSelective(TestTable record);

    TestTable selectByPrimaryKey(String field1);

    int updateByPrimaryKeySelective(TestTable record);

    int updateByPrimaryKey(TestTable record);
}