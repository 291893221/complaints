package com.huaxing.complaints.service;

import java.util.List;
import java.util.Map;

public interface OriService<T> {

	List<T> selectPaging(Map<String, Object> paramMap);

	int selectCount(Map<String, Object> paramMap);

	int insertBatch(List<T> list);

	int deleteBatch(List<String> field0List);
}
