package com.huaxing.complaints.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huaxing.complaints.dao.OriBlackDotLibraryMapper;
import com.huaxing.complaints.model.OriBlackDotLibrary;
import com.huaxing.complaints.service.OriBlackDotLibraryService;

@Service("oriBlackDotLibraryService")
public class OriBlackDotLibraryServiceImpl implements OriBlackDotLibraryService {
	@Autowired
	private OriBlackDotLibraryMapper mapper;
	
	public List<OriBlackDotLibrary> selectPaging(Map<String, Object> paramMap) {
		return mapper.selectPaging(paramMap);
	}

	public int selectCount(Map<String, Object> paramMap) {
		return mapper.selectCount(paramMap);
	}
	
	public int insertBatch(List<OriBlackDotLibrary> list) {
		return mapper.insertBatch(list);
	}

	public int deleteBatch(List<String> field0List) {
		return mapper.deleteBatch(field0List);
	}
}
