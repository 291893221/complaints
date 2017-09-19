package com.huaxing.complaints.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huaxing.complaints.dao.OriV600MarketMapper;
import com.huaxing.complaints.model.OriV600Market;
import com.huaxing.complaints.service.OriV600MarketService;

@Service("oriV600MarketService")
public class OriV600MarketServiceImpl implements OriV600MarketService {
	@Autowired
	private OriV600MarketMapper mapper;

	public List<OriV600Market> selectPaging(Map<String, Object> paramMap) {
		return mapper.selectPaging(paramMap);
	}

	public int selectCount(Map<String, Object> paramMap) {
		return mapper.selectCount(paramMap);
	}
	
	public int insertBatch(List<OriV600Market> list) {
		return mapper.insertBatch(list);
	}

	public int deleteBatch(List<String> field0List) {
		return mapper.deleteBatch(field0List);
	}

}
