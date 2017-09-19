package com.huaxing.complaints.service;

import java.util.List;

public interface BaseService<T> {
	
	public List<T> selectAll();
	
	public List<T> selectPaging(int start,int end);
	
	public int selectCount();
	
	public int insertBatch(List<T> list);
	
	public int deleteBatch(List<String> field0List);
}
