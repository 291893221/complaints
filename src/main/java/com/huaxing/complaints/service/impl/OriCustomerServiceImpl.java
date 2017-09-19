package com.huaxing.complaints.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huaxing.complaints.dao.OriCustomerMapper;
import com.huaxing.complaints.model.OriCustomer;
import com.huaxing.complaints.service.OriCustomerService;

@Service("oriCustomerService")
public class OriCustomerServiceImpl implements OriCustomerService {
	@Autowired
	private OriCustomerMapper mapper;

	public List<OriCustomer> selectPaging(Map<String, Object> paramMap) {
		return mapper.selectPaging(paramMap);
	}

	public int selectCount(Map<String, Object> paramMap) {
		return mapper.selectCount(paramMap);
	}
	
	public int insertBatch(List<OriCustomer> list) {
		return mapper.insertBatch(list);
	}

	public int deleteBatch(List<String> field0List) {
		return mapper.deleteBatch(field0List);
	}

}
