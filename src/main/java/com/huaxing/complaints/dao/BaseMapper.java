package com.huaxing.complaints.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BaseMapper<T> {
	int insert(T record);

	int insertSelective(T record);

	int insertBatch(@Param(value = "list") List<T> list);

	List<T> selectAll();

	List<T> selectPaging(@Param(value = "start") int start, @Param(value = "end") int end);

	int selectCount();

	int deleteBatch(@Param(value = "field0List") List<String> field0List);
}