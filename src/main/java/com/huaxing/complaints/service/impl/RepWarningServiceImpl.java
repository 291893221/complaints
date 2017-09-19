package com.huaxing.complaints.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huaxing.complaints.dao.RepWarningMapper;
import com.huaxing.complaints.model.RepWarning;
import com.huaxing.complaints.service.RepWarningService;

@Service("repWarningCellService")
public class RepWarningServiceImpl implements RepWarningService {
	@Autowired
	private RepWarningMapper mapper;

	public List<RepWarning> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	public List<RepWarning> selectPaging(int start, int end) {
		// TODO Auto-generated method stub
		return null;
	}

	public int selectCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	public int insertBatch(List<RepWarning> list) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteBatch(List<String> field0List) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<Map<String, Object>> getRepWarningCell(Map<String, Object> map) {
		return mapper.getRepWarningCell(map);
	}

	public int getRepWarningCellCount(Map<String, Object> map) {
		return mapper.getRepWarningCellCount(map);
	}

	public List<Map<String, Object>> getRepWarningPhone(Map<String, Object> map) {
		return mapper.getRepWarningPhone(map);
	}

	public int getRepWarningPhoneCount(Map<String, Object> map) {
		return mapper.getRepWarningPhoneCount(map);
	}

	public List<Map<String, String>> getRepWarningBlackDot(Map<String, String> map) {
		return mapper.getRepWarningBlackDot(map);
	}

	public int getRepWarningBlackDotCount(Map<String, String> map) {
		return mapper.getRepWarningBlackDotCount(map);
	}

	public List<Map<String, String>> getRepWarningHotPoint(Map<String, String> map) {
		return mapper.getRepWarningHotPoint(map);
	}

	public int getRepWarningHotPointCount(Map<String, String> map) {
		return mapper.getRepWarningHotPointCount(map);
	}

	public List<Map<String, Object>> getRepWarningDetail(Map<String, Object> paramMap) {
		return mapper.getRepWarningDetail(paramMap);
	}

	public int getRepWarningDetailCount(Map<String, Object> paramMap) {
		return mapper.getRepWarningDetailCount(paramMap);
	}

}
