package com.huaxing.complaints.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huaxing.complaints.dao.OriNetV600Mapper;
import com.huaxing.complaints.model.OriNetV600;
import com.huaxing.complaints.service.OriNetV600Service;
import com.huaxing.complaints.util.ChartUtil;
import com.huaxing.complaints.util.DateUtil;

@Service("oriNetV600Service")
public class OriNetV600ServiceImpl implements OriNetV600Service {
	@Autowired
	private OriNetV600Mapper mapper;

	public Map<String, String> selectCountsByWeek(String start,String end) {
		String startDate1, endDate1, startDate2, endDate2, startDate3, endDate3, startDate4, endDate4;
		if (null == start || "".equals(start) || null == end || "".equals(end)) {
			// 今年上周
			startDate1 = DateUtil.getLastWeekSunday();
			endDate1 = DateUtil.getLastWeekSaturday();
			// 今年本周
			startDate2 = DateUtil.getThisWeekSunday();
			endDate2 = DateUtil.getThisWeekSaturday();
			// 去年上周
			startDate3 = DateUtil.getLastYearLastWeekSunday();
			endDate3 = DateUtil.getLastYearLastWeekSaturday();
			// 去年本周
			startDate4 = DateUtil.getLastYearThisWeekSunday();
			endDate4 = DateUtil.getLastYearThisWeekSaturday();
			return mapper.selectCountsByWeek(startDate1, endDate1, startDate2, endDate2, startDate3, endDate3, startDate4, endDate4);
		} 
		
		if (!DateUtil.checkDate(start, end)) {
			return null;
		}
		
		// 今年上期
		startDate1 = DateUtil.getLastPeriodStart(start, end);
		endDate1 = DateUtil.getLastPeriodEnd(start);
		// 今年本期
		startDate2 = start;
		endDate2 = end;
		// 去年上期
		startDate3 = DateUtil.getLastYearLastPeriodStart(start, end);
		endDate3 = DateUtil.getLastYearLastPeriodEnd(start);
		// 去年本期
		startDate4 = DateUtil.getLastYearThisPeriodStart(start);
		endDate4 = DateUtil.getLastYearThisPeriodEnd(end);
		return mapper.selectCountsByWeek(startDate1, endDate1, startDate2, endDate2, startDate3, endDate3, startDate4, endDate4);
	}

	public List<Map<String, Object>> selectAreaCountsByWeek(Map<String, Object> map) {
		return mapper.selectAreaCountsByWeek(map);
	}
	
	public List<Map<String, String>> selectLTECountsByWeek(Map<String, String> map) {
		return mapper.selectLTECountsByWeek(map);
	}

	public int insertBatch(List<OriNetV600> list) {
		return mapper.insertBatch(list);
	}

	public int deleteBatch(List<String> field0List) {
		return mapper.deleteBatch(field0List);
	}
	
	public List<Map<String, String>> selectCauseGroupPM(Map<String, Object> map) {
		return mapper.selectCauseGroupPM(map);
	}

	public int selectCauseGroupCountPM(Map<String, Object> map) {
		return mapper.selectCauseGroupCountPM(map);
	}
	
	public List<Map<String, Object>> selectWeakCoverage(Map<String, Object> map) {
		return mapper.selectWeakCoverage(map);
	}
	
	public int selectWeakCoverageCount(Map<String, Object> map) {
		return mapper.selectWeakCoverageCount(map);
	}

	public List<Map<String, Object>> selectWeakCoverageCity(Map<String, Object> map) {
		return mapper.selectWeakCoverageCity(map);
	}

	public int selectWeakCoverageCityCount(Map<String, Object> map) {
		return mapper.selectWeakCoverageCityCount(map);
	}
	
	public List<Map<String, Object>> selectCauseGroup(Map<String, Object> map) {
		return mapper.selectCauseGroup(map);
	}

	public int selectCauseGroupCount(Map<String, Object> map) {
		return mapper.selectCauseGroupCount(map);
	}

	public List<Map<String, String>> selectCauseGroupLTE(String start, String end) {
		Map<String, String> map = DateUtil.getDateMap(start, end);
		return mapper.selectCauseGroupLTE(map);
	}

	public int selectCauseGroupCountLTE(String start, String end) {
		Map<String, String> map = DateUtil.getDateMap(start, end);
		return mapper.selectCauseGroupCountLTE(map);
	}

	public List<OriNetV600> selectPaging(Map<String, Object> paramMap) {
		return mapper.selectPaging(paramMap);
	}

	public int selectCount(Map<String, Object> paramMap) {
		return mapper.selectCount(paramMap);
	}

	public List<Map<String, Object>> selectOneKeyMonth(Map<String, Object> map) {
		return mapper.selectOneKeyMonth(map);
	}

	public List<Map<String, Object>> selectChartList(Map<String, Object> paramMap) {
		String[] nameArray = new String[] { "上周期", "本周期", "去年往期", "去年同期" };
		List<Integer> list = mapper.selectOneKeyChart(paramMap);
		List<Map<String, Object>> returnlist = new ArrayList<Map<String, Object>>();
		Map<String, Object> tempMap = new HashMap<String, Object>();
		List<Integer> tempList = new ArrayList<Integer>();
		for (int i = 0; i < list.size(); i++) {
			tempList.add(list.get(i));
			tempMap.put("data", tempList);
			int j = (i + 1) % 6;
			if (j == 0) {
				tempMap.put("name", nameArray[(i + 1) / 6 - 1]);
				returnlist.add(tempMap);
				tempMap = new HashMap<String, Object>();
				tempList = new ArrayList<Integer>();
			}
		}
		return returnlist;
	}

	public List<Map<String, Object>> selectCountsByWeek(Map<String, Object> map) {
		return mapper.selectCountsByWeek(map);
	}

	public List<Map<String, Object>> selectCountsChart(Map<String, Object> paramMap) {
		String[] nameArray = new String[] { "今年同期", "去年同期" };
		List<Integer> list = mapper.selectCountsChart(paramMap);
		List<Map<String, Object>> returnlist = ChartUtil.toChartList(nameArray, list, 2);
		return returnlist;
	}

	public List<Map<String, Object>> selectCauseGroupLC(Map<String, Object> paramMap) {
		return mapper.selectCauseGroupLC(paramMap);
	}

	public int selectCauseGroupCountLC(Map<String, Object> paramMap) {
		return mapper.selectCauseGroupCountLC(paramMap);
	}

	public Map<String, Object> selectCauseGroupChartLC(Map<String, Object> paramMap) {
		List<Map<String, Object>> list = mapper.selectCauseGroupLC(paramMap);
		return ChartUtil.getCauseGroupChart(list);
	}
	
	public Map<String, Object> selectCauseGroupChart(Map<String, Object> paramMap) {
		List<Map<String, Object>> list = mapper.selectCauseGroup(paramMap);
		return ChartUtil.getCauseGroupChart(list);
	}
	
	public Map<String, Object> selectWeakCoverageChart(Map<String, Object> paramMap) {
		List<Map<String, Object>> list = mapper.selectWeakCoverage(paramMap);
		return ChartUtil.getCauseGroupChart(list);
	}

	public Map<String, Object> selectWeakCoverageCityChart(Map<String, Object> paramMap) {
		
		List<Map<String,Object>> list = mapper.selectWeakCoverageCity(paramMap);
		Map<String, Object> returnMap = ChartUtil.toChartMap(list);
		return returnMap;
	}
}