package com.huaxing.complaints.service;

import java.util.List;
import java.util.Map;

import com.huaxing.complaints.model.OriNetV600;

public interface OriNetV600Service extends OriService<OriNetV600> {

	Map<String, String> selectCountsByWeek(String start, String end);
	
	List<Map<String, Object>> selectCountsByWeek(Map<String, Object> map);

	List<Map<String, Object>> selectAreaCountsByWeek(Map<String, Object> map);
	
	List<Map<String, Object>> selectOneKeyMonth(Map<String, Object> map);

	List<Map<String, String>> selectLTECountsByWeek(Map<String, String> map);

	List<Map<String, String>> selectCauseGroupPM(Map<String, Object> map);
	
	int selectCauseGroupCountPM(Map<String, Object> map);
	
	List<Map<String, Object>> selectWeakCoverage(Map<String, Object> map);
	
	int selectWeakCoverageCount(Map<String, Object> map);
	
	List<Map<String, Object>> selectWeakCoverageCity(Map<String, Object> map);
	
	int selectWeakCoverageCityCount(Map<String, Object> map);
	
	List<Map<String, Object>> selectCauseGroup(Map<String, Object> map);

	int selectCauseGroupCount(Map<String, Object> map);

	List<Map<String, String>> selectCauseGroupLTE(String start, String end);

	int selectCauseGroupCountLTE(String start, String end);

	List<Map<String, Object>> selectChartList(Map<String, Object> paramMap);

	List<Map<String, Object>> selectCountsChart(Map<String, Object> paramMap);

	List<Map<String, Object>> selectCauseGroupLC(Map<String, Object> paramMap);

	int selectCauseGroupCountLC(Map<String, Object> paramMap);

	Map<String, Object> selectCauseGroupChartLC(Map<String, Object> paramMap);

	Map<String, Object> selectCauseGroupChart(Map<String, Object> paramMap);
	
	Map<String, Object> selectWeakCoverageChart(Map<String, Object> paramMap);

	Map<String, Object> selectWeakCoverageCityChart(Map<String, Object> paramMap);
}
