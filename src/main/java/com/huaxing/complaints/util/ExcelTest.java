package com.huaxing.complaints.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Date;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class ExcelTest {

	public static void createExcel() {
		HSSFWorkbook wb = new HSSFWorkbook();
		HSSFSheet sheet = wb.createSheet("new sheet");
		HSSFRow row = sheet.createRow(0);
		HSSFCell cell = row.createCell(0);
		cell.setCellValue("Name");

		HSSFCell cell2 = row.createCell(1);
		cell2.setCellValue("Neal");

		HSSFCell cell3 = row.createCell(2);
		cell3.setCellValue(true);

		HSSFCellStyle cellStyle = wb.createCellStyle();
		cellStyle.setDataFormat(HSSFDataFormat.getBuiltinFormat("m/d/yy h:mm"));
		HSSFCell dCell = row.createCell(3);
		dCell.setCellValue(new Date());
		dCell.setCellStyle(cellStyle);

		HSSFCellStyle backageStyle = wb.createCellStyle();
		backageStyle.setFillForegroundColor(new HSSFColor.GREY_25_PERCENT().getIndex());
		HSSFCell cell5 = row.createCell(4);
		cell5.setCellValue("Color");
		cell5.setCellStyle(backageStyle);

		HSSFCellStyle backageStyle2 = wb.createCellStyle();
		backageStyle2.setFillForegroundColor(new HSSFColor.GREY_40_PERCENT().getIndex());
		backageStyle2.setBorderBottom((short) 1);
		backageStyle2.setBorderTop((short) 1);
		backageStyle2.setBorderLeft((short) 1);
		backageStyle2.setBorderRight((short) 1);

		HSSFCell cell6 = row.createCell(5);
		cell6.setCellValue("Color2");
		cell6.setCellStyle(backageStyle2);

		// Number Formart
		HSSFCellStyle numberFormart = wb.createCellStyle();
		numberFormart.setDataFormat(HSSFDataFormat.getBuiltinFormat(",###"));
		HSSFCell cell7 = row.createCell(6);
		cell7.setCellValue((double) 1111111111.11111);
		cell7.setCellStyle(numberFormart);

		try {
			FileOutputStream fileOutputStream = new FileOutputStream("workbooks.xls");
			wb.write(fileOutputStream);
			fileOutputStream.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void loadExcelByXsl() {
		try {
			HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream("workbooks.xls"));
			HSSFSheet sheet = workbook.getSheet("new sheet");
			HSSFRow row1 = sheet.getRow(0);
			if (row1 != null) {
				System.out.println(row1.getCell(0).getStringCellValue());
			}
			HSSFRow row2 = sheet.getRow(1);
			if (row2 == null) {
				System.out.println("Null");
			}

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void loadExcelByXslx() {
		try {
//			XSSFWorkbook workbook = new XSSFWorkbook(new FileInputStream(new File("D:\\test.xlsx")));
			XSSFWorkbook workbook = new XSSFWorkbook(new FileInputStream("D:\\test.xlsx"));
			XSSFSheet sheet = workbook.getSheet("Sheet1");
			XSSFRow row1 = sheet.getRow(0);
			if (row1 != null) {
				System.out.println(row1.getCell(0).getStringCellValue());
			}
			XSSFRow row2 = sheet.getRow(1);
			if (row2 == null) {
				System.out.println("Null");
			}

		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static void main(String[] args) {
		loadExcelByXslx();
	}

}