package com.huaxing.complaints.dao;

import java.util.List;
import java.util.Map;

import com.huaxing.complaints.model.RepComplaintOrders;

public interface RepComplaintOrdersMapper extends BaseMapper<RepComplaintOrders> {

	List<RepComplaintOrders> selectPagingDate(Map<String, Object> map);

	int selectPagingDateCount(Map<String, Object> map);
}