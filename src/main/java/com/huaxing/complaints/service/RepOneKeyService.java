package com.huaxing.complaints.service;

import java.util.List;
import java.util.Map;

public interface RepOneKeyService {

	List<Map<String, String>> selectOneKeyWarning(Map<String, String> map);

	int selectOneKeyWarningCount(Map<String, String> map);

	List<Map<String, Object>> selectTotal(Map<String, Object> paramMap);

}
