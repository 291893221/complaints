package com.huaxing.complaints.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huaxing.complaints.dao.Ori234GCellMapper;
import com.huaxing.complaints.model.Ori234GCell;
import com.huaxing.complaints.service.Ori234GCellService;

@Service("ori234GCellService")
public class Ori234GCellServiceImpl implements Ori234GCellService {
	@Autowired
	private Ori234GCellMapper mapper;

	public List<Ori234GCell> selectPaging(Map<String, Object> paramMap) {
		return mapper.selectPaging(paramMap);
	}

	public int selectCount(Map<String, Object> paramMap) {
		return mapper.selectCount(paramMap);
	}

	public int insertBatch(List<Ori234GCell> list) {
		return mapper.insertBatch(list);
	}

	public int deleteBatch(List<String> field0List) {
		return mapper.deleteBatch(field0List);
	}

}
