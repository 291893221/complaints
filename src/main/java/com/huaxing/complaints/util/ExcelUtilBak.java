package com.huaxing.complaints.util;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.poi.POIXMLDocument;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelUtilBak {
	public static void main(String[] args) {
		ExcelUtilBak eu = new ExcelUtilBak();
		List<List<String>> list = eu.read("D://netV600.xlsx");
		System.out.println(list.size());
	}

	/** ������Ϣ */
	private String errorInfo;

	/**
	 * ��֤EXCEL�ļ��Ƿ�Ϸ�
	 */
	public boolean validateExcel(String filePath) {

		/** �ж��ļ����Ƿ�Ϊ�ջ����ļ��Ƿ���� */
		if (!CEVUtil.fileExist(filePath)) {
			errorInfo = "�ļ�������";
			return false;
		}

		/** ����ļ��Ƿ���Excel��ʽ���ļ� */
		if (!CEVUtil.isExcel(filePath)) {
			errorInfo = "�ļ�������excel��ʽ";
			return false;
		}
		return true;
	}

	/**
	 * @�����������ļ�����ȡexcel�ļ�
	 */
	public List<List<String>> read(String filePath) {
		List<List<String>> list = new ArrayList<List<String>>();
		InputStream is = null;
		try {
			/** ��֤�ļ��Ƿ�Ϸ� */
			if (!validateExcel(filePath)) {
				System.out.println(errorInfo);
				return null;
			}
			/** �ж��ļ������ͣ���2003����2007 */
			boolean isExcel2003 = true;
			if (CEVUtil.isExcel2007(filePath)) {
				isExcel2003 = false;
			}
			/** ���ñ����ṩ�ĸ�������ȡ�ķ��� */
			is = new FileInputStream(new File(filePath));
			Workbook wb = null;
			if (isExcel2003) {
				wb = new HSSFWorkbook(is);
			} else {
				wb = new XSSFWorkbook(is);
			}
			is.close();
			 list = read(wb);
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					is = null;
					e.printStackTrace();
				}
			}
		}
		return list;
	}

	/**
	 * @��������ȡ����
	 */
	public List<List<String>> read(Workbook wb) {
		List<List<String>> dataLst = new ArrayList<List<String>>();
		/** �õ��ܵ�shell */
		int sheetAccount = wb.getNumberOfSheets();
		/** �õ���һ��shell */
		Sheet sheet = wb.getSheetAt(0);
		/** �õ�Excel������ */
		int rowCount = sheet.getPhysicalNumberOfRows();
		/** Ҳ����ͨ���õ����һ���� */
		int lastRowNum = sheet.getLastRowNum();
		/** ѭ��Excel���� */
		for (int r = 0; r < rowCount; r++) {
			Row row = sheet.getRow(r);
			if (row == null) {
				continue;
			}
			List<String> rowLst = new ArrayList<String>();
			/** ѭ��Excel���� */
			for (int c = 0; c < row.getPhysicalNumberOfCells(); c++) {
				Cell cell = row.getCell(c);
				String cellValue = "";
				if (null != cell) {
					// �������ж����ݵ�����
					switch (cell.getCellType()) {
					// XSSFCell���Դﵽ��ͬ��Ч��
					case HSSFCell.CELL_TYPE_NUMERIC: // ����
						double d = cell.getNumericCellValue();
						if (HSSFDateUtil.isCellDateFormatted(cell)) {// ��������
							// Date date = cell.getDateCellValue();
							Date date = HSSFDateUtil.getJavaDate(d);
							cellValue = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date);
						} else {// ��ֵ����
							cellValue = cell.getNumericCellValue() + "";
						}
						cellValue = cell.getDateCellValue() + "";
						break;
					case HSSFCell.CELL_TYPE_STRING: // �ַ���
						cellValue = cell.getStringCellValue();
						break;
					case HSSFCell.CELL_TYPE_BOOLEAN: // Boolean
						cellValue = cell.getBooleanCellValue() + "";
						break;
					case HSSFCell.CELL_TYPE_FORMULA: // ��ʽ
						cellValue = cell.getCellFormula() + "";
						break;
					case HSSFCell.CELL_TYPE_BLANK: // ��ֵ
						cellValue = "";
						break;
					case HSSFCell.CELL_TYPE_ERROR: // ����
						cellValue = "�Ƿ��ַ�";
						break;
					default:
						cellValue = "δ֪����";
						break;
					}
				}
				System.out.print(cellValue + "\t");
				rowLst.add(cellValue);
			}
			System.out.println();
			dataLst.add(rowLst);
		}
		return dataLst;
	}
}

class CEVUtil {
	/**
	 * ���ݺ�׺���ж϶�ȡ���Ƿ�ΪExcel�ļ�
	 * 
	 * @param filePath
	 * @return
	 */
	public static boolean isExcel(String filePath) {
		if (filePath.matches("^.+\\.(?i)(xls)$") || filePath.matches("^.+\\.(?i)(xlsx)$")) {
			return true;
		}
		return false;
	}

	/**
	 * ����ļ��Ƿ����
	 */
	public static boolean fileExist(String filePath) {
		if (filePath == null || filePath.trim().equals(""))
			return false;
		File file = new File(filePath);
		if (file == null || !file.exists()) {
			return false;
		}
		return true;
	}

	/**
	 * ���������ж��Ƿ�Ϊexcel2003������
	 */
	public static boolean isExcel2003(String filePath) {
		try {
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(filePath));
			if (POIFSFileSystem.hasPOIFSHeader(bis)) {
				System.out.println("Excel�汾Ϊexcel2003������");
				return true;
			}
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}

	/**
	 * ���������ж��Ƿ�Ϊexcel2007������
	 */
	public static boolean isExcel2007(String filePath) {
		try {
			BufferedInputStream bis = new BufferedInputStream(new FileInputStream(filePath));
			if (POIXMLDocument.hasOOXMLHeader(bis)) {
				System.out.println("Excel�汾Ϊexcel2007������");
				return true;
			}
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}
}
