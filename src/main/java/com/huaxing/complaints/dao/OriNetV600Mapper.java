package com.huaxing.complaints.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.huaxing.complaints.model.OriNetV600;

public interface OriNetV600Mapper extends OriMapper<OriNetV600> {

	Map<String, String> selectCountsByWeek(@Param(value = "startDate1") String startDate1, 
			@Param(value = "endDate1") String endDate1,
			@Param(value = "startDate2") String startDate2, 
			@Param(value = "endDate2") String endDate2,
			@Param(value = "startDate3") String startDate3, 
			@Param(value = "endDate3") String endDate3,
			@Param(value = "startDate4") String startDate4, 
			@Param(value = "endDate4") String endDate4 );
	
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

	List<Map<String, String>> selectCauseGroupLTE(Map<String, String> map);

	int selectCauseGroupCountLTE(Map<String, String> map);
	
	List<Integer> selectOneKeyChart(Map<String, Object> map);
	
	List<Integer> selectCountsChart(Map<String, Object> map);

	List<Map<String, Object>> selectCauseGroupLC(Map<String, Object> paramMap);

	int selectCauseGroupCountLC(Map<String, Object> paramMap);

}