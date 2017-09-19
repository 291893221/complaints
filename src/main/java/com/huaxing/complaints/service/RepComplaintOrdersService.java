package com.huaxing.complaints.service;

import java.util.List;
import java.util.Map;

import com.huaxing.complaints.model.RepComplaintOrders;

public interface RepComplaintOrdersService extends BaseService<RepComplaintOrders>{

	List<RepComplaintOrders> selectPagingDate(Map<String, Object> map);

	int selectPagingDateCount(Map<String, Object> map);

}
