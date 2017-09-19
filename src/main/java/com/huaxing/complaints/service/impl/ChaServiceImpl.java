package com.huaxing.complaints.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huaxing.complaints.dao.ChaMapper;
import com.huaxing.complaints.service.ChaService;

@Service("chaService")
public class ChaServiceImpl implements ChaService {
	@Autowired
	private ChaMapper mapper;
	public List<Map<String, Object>> getChaXMonth() {
		List<Map<String, Object>> list = mapper.getChaXMonth();
		List<Map<String, Object>> returnList = new ArrayList<Map<String,Object>>(); 
		if (null == list || list.size() == 0 ) {
			return returnList;
		}
		Map<String, Object> tempMap = new HashMap<String, Object>();
		for (Map<String, Object> map : list) {
			Object ym = map.get("YM");
			Object cnt = map.get("CNT");
			tempMap = new HashMap<String, Object>();
			tempMap.put(ym.toString(), cnt);
			returnList.add(tempMap);
		}
		return returnList;
	}

}
