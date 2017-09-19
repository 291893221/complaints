package com.huaxing.complaints.dao;

import java.util.List;
import java.util.Map;

public interface RepOneKeyMapper {

	List<Map<String, String>> selectOneKeyWarning(Map<String, String> map);

	int selectOneKeyWarningCount(Map<String, String> map);

	List<Map<String, Object>> selectTotal(Map<String, Object> paramMap);

}
