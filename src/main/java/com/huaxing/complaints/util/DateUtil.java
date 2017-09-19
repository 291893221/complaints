package com.huaxing.complaints.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class DateUtil {
	private static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");

	public static String getCurrentDate() {
		return DateFormat.getDateInstance(DateFormat.MEDIUM).format(new Date());
	}
	
	public static boolean checkDate(String start, String end) {
		try {
			Date startDate = df.parse(start);
			Date endDate = df.parse(end);
			boolean b = startDate.before(endDate);
			return b;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public static String getLastPeriodStart(String start, String end) {
		try {
			Date startDate = df.parse(start);
			Date endDate = df.parse(end);

			Calendar startCal = Calendar.getInstance();
			startCal.setTime(startDate);

			Calendar endCal = Calendar.getInstance();
			endCal.setTime(endDate);

			long startMillis = startCal.getTimeInMillis();
			long endMillis = endCal.getTimeInMillis();

			long ei = endMillis - startMillis;
			int days = (int) (ei / (1000 * 60 * 60 * 24)) +1;

			// 返回值
			Calendar retCal = Calendar.getInstance();
			retCal.setTime(startDate);
			retCal.add(Calendar.DATE, -1 * days);
			String retStr = df.format(retCal.getTime());
			return retStr;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String getLastPeriodEnd(String end) {
		try {
			Date startDate = df.parse(end);
			Calendar retCal = Calendar.getInstance();
			retCal.setTime(startDate);
			retCal.add(Calendar.DATE, -1);
			String retStr = df.format(retCal.getTime());
			return retStr;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String getLastYearLastPeriodStart(String start, String end) {
		try {
			String lastPeriodStart = getLastPeriodStart(start, end);
			Date retDate = df.parse(lastPeriodStart);
			Calendar retCal = Calendar.getInstance();
			retCal.setTime(retDate);
			retCal.add(Calendar.YEAR, -1);
			String retStr = df.format(retCal.getTime());
			return retStr;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String getLastYearLastPeriodEnd(String end) {
		try {
			String lastPeriodEnd = getLastPeriodEnd(end);
			Date retDate = df.parse(lastPeriodEnd);
			Calendar retCal = Calendar.getInstance();
			retCal.setTime(retDate);
			retCal.add(Calendar.YEAR, -1);
			String retStr = df.format(retCal.getTime());
			return retStr;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String getLastYearThisPeriodEnd(String end) {
		return getLastYearThisPeriodStart(end);
	}
	
	public static String getLastYearThisPeriodStart(String start) {
		try {
			Date startDate = df.parse(start);
			Calendar retCal = Calendar.getInstance();
			retCal.setTime(startDate);
			retCal.add(Calendar.YEAR, -1);
			String retStr = df.format(retCal.getTime());
			return retStr;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	public static String getBeforeLastWeekSunday() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		cal.add(Calendar.DATE, -2 * 7);
		String thisWeekSunday = df.format(cal.getTime());
		return thisWeekSunday;
	}
	
	public static String getLastWeekSunday() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		cal.add(Calendar.DATE, -1 * 7);
		String thisWeekSunday = df.format(cal.getTime());
		return thisWeekSunday;
	}

	public static String getBeforeLastWeekSaturday() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
		cal.add(Calendar.DATE, -2 * 7);
		String thisWeekSunday = df.format(cal.getTime());
		return thisWeekSunday;
	}
	
	public static String getLastWeekSaturday() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
		cal.add(Calendar.DATE, -1 * 7);
		String thisWeekSunday = df.format(cal.getTime());
		return thisWeekSunday;
	}

	public static String getThisWeekSunday() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		String thisWeekSunday = df.format(cal.getTime());
		return thisWeekSunday;
	}

	public static String getThisWeekSaturday() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
		String thisWeekSunday = df.format(cal.getTime());
		return thisWeekSunday;
	}
	
	public static String getBeforeLastYearLastWeekSunday() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		cal.add(Calendar.YEAR,-1);
		cal.add(Calendar.DATE, -2 * 7);
		String thisWeekSunday = df.format(cal.getTime());
		return thisWeekSunday;
	}
	
	public static String getLastYearLastWeekSunday() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		cal.add(Calendar.YEAR,-1);
		cal.add(Calendar.DATE, -1 * 7);
		String thisWeekSunday = df.format(cal.getTime());
		return thisWeekSunday;
	}

	public static String getBeforeLastYearLastWeekSaturday() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
		cal.add(Calendar.YEAR,-1);
		cal.add(Calendar.DATE, -2 * 7);
		String thisWeekSunday = df.format(cal.getTime());
		return thisWeekSunday;
	}
	
	public static String getLastYearLastWeekSaturday() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
		cal.add(Calendar.YEAR,-1);
		cal.add(Calendar.DATE, -1 * 7);
		String thisWeekSunday = df.format(cal.getTime());
		return thisWeekSunday;
	}
	
	public static String getLastYearThisWeekSunday() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		cal.add(Calendar.YEAR,-1);
		String thisWeekSunday = df.format(cal.getTime());
		return thisWeekSunday;
	}

	public static String getLastYearThisWeekSaturday() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_WEEK, Calendar.SATURDAY);
		cal.add(Calendar.YEAR,-1);
		String thisWeekSunday = df.format(cal.getTime());
		return thisWeekSunday;
	}
	
	public static String getLastYearBeforeLastMonth31() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH, 1);
		cal.add(Calendar.MONTH, -1);
		cal.add(Calendar.DATE, -1);
		cal.add(Calendar.YEAR,-1);
		String day = df.format(cal.getTime());
		return day;
	}
	
	public static String getLastYearBeforeLastMonth01() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH, 1);
		cal.add(Calendar.MONTH, -2);
		cal.add(Calendar.YEAR,-1);
		String day = df.format(cal.getTime());
		return day;
	}
	
	public static String getBeforeLastMonth01() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH, 1);
		cal.add(Calendar.MONTH, -2);
		String day = df.format(cal.getTime());
		return day;
	}
	
	public static String getBeforeLastMonth31() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH, 1);
		cal.add(Calendar.MONTH, -1);
		cal.add(Calendar.DATE, -1);
		String day = df.format(cal.getTime());
		return day;
	}
	
	public static String getLastMonth31() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH, 1);
		cal.add(Calendar.DATE, -1);
		String day = df.format(cal.getTime());
		return day;
	}
	
	public static String getTheMonth31(String start) throws ParseException {
		Date startDate = df.parse(start);
		Calendar retCal = Calendar.getInstance();
		retCal.setTime(startDate);
		retCal.set(Calendar.DAY_OF_MONTH, retCal.getActualMaximum(Calendar.DAY_OF_MONTH));  
		String retStr = df.format(retCal.getTime());
		return retStr;
	}
	
	public static String getLastMonth01() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH, 1);
		cal.add(Calendar.MONTH, -1);
		String day = df.format(cal.getTime());
		return day;
	}
	
	public static String getLastYearLastMonth01() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH, 1);
		cal.add(Calendar.MONTH, -1);
		cal.add(Calendar.YEAR, -1);
		String day = df.format(cal.getTime());
		return day;
	}

	public static String getLastYearLastMonth31() {
		Calendar cal = Calendar.getInstance();
		cal.set(Calendar.DAY_OF_MONTH, 1);
		cal.add(Calendar.DATE, -1);
		cal.add(Calendar.YEAR, -1);
		String day = df.format(cal.getTime());
		return day;
	}
	
	public static Map<String, String> getMonthPeriod() {
		String startDate1, endDate1, startDate2, endDate2, startDate3, endDate3, startDate4, endDate4;
		// 今年上上月
		startDate1 = DateUtil.getBeforeLastMonth01();
		endDate1 = DateUtil.getBeforeLastMonth31();
		// 今年上月
		startDate2 = DateUtil.getLastMonth01();
		endDate2 = DateUtil.getLastMonth31();
		// 去年上上月
		startDate3 = DateUtil.getLastYearBeforeLastMonth01();
		endDate3 = DateUtil.getLastYearBeforeLastMonth31();
		// 去年上月
		startDate4 = DateUtil.getLastYearLastMonth01();
		endDate4 = DateUtil.getLastYearLastMonth31();
		
//		printDate(startDate1, endDate1, startDate2, endDate2, startDate3, endDate3, startDate4, endDate4);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("startDate1", startDate1);
		map.put("endDate1", endDate1);
		map.put("startDate2", startDate2);
		map.put("endDate2", endDate2);
		map.put("startDate3", startDate3);
		map.put("endDate3", endDate3);
		map.put("startDate4", startDate4);
		map.put("endDate4", endDate4);
		return map;
	}

	public static void printDate(String startDate1, String endDate1, String startDate2, String endDate2, String startDate3, String endDate3, String startDate4, String endDate4) {
		System.out.println("===========================================================");
		System.out.print("今年上期 \t \t");
		System.out.print("今年本期 \t \t");
		System.out.print("去年上期 \t \t");
		System.out.println("去年本期 \t \t");
		System.out.print(startDate1 + "\t");
		System.out.print(startDate2 + "\t");
		System.out.print(startDate3 + "\t");
		System.out.println(startDate4 + "\t");
		System.out.print(endDate1 + "\t");
		System.out.print(endDate2 + "\t");
		System.out.print(endDate3 + "\t");
		System.out.println(endDate4 + "\t");
		System.out.println("===========================================================");
	}
	
	public static Map<String, String> getLastDateMap() {
		String startDate1, endDate1, startDate2, endDate2, startDate3, endDate3, startDate4, endDate4;
		// 今年上上周
		startDate1 = DateUtil.getBeforeLastWeekSunday();
		endDate1 = DateUtil.getBeforeLastWeekSaturday();
		// 今年上周
		startDate2 = DateUtil.getLastWeekSunday();
		endDate2 = DateUtil.getLastWeekSaturday();
		// 去年上上周
		startDate3 = DateUtil.getBeforeLastYearLastWeekSunday();
		endDate3 = DateUtil.getBeforeLastYearLastWeekSaturday();
		// 去年上周
		startDate4 = DateUtil.getLastYearLastWeekSunday();
		endDate4 = DateUtil.getLastYearLastWeekSaturday();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("startDate1", startDate1);
		map.put("endDate1", endDate1);
		map.put("startDate2", startDate2);
		map.put("endDate2", endDate2);
		map.put("startDate3", startDate3);
		map.put("endDate3", endDate3);
		map.put("startDate4", startDate4);
		map.put("endDate4", endDate4);
		return map;
	}
	
	public static Map<String, String> getDateMap() {
		String startDate1, endDate1, startDate2, endDate2, startDate3, endDate3, startDate4, endDate4;
		// 今年上周
		startDate1 = DateUtil.getLastWeekSunday();
		endDate1 = DateUtil.getLastWeekSaturday();
		// 今年本周
		startDate2 = DateUtil.getThisWeekSunday();
		endDate2 = DateUtil.getThisWeekSaturday();
		// 去年上周
		startDate3 = DateUtil.getLastYearLastWeekSunday();
		endDate3 = DateUtil.getLastYearLastWeekSaturday();
		// 去年本周
		startDate4 = DateUtil.getLastYearThisWeekSunday();
		endDate4 = DateUtil.getLastYearThisWeekSaturday();
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("startDate1", startDate1);
		map.put("endDate1", endDate1);
		map.put("startDate2", startDate2);
		map.put("endDate2", endDate2);
		map.put("startDate3", startDate3);
		map.put("endDate3", endDate3);
		map.put("startDate4", startDate4);
		map.put("endDate4", endDate4);
		return map;
	}

	public static Map<String, Object> getDateMap(Map<String, Object> paramMap) {
		Object startDateObj = paramMap.get("startDate");
		Object endDateObj = paramMap.get("endDate");

		if (startDateObj == null || startDateObj.toString() == null || "".equals(startDateObj.toString()) || endDateObj == null || endDateObj.toString() == null || "".equals(endDateObj.toString())) {
			startDateObj = paramMap.get("start");
			endDateObj = paramMap.get("end");
		}
		if (startDateObj == null || startDateObj.toString() == null || "".equals(startDateObj.toString()) || endDateObj == null || endDateObj.toString() == null || "".equals(endDateObj.toString())) {
			return getDateMapN(paramMap);
		} else {
			String start = startDateObj.toString();
			String end = endDateObj.toString();
			
			String startDate1, endDate1, startDate2, endDate2, startDate3, endDate3, startDate4, endDate4;
			// 今年上期
			startDate1 = DateUtil.getLastPeriodStart(start, end);
			endDate1 = DateUtil.getLastPeriodEnd(start);
			// 今年本期
			startDate2 = start;
			endDate2 = end;
			// 去年上期
			startDate3 = DateUtil.getLastYearLastPeriodStart(start, end);
			endDate3 = DateUtil.getLastYearLastPeriodEnd(start);
			// 去年本期
			startDate4 = DateUtil.getLastYearThisPeriodStart(start);
			endDate4 = DateUtil.getLastYearThisPeriodEnd(end);

			printDate(startDate1, endDate1, startDate2, endDate2, startDate3, endDate3, startDate4, endDate4);
			
			paramMap.put("startDate1", startDate1);
			paramMap.put("endDate1", endDate1);
			paramMap.put("startDate2", startDate2);
			paramMap.put("endDate2", endDate2);
			paramMap.put("startDate3", startDate3);
			paramMap.put("endDate3", endDate3);
			paramMap.put("startDate4", startDate4);
			paramMap.put("endDate4", endDate4);
		}
		
		return paramMap;
	}

	public static Map<String, Object> getDateMapN(Map<String, Object> paramMap) {
		String startDate1, endDate1, startDate2, endDate2, startDate3, endDate3, startDate4, endDate4;
		// 今年上上周
		startDate1 = DateUtil.getBeforeLastWeekSunday();
		endDate1 = DateUtil.getBeforeLastWeekSaturday();
		// 今年上周
		startDate2 = DateUtil.getLastWeekSunday();
		endDate2 = DateUtil.getLastWeekSaturday();
		// 去年上上周
		startDate3 = DateUtil.getBeforeLastYearLastWeekSunday();
		endDate3 = DateUtil.getBeforeLastYearLastWeekSaturday();
		// 去年上周
		startDate4 = DateUtil.getLastYearLastWeekSunday();
		endDate4 = DateUtil.getLastYearLastWeekSaturday();
		
//		printDate(startDate1, endDate1, startDate2, endDate2, startDate3, endDate3, startDate4, endDate4);
		
		paramMap.put("startDate1", startDate1);
		paramMap.put("endDate1", endDate1);
		paramMap.put("startDate2", startDate2);
		paramMap.put("endDate2", endDate2);
		paramMap.put("startDate3", startDate3);
		paramMap.put("endDate3", endDate3);
		paramMap.put("startDate4", startDate4);
		paramMap.put("endDate4", endDate4);
		return paramMap;
	}
	
	public static String getLastMonth(String start) throws Exception {
		Date startDate = df.parse(start);
		Calendar retCal = Calendar.getInstance();
		retCal.setTime(startDate);
		retCal.add(Calendar.MONTH, -1);
		String retStr = df.format(retCal.getTime());
		return retStr;
	}
	
	public static String getLastYearLastMonth(String start) throws Exception {
		Date startDate = df.parse(start);
		Calendar retCal = Calendar.getInstance();
		retCal.setTime(startDate);
		retCal.add(Calendar.MONTH, -1);
		retCal.add(Calendar.YEAR, -1);
		String retStr = df.format(retCal.getTime());
		return retStr;
	}
	
	public static String getLastYear(String start) throws Exception {
		Date startDate = df.parse(start);
		Calendar retCal = Calendar.getInstance();
		retCal.setTime(startDate);
		retCal.add(Calendar.YEAR, -1);
		String retStr = df.format(retCal.getTime());
		return retStr;
	}
	
	public static Map<String, Object> getMonthPeriod(Map<String, Object> paramMap) throws Exception {
		Object startDateObj = paramMap.get("startDate");
		Object endDateObj = paramMap.get("endDate");
		
//		System.out.println(startDateObj);
//		System.out.println(endDateObj);
		
		String startDate1 = null, endDate1 = null, startDate2 = null, endDate2 = null, startDate3 = null, endDate3 = null, startDate4 = null, endDate4 = null;
		if (startDateObj == null || startDateObj.toString() == null || "".equals(startDateObj.toString()) || endDateObj == null || endDateObj.toString() == null || "".equals(endDateObj.toString())) {
			// 今年上上月
			startDate1 = DateUtil.getBeforeLastMonth01();
			endDate1 = DateUtil.getBeforeLastMonth31();
			// 今年上月
			startDate2 = DateUtil.getLastMonth01();
			endDate2 = DateUtil.getLastMonth31();
			// 去年上上月
			startDate3 = DateUtil.getLastYearBeforeLastMonth01();
			endDate3 = DateUtil.getLastYearBeforeLastMonth31();
			// 去年上月
			startDate4 = DateUtil.getLastYearLastMonth01();
			endDate4 = DateUtil.getLastYearLastMonth31();
			
		} else {
			// 今年上上月
			startDate1 = DateUtil.getLastMonth(startDateObj.toString());
			endDate1 = DateUtil.getLastMonth(endDateObj.toString());
			// 今年上月
			startDate2 = startDateObj.toString();
			endDate2 = endDateObj.toString();
			// 去年上上月
			startDate3 = DateUtil.getLastYearLastMonth(startDate2);
			endDate3 = DateUtil.getLastYearLastMonth(endDate2);
			// 去年上月
			startDate4 = DateUtil.getLastYear(startDate2);
			endDate4 = DateUtil.getLastYear(endDate2);
		}
		
		printDate(startDate1, endDate1, startDate2, endDate2, startDate3, endDate3, startDate4, endDate4);
		
		paramMap.put("startDate1", startDate1);
		paramMap.put("endDate1", endDate1);
		paramMap.put("startDate2", startDate2);
		paramMap.put("endDate2", endDate2);
		paramMap.put("startDate3", startDate3);
		paramMap.put("endDate3", endDate3);
		paramMap.put("startDate4", startDate4);
		paramMap.put("endDate4", endDate4);
		return paramMap;
	}

	public static Map<String, Object> getOneKeyMonthCause(Map<String, Object> paramMap) throws Exception {
		Object startDateObj = paramMap.get("startDate");
		Object endDateObj = paramMap.get("endDate");
		
		String startDate1 = null, endDate1 = null, startDate2 = null, endDate2 = null, startDate3 = null, endDate3 = null, startDate4 = null, endDate4 = null;
		if (startDateObj == null || startDateObj.toString() == null || "".equals(startDateObj.toString()) || endDateObj == null || endDateObj.toString() == null || "".equals(endDateObj.toString())) {
			// 今年上上月
			startDate1 = DateUtil.getBeforeLastMonth01();
			endDate1 = DateUtil.getBeforeLastMonth31();
			// 今年上月
			startDate2 = DateUtil.getLastMonth01();
			endDate2 = DateUtil.getLastMonth31();
			// 去年上上月
			startDate3 = DateUtil.getLastYearBeforeLastMonth01();
			endDate3 = DateUtil.getLastYearBeforeLastMonth31();
			// 去年上月
			startDate4 = DateUtil.getLastYearLastMonth01();
			endDate4 = DateUtil.getLastYearLastMonth31();
			
		} else {
			// 今年上上月
			startDate1 = DateUtil.getLastMonth(startDateObj.toString());
			endDate1 = DateUtil.getLastMonth(endDateObj.toString());
			// 今年上月
			startDate2 = startDateObj.toString();
			endDate2 = endDateObj.toString();
			// 去年上上月
			startDate3 = DateUtil.getLastYearLastMonth(startDate2);
			endDate3 = DateUtil.getLastYearLastMonth(endDate2);
			// 去年上月
			startDate4 = DateUtil.getLastYear(startDate2);
			endDate4 = DateUtil.getLastYear(endDate2);
		}
		
		printDate(startDate1, endDate1, startDate2, endDate2, startDate3, endDate3, startDate4, endDate4);
		
		paramMap.put("startDate1", startDate1);
		paramMap.put("endDate1", endDate1);
		paramMap.put("startDate2", startDate2);
		paramMap.put("endDate2", endDate2);
		paramMap.put("startDate3", startDate3);
		paramMap.put("endDate3", endDate3);
		paramMap.put("startDate4", startDate4);
		paramMap.put("endDate4", endDate4);
		return paramMap;
	}

	public static Map<String, Object> getOneKeyMonth(Map<String, Object> paramMap) throws Exception {
		if (null == paramMap) {
			paramMap = new HashMap<String, Object>();
		}
		
		Object yObj = paramMap.get("y");
		Object mObj = paramMap.get("m");
		
		if (yObj == null || yObj.toString() == null || "".equals(yObj.toString()) || mObj == null || mObj.toString() == null || "".equals(mObj.toString())) {
			return getOneKeyMonthPeriod(paramMap);
		} else {
			String y = yObj.toString();
			String m = mObj.toString();
			
			String start = y + "-" + m + "-01";
			start = getFormatDate(start);
			String end = getLastDayInTheMonth(start);
			
			paramMap.put("startDate", start);
			paramMap.put("endDate", end);
			return getOneKeyMonthPeriod(paramMap);
		}
	}
	
	public static Map<String, Object> getOneKeyMonthPeriod(Map<String, Object> paramMap) throws Exception {
		Object startDateObj = paramMap.get("startDate");
		Object endDateObj = paramMap.get("endDate");
		
//		System.out.println(startDateObj);
//		System.out.println(endDateObj);
		
		String startDate1 = null, endDate1 = null, startDate2 = null, endDate2 = null, startDate3 = null, endDate3 = null, startDate4 = null, endDate4 = null;
		if (startDateObj == null || startDateObj.toString() == null || "".equals(startDateObj.toString()) || endDateObj == null || endDateObj.toString() == null || "".equals(endDateObj.toString())) {
			// 今年上上月
			startDate1 = DateUtil.getBeforeLastMonth01();
			endDate1 = DateUtil.getBeforeLastMonth31();
			// 今年上月
			startDate2 = DateUtil.getLastMonth01();
			endDate2 = DateUtil.getLastMonth31();
			// 去年上上月
			startDate3 = DateUtil.getLastYearBeforeLastMonth01();
			endDate3 = DateUtil.getLastYearBeforeLastMonth31();
			// 去年上月
			startDate4 = DateUtil.getLastYearLastMonth01();
			endDate4 = DateUtil.getLastYearLastMonth31();
			
		} else {
			// 今年上上月
			startDate1 = DateUtil.getLastMonth(startDateObj.toString());
			endDate1 = DateUtil.getTheMonth31(startDate1);
			// 今年上月
			startDate2 = startDateObj.toString();
			endDate2 = endDateObj.toString();
			// 去年上上月
			startDate3 = DateUtil.getLastYearLastMonth(startDate2);
			endDate3 = DateUtil.getTheMonth31(startDate3);
			// 去年上月
			startDate4 = DateUtil.getLastYear(startDate2);
			endDate4 = DateUtil.getTheMonth31(startDate4);
		}
		
		printDate(startDate1, endDate1, startDate2, endDate2, startDate3, endDate3, startDate4, endDate4);
		
		paramMap.put("startDate1", startDate1);
		paramMap.put("endDate1", endDate1);
		paramMap.put("startDate2", startDate2);
		paramMap.put("endDate2", endDate2);
		paramMap.put("startDate3", startDate3);
		paramMap.put("endDate3", endDate3);
		paramMap.put("startDate4", startDate4);
		paramMap.put("endDate4", endDate4);
		return paramMap;
	}
	
	public static String getFormatDate(String start) throws Exception {
		Date startDate = df.parse(start);
		String retStr = df.format(startDate);
		return retStr;
	}
	
	public static String getLastDayInTheMonth(String start) throws Exception {
		Date startDate = df.parse(start);
		Calendar retCal = Calendar.getInstance();
		retCal.setTime(startDate);
		retCal.add(Calendar.MONTH, 1);
		retCal.add(Calendar.DATE, -1);
		String retStr = df.format(retCal.getTime());
		return retStr;
	}
	
	public static Map<String, String> getMonthPeriod(String start, String end) {
		
//		System.out.println(start);
//		System.out.println(end);
		
		if (null == start || "".equals(start) || null == end || "".equals(end)) {
			return getMonthPeriod();
		}
		String startDate1, endDate1, startDate2, endDate2, startDate3, endDate3, startDate4, endDate4;
		// 今年上期
		startDate1 = DateUtil.getLastPeriodStart(start, end);
		endDate1 = DateUtil.getLastPeriodEnd(start);
		// 今年本期
		startDate2 = start;
		endDate2 = end;
		// 去年上期
		startDate3 = DateUtil.getLastYearLastPeriodStart(start, end);
		endDate3 = DateUtil.getLastYearLastPeriodEnd(start);
		// 去年本期
		startDate4 = DateUtil.getLastYearThisPeriodStart(start);
		endDate4 = DateUtil.getLastYearThisPeriodEnd(end);

		printDate(startDate1, endDate1, startDate2, endDate2, startDate3, endDate3, startDate4, endDate4);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("startDate1", startDate1);
		map.put("endDate1", endDate1);
		map.put("startDate2", startDate2);
		map.put("endDate2", endDate2);
		map.put("startDate3", startDate3);
		map.put("endDate3", endDate3);
		map.put("startDate4", startDate4);
		map.put("endDate4", endDate4);
		return map;
	}
	
	public static Map<String, String> getDateMap(String start, String end) {
		if (null == start || "".equals(start) || null == end || "".equals(end)) {
			return getLastDateMap();
		}
		String startDate1, endDate1, startDate2, endDate2, startDate3, endDate3, startDate4, endDate4;
		// 今年上期
		startDate1 = DateUtil.getLastPeriodStart(start, end);
		endDate1 = DateUtil.getLastPeriodEnd(start);
		// 今年本期
		startDate2 = start;
		endDate2 = end;
		// 去年上期
		startDate3 = DateUtil.getLastYearLastPeriodStart(start, end);
		endDate3 = DateUtil.getLastYearLastPeriodEnd(start);
		// 去年本期
		startDate4 = DateUtil.getLastYearThisPeriodStart(start);
		endDate4 = DateUtil.getLastYearThisPeriodEnd(end);

		Map<String, String> map = new HashMap<String, String>();
		map.put("startDate1", startDate1);
		map.put("endDate1", endDate1);
		map.put("startDate2", startDate2);
		map.put("endDate2", endDate2);
		map.put("startDate3", startDate3);
		map.put("endDate3", endDate3);
		map.put("startDate4", startDate4);
		map.put("endDate4", endDate4);
		return map;
	}

	public static Map<String, Object> getOneKeyWeek(Map<String, Object> map) throws Exception {
		if (null == map) {
			map = new HashMap<String, Object>();
		}
		
		Object startObject = map.get("start");
		Object endObject = map.get("end");
		
		String startDate1, endDate1, startDate2, endDate2, startDate3, endDate3, startDate4, endDate4;
		if (startObject == null || startObject.toString() == null || "".equals(startObject.toString()) || endObject == null || endObject.toString() == null || "".equals(endObject.toString())) {
			// 今年上上周
			startDate1 = DateUtil.getBeforeLastWeekSunday();
			endDate1 = DateUtil.getBeforeLastWeekSaturday();
			// 今年上周
			startDate2 = DateUtil.getLastWeekSunday();
			endDate2 = DateUtil.getLastWeekSaturday();
			// 去年上上周
			startDate3 = DateUtil.getBeforeLastYearLastWeekSunday();
			endDate3 = DateUtil.getBeforeLastYearLastWeekSaturday();
			// 去年上周
			startDate4 = DateUtil.getLastYearLastWeekSunday();
			endDate4 = DateUtil.getLastYearLastWeekSaturday();
			
		} else {
			String start, end;
			start = startObject.toString();
			end = endObject.toString();
			// 今年上期
			startDate1 = DateUtil.getLastPeriodStart(start, end);
			endDate1 = DateUtil.getLastPeriodEnd(start);
			// 今年本期
			startDate2 = start;
			endDate2 = end;
			// 去年上期
			startDate3 = DateUtil.getLastYearLastPeriodStart(start, end);
			endDate3 = DateUtil.getLastYearLastPeriodEnd(start);
			// 去年本期
			startDate4 = DateUtil.getLastYearThisPeriodStart(start);
			endDate4 = DateUtil.getLastYearThisPeriodEnd(end);
		}
		
		printDate(startDate1, endDate1, startDate2, endDate2, startDate3, endDate3, startDate4, endDate4);
		
		map.put("startDate1", startDate1);
		map.put("endDate1", endDate1);
		map.put("startDate2", startDate2);
		map.put("endDate2", endDate2);
		map.put("startDate3", startDate3);
		map.put("endDate3", endDate3);
		map.put("startDate4", startDate4);
		map.put("endDate4", endDate4);
		return map;
	}
	
	public static Map<String, String> getDateMapOnePeriod(String start, String end) {
		if (null == start || "".equals(start) || null == end || "".equals(end)) {
			return getDateMapOnePeriod();
		}

		Map<String, String> map = new HashMap<String, String>();
		map.put("start", start);
		map.put("end", end);
		return map;
	}

	private static Map<String, String> getDateMapOnePeriod() {
		Map<String, String> map = new HashMap<String, String>();
		map.put("start", DateUtil.getThisWeekSunday());
		map.put("end", DateUtil.getThisWeekSaturday());
		return map;
	}
	
	public static Map<String, Object> getDateMapMonthPeriod(Map<String, Object> paramMap) {
		Object startDateObj = paramMap.get("startDate");
		Object endDateObj = paramMap.get("endDate");

		if (startDateObj == null || startDateObj.toString() == null || "".equals(startDateObj.toString()) || endDateObj == null || endDateObj.toString() == null || "".equals(endDateObj.toString())) {
			startDateObj = paramMap.get("start");
			endDateObj = paramMap.get("end");
		}
		
		
		String startDate1, endDate1, startDate2, endDate2;
		
		if (startDateObj == null || startDateObj.toString() == null || "".equals(startDateObj.toString()) || endDateObj == null || endDateObj.toString() == null || "".equals(endDateObj.toString())) {
			// 本月本周
			startDate1 = DateUtil.getThisWeekSunday();
			endDate1 = DateUtil.getThisWeekSaturday();

			// 上月本周
			startDate2 = DateUtil.getLastMonthDate(startDate1);
			endDate2 = DateUtil.getLastMonthDate(endDate1);

			
			
		} else {
			// 本月本周
			startDate1 = startDateObj.toString();
			endDate1 = endDateObj.toString();

			// 上月本周
			startDate2 = DateUtil.getLastMonthDate(startDate1);
			endDate2 = DateUtil.getLastMonthDate(endDate1);
			
		}
		
		System.out.println(startDate1 + "   "+endDate1);
		System.out.println(startDate2 + "   "+endDate2);
		
		paramMap.put("startDate1", startDate1);
		paramMap.put("endDate1", endDate1);
		paramMap.put("startDate2", startDate2);
		paramMap.put("endDate2", endDate2);
		
		return paramMap;
	}
	
	public static Map<String, String> getDateMapMonthPeriod(String start, String end) {
		if (null == start || "".equals(start) || null == end || "".equals(end)) {
			return getDateMapMonthPeriod();
		}

		String startDate1, endDate1, startDate2, endDate2;
		// 本月本周
		startDate1 = start;
		endDate1 = end;

		// 上月本周
		startDate2 = DateUtil.getLastMonthDate(startDate1);
		endDate2 = DateUtil.getLastMonthDate(endDate1);
		
		System.out.println(startDate1 + "   "+endDate1);
		System.out.println(startDate2 + "   "+endDate2);

		Map<String, String> map = new HashMap<String, String>();
		map.put("startDate1", startDate1);
		map.put("endDate1", endDate1);
		map.put("startDate2", startDate2);
		map.put("endDate2", endDate2);
		return map;
	}
	
	private static Map<String, String> getDateMapMonthPeriod() {
		String startDate1, endDate1, startDate2, endDate2;
		// 本月本周
		startDate1 = DateUtil.getThisWeekSunday();
		endDate1 = DateUtil.getThisWeekSaturday();

		// 上月本周
		startDate2 = DateUtil.getLastMonthDate(startDate1);
		endDate2 = DateUtil.getLastMonthDate(endDate1);

		System.out.println(startDate1 + "   "+endDate1);
		System.out.println(startDate2 + "   "+endDate2);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("startDate1", startDate1);
		map.put("endDate1", endDate1);
		map.put("startDate2", startDate2);
		map.put("endDate2", endDate2);
		return map;
	}

	private static String getLastMonthDate(String date) {
		try {
			Date startDate = df.parse(date);
			Calendar retCal = Calendar.getInstance();
			retCal.setTime(startDate);
			retCal.add(Calendar.MONTH,-1);
			String retStr = df.format(retCal.getTime());
			return retStr;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

	public static Map<String, String> getDatePeriod(String start, String end) {
		Map<String, String> map = new HashMap<String, String>();
		if (null == start || "".equals(start) || null == end || "".equals(end)) {
			return map;
		}
		map.put("startDate1", start);
		map.put("endDate1", end);
		return map;
	}
	
	public static Map<String, Object> getDatePeriod(Map<String, Object> paramMap) {
		if (paramMap == null) {
			paramMap = new HashMap<String, Object>();
			return paramMap;
		}
		
		Object startObject = paramMap.get("start");
		Object endObject = paramMap.get("end");
		if (null == startObject || "".equals(startObject) || null == endObject || "".equals(endObject)) {
			return paramMap;
		}
		String start = startObject.toString();
		String end = endObject.toString();
		if (null == start || "".equals(start) || null == end || "".equals(end)) {
			return paramMap;
		}
		paramMap.put("startDate1", start);
		paramMap.put("endDate1", end);
		return paramMap;
	}

	public static Map<String, Object> getLastWeekMap(Map<String, Object> paramMap) {
		Object startObject = paramMap.get("start");
		String start = "";
		if (null != startObject) {
			start = startObject.toString();
		}
		Object endObject = paramMap.get("end");
		String end = "";
		if (null != endObject) {
			end = endObject.toString();
		}
		
		if (null == start || "".equals(start) || null == end || "".equals(end)) {
			start = getLastWeekSunday();
			end = getLastWeekSaturday();
			String importDate = df.format(new Date());
			paramMap.put("importDate", importDate);
		}
		
		paramMap.put("startDate1", start);
		paramMap.put("endDate1", end);
		return paramMap;
	}
	
	public static Map<String, String> getLastWeekMap(String start, String end) {
		if (null == start || "".equals(start) || null == end || "".equals(end)) {
			start = getLastWeekSunday();
			end = getLastWeekSaturday();
			//System.out.println(start + "   "+end);
		}
		Map<String, String> map = new HashMap<String, String>();
		map.put("startDate1", start);
		map.put("endDate1", end);
		return map;
	}
	
	public static Map<String, String> getLastWeekMap() {
		return getLastWeekMap(null, null);
	}

	private static void testCheckDate() {
		String start = "2016-01-01";
		String end = "2016-01-10";
		System.out.println(checkDate(start, end));
	}

	private static void testPeriod() {
		String start = "2016-03-10";
		String end = "2016-03-15";
		
		System.out.println("====== || 今年本期：");
		System.out.println(start);
		System.out.println(end);
		
		System.out.println("====== || 今年上期：");
		System.out.println(getLastPeriodStart(start, end));
		System.out.println(getLastPeriodEnd(start));
		
		System.out.println("====== || 去年本期：");
		System.out.println(getLastYearThisPeriodStart(start));
		System.out.println(getLastYearThisPeriodEnd(end));
		
		System.out.println("====== || 去年上期：");
		System.out.println(getLastYearLastPeriodStart(start, end));
		System.out.println(getLastYearLastPeriodEnd(start));
	}
	
	public static void test() {
		String startDate1, endDate1, startDate2, endDate2, startDate3, endDate3, startDate4, endDate4;
		// 今年上周
		startDate1 = DateUtil.getLastWeekSunday();
		endDate1 = DateUtil.getLastWeekSaturday();
		// 今年本周
		startDate2 = DateUtil.getThisWeekSunday();
		endDate2 = DateUtil.getThisWeekSaturday();
		// 去年上周
		startDate3 = DateUtil.getLastYearLastWeekSunday();
		endDate3 = DateUtil.getLastYearLastWeekSaturday();
		// 去年本周
		startDate4 = DateUtil.getLastYearThisWeekSunday();
		endDate4 = DateUtil.getLastYearThisWeekSaturday();
	}
	
	public static void testMonthPeriod() throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		
		String start = "2016-02-01";
		String end = "2016-03-01";
		start = null;
		end = null;
		start = "2016-02-10";
		end = "2016-02-30";
		
		paramMap.put("startDate", start);
		paramMap.put("endDate", end);
		
		getMonthPeriod(start, end);
		System.out.println("");
		getDateMap(paramMap);
		System.out.println("");
		getMonthPeriod(paramMap);
		System.out.println("");
	}
	
	public static void main(String[] args) throws Exception {
		// getLastWeekMap(null, null);
		//getDateMapMonthPeriod();
		// cal.set(Calendar.DAY_OF_WEEK, Calendar.SUNDAY);
		// cal.add(Calendar.WEEK_OF_YEAR, 1);
		// System.out.println(thisWeekSunday);
		//System.out.println(getLastYearBeforeLastMonth31());
		//getMonthPeriod();

		//testMonthPeriod();
//		System.out.println(getLastDayInTheMonth("2016-03-1"));
//		System.out.println(getFormatDate("2016-3-1"));
		
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("start", "2016-01-01");
//		map.put("end", "2016-01-08");
//		getOneKeyWeek(map );
		
		System.out.println(getTheMonth31("2015-02-09"));
	}

}
