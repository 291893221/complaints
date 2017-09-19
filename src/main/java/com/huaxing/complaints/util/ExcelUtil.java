package com.huaxing.complaints.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.web.multipart.MultipartFile;

import com.huaxing.complaints.model.OriBlackDotLibrary;
import com.huaxing.complaints.model.OriNetV600;

public class ExcelUtil<T> {
	public XSSFSheet getSheet0(MultipartFile uploadFilebox) throws IOException {
//		if (null == uploadFilebox) {
//			System.out.println("null == uploadFilebox");
//			return null;
//		}
		InputStream inputStream = uploadFilebox.getInputStream();
		XSSFWorkbook workbook = new XSSFWorkbook(inputStream);
		XSSFSheet sheet = workbook.getSheetAt(0);
		return sheet;
	}
	
	public List<List<String>> getList(XSSFSheet sheet) {
		List<List<String>> sheetList = new ArrayList<List<String>>();
		
		//得到Excel的行数 
		int rowCount = sheet.getPhysicalNumberOfRows();
//		System.out.println("============== rowCount : "+rowCount);
		//跳过表头
		for (int r = 1; r < rowCount; r++) {
			Row row = sheet.getRow(r);
			if (row == null) {
				continue;
			}
			List<String> rowList = new ArrayList<String>();
			for (int c = 0; c < row.getPhysicalNumberOfCells(); c++) {
				Cell cell = row.getCell(c);
//				if (null == cell) {
//					System.out.println("============== 该列为空 ！");
//				}
				String cellValue = "";
				if (null != cell) {
//					int columnIndex = cell.getColumnIndex() + 1;
//					System.out.println("===  :"+columnIndex +"\t === "+ cell.getStringCellValue());
					// 以下是判断数据的类型
					switch (cell.getCellType()) {
					// XSSFCell可以达到相同的效果
					case HSSFCell.CELL_TYPE_NUMERIC: // 数字
						double d = cell.getNumericCellValue();
						if (HSSFDateUtil.isCellDateFormatted(cell)) {// 日期类型
							// Date date = cell.getDateCellValue();
							Date date = HSSFDateUtil.getJavaDate(d);
							cellValue = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
						} else {// 数值类型
							cellValue = cell.getNumericCellValue() + "";
						}
						cellValue = cell.getDateCellValue() + "";
						break;
					case HSSFCell.CELL_TYPE_STRING: // 字符串
						cellValue = cell.getStringCellValue();
						break;
					case HSSFCell.CELL_TYPE_BOOLEAN: // Boolean
						cellValue = cell.getBooleanCellValue() + "";
						break;
					case HSSFCell.CELL_TYPE_FORMULA: // 公式
						cellValue = cell.getCellFormula() + "";
						break;
					case HSSFCell.CELL_TYPE_BLANK: // 空值
						cellValue = "";
						break;
					case HSSFCell.CELL_TYPE_ERROR: // 故障
						cellValue = "非法字符";
						break;
					default:
						cellValue = "未知类型";
						break;
					}
				}
				rowList.add(cellValue);
			}
			sheetList.add(rowList);
		}
		return sheetList;
	}
	
	public List<T> conversionType(List<List<String>> sheetList,String className) throws Exception {
		List<T> returnList = new ArrayList<T>() ;
		Class<T> class1 = (Class<T>) Class.forName(className);
		Method[] methods = class1.getMethods();
		for (int i = 0; i < sheetList.size(); i++) {
			List<String> list = sheetList.get(i);
//			System.out.println( "========== list " +list.size());
			T obj = class1.newInstance();
			int max = list.size();
			//设置UUID
			Method method = class1.getMethod("setField0", String.class);
			method.invoke(obj, UUIDUtil.getRandomUUID());
			for (int j = 0; j < max; j++) {
				int m = j+1;
				String methodStr = "setField"+m;
				if (checkMethod(methods, methodStr)) {					
					Method method1 = class1.getMethod(methodStr, String.class);
					method1.invoke(obj, list.get(j));
				} else {
					System.out.println("========= 无该方法!" + methodStr);
				}
			}
			returnList.add(obj);
			
		}
		return returnList;
	}
	public boolean checkMethod(Method[] methods, String methodStr){
		for (int q = 0; q < methods.length; q++) {
			Method method1 =  methods[q];
			String string= method1.getName();
			if (string.equals(methodStr)) {
				return true;
			}
		}
		return false;
	}
	public boolean checkCellsLength(XSSFSheet sheet,String className) throws Exception{
		if (sheet == null || sheet.getPhysicalNumberOfRows() <= 1) {
			return false;
		}
		Row row = sheet.getRow(0);
		if (row == null) {
			return false;
		}
		int cellsLength = row.getPhysicalNumberOfCells();//EXCEL表格宽度
		Class<T> class1 = (Class<T>) Class.forName(className);
		Field[] fields = class1.getDeclaredFields();
		int fieldsLength = fields.length;//数据库表宽度
		if (cellsLength+1 != fieldsLength) {
			return false;
		}
		return true;
	}

	public static void testConversionType() throws Exception {
		String className = "com.huaxing.complaints.model.OriBlackDotLibrary";
		Class<OriBlackDotLibrary> class1 =  (Class<OriBlackDotLibrary>) Class.forName(className);
		Field[] fields = class1.getFields();
		int fieldsLength = fields.length;
//		System.out.println("=== || fieldsLength : "+fieldsLength);
		
		OriBlackDotLibrary obj = new OriBlackDotLibrary();
		Field[] fields2 = obj.getClass().getFields();
		Field[] fields3 = obj.getClass().getDeclaredFields();
		Method[] methods = obj.getClass().getMethods();
//		System.out.println(fields2.length);
//		System.out.println(fields3.length);
//		System.out.println(methods.length);
	}
	
	public static void testGetList() throws Exception {
		String className = "com.huaxing.complaints.model.OriNetV600";
		ExcelUtil<OriNetV600> eu = new ExcelUtil<OriNetV600>();
		InputStream in =  new FileInputStream("D://bak//bbb.xlsx");
		XSSFWorkbook workbook = new XSSFWorkbook(in);
		XSSFSheet sheet = workbook.getSheetAt(0);
		List<List<String>> sheetList = eu.getList(sheet);
		List<OriNetV600> list = eu.conversionType(sheetList, className);
	}
	
	public static void main(String[] args) throws Exception {
		testGetList();
	}
}
