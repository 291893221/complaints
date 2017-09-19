package com.huaxing.complaints.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huaxing.complaints.dao.OriNPSCustomerMapper;
import com.huaxing.complaints.model.OriNPSCustomer;
import com.huaxing.complaints.service.OriNPSCustomerService;

@Service("oriNPSCustomerService")
public class OriNPSCustomerServiceImpl implements OriNPSCustomerService {
	@Autowired
	private OriNPSCustomerMapper mapper;

	public List<OriNPSCustomer> selectPaging(Map<String, Object> paramMap) {
		return mapper.selectPaging(paramMap);
	}

	public int selectCount(Map<String, Object> paramMap) {
		return mapper.selectCount(paramMap);
	}
	
	public int insertBatch(List<OriNPSCustomer> list) {
		return mapper.insertBatch(list);
	}
	
	public int deleteBatch(List<String> field0List) {
		return mapper.deleteBatch(field0List);
	}

}
