package com.huaxing.complaints.service;

import java.util.List;
import java.util.Map;

import com.huaxing.complaints.model.RepWarning;

public interface RepWarningService extends BaseService<RepWarning> {

	List<Map<String, Object>> getRepWarningCell(Map<String, Object> map);
	
	int getRepWarningCellCount(Map<String, Object> map);

	List<Map<String, Object>> getRepWarningPhone(Map<String, Object> map);

	int getRepWarningPhoneCount(Map<String, Object> map);

	List<Map<String, String>> getRepWarningBlackDot(Map<String, String> map);

	int getRepWarningBlackDotCount(Map<String, String> map);

	List<Map<String, String>> getRepWarningHotPoint(Map<String, String> map);

	int getRepWarningHotPointCount(Map<String, String> map);

	List<Map<String, Object>> getRepWarningDetail(Map<String, Object> paramMap);

	int getRepWarningDetailCount(Map<String, Object> paramMap);

}
