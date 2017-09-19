package com.huaxing.complaints.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface OriMapper<T> {

	int insertBatch(@Param(value = "list") List<T> list);

	List<T> selectPaging(Map<String, Object> paramMap);

	int selectCount(Map<String, Object> paramMap);

	int deleteBatch(@Param(value = "field0List") List<String> field0List);
}