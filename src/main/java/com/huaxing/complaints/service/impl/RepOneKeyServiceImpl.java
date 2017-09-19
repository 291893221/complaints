package com.huaxing.complaints.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huaxing.complaints.dao.RepOneKeyMapper;
import com.huaxing.complaints.service.RepOneKeyService;

@Service("repOneKeyService")
public class RepOneKeyServiceImpl implements RepOneKeyService {
	@Autowired
	private RepOneKeyMapper mapper;

	public List<Map<String, String>> selectOneKeyWarning(Map<String, String> map) {
		return mapper.selectOneKeyWarning(map);
	}

	public int selectOneKeyWarningCount(Map<String, String> map) {
		return mapper.selectOneKeyWarningCount(map);
	}

	public List<Map<String, Object>> selectTotal(Map<String, Object> paramMap) {
		return mapper.selectTotal(paramMap);
	}

}
