package com.huaxing.complaints.util;

import java.util.HashMap;
import java.util.Map;

public class ParamUtil {
	public static void main(String[] args) throws Exception {
		String params = "search1=1a=b=c°¡&search2=&search3=2016-02-01";
		getParamMap(params );
	}
	public static Map<String, Object> getParamMap(String params) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		if (null == params || "".equals(params)) {
			return paramMap;
		}
		String[] kvArr = params.split("&");
		for (int i = 0; i < kvArr.length; i++) {
			String kvStr = kvArr[i];
			int beginIndex = 0;
			int middleIndex = kvStr.indexOf("=");
			if (middleIndex <= 0) {
				continue;
			}
			int endIndex = kvStr.length();
			String key = kvStr.substring(beginIndex, middleIndex);
			String value = kvStr.substring(middleIndex+1, endIndex);
			value = java.net.URLDecoder.decode(value,"UTF-8"); 
			if (null != key && !"".equals(key) && null != value && !"".equals(value)) {
				paramMap.put(key, value);
			}
			System.out.println(key + " = " + value);
		}
//		System.out.println(paramMap.size());
		return paramMap;
	}
}
