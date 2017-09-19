package com.huaxing.complaints.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huaxing.complaints.dao.Ori234GTrafficMapper;
import com.huaxing.complaints.model.Ori234GTraffic;
import com.huaxing.complaints.service.Ori234GTrafficService;

@Service("ori234GTrafficService")
public class Ori234GTrafficServiceImpl implements Ori234GTrafficService {
	@Autowired
	private Ori234GTrafficMapper mapper;

	public List<Ori234GTraffic> selectPaging(Map<String, Object> paramMap) {
		return mapper.selectPaging(paramMap);
	}

	public int selectCount(Map<String, Object> paramMap) {
		return mapper.selectCount(paramMap);
	}

	public int insertBatch(List<Ori234GTraffic> list) {
		return mapper.insertBatch(list);
	}

	public int deleteBatch(List<String> field0List) {
		return mapper.deleteBatch(field0List);
	}

}
