package com.huaxing.complaints.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huaxing.complaints.dao.RepComplaintOrdersMapper;
import com.huaxing.complaints.model.RepComplaintOrders;
import com.huaxing.complaints.service.RepComplaintOrdersService;

@Service("repComplaintOrdersService")
public class RepComplaintOrdersServiceImpl implements RepComplaintOrdersService {
	@Autowired
	private RepComplaintOrdersMapper mapper;

	public List<RepComplaintOrders> selectAll() {
		return mapper.selectAll();
	}

	public List<RepComplaintOrders> selectPaging(int start, int end) {
		return mapper.selectPaging(start, end);
	}

	public int selectCount() {
		return mapper.selectCount();
	}

	public int insertBatch(List<RepComplaintOrders> list) {
		// TODO Auto-generated method stub
		return 0;
	}

	public int deleteBatch(List<String> field0List) {
		// TODO Auto-generated method stub
		return 0;
	}

	public List<RepComplaintOrders> selectPagingDate(Map<String, Object> map) {
		return mapper.selectPagingDate(map);
	}

	public int selectPagingDateCount(Map<String, Object> map) {
		return mapper.selectPagingDateCount(map);
	}

}
