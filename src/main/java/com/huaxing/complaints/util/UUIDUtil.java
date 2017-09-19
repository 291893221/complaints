package com.huaxing.complaints.util;

import java.util.UUID;

import org.apache.log4j.Logger;

public class UUIDUtil {
	private static Logger logger = Logger.getLogger(UUIDUtil.class);
	public static String getRandomUUID() {
		UUID randomUUID = java.util.UUID.randomUUID();
		String randomUUIDString = randomUUID.toString();
		randomUUIDString = randomUUIDString.replaceAll("-", "");
//		logger.debug(randomUUIDString);
		return randomUUIDString;
	}
}
