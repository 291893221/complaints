package com.huaxing.complaints.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.huaxing.complaints.model.OriBlackDotLibrary;
import com.huaxing.complaints.service.OriBlackDotLibraryService;
import com.huaxing.complaints.util.ExcelUtil;
import com.huaxing.complaints.util.ExportExcelUtil;
import com.huaxing.complaints.util.ParamUtil;
import com.huaxing.complaints.util.StringUtil;

@Controller
@RequestMapping("/oriBlackDotLibrary")
public class OriBlackDotLibraryController {
	@Autowired
	private OriBlackDotLibraryService service;

	/**
	 * http://localhost/complaints/oriBlackDotLibrary/list
	 */
	@RequestMapping("/list")
	public String list() {
		return "oriBlackDotLibrary/list";
	}

	@RequestMapping("/listJson")
	@ResponseBody
	public String listJson(HttpServletRequest request, @RequestParam("page") int page, @RequestParam("rows") int rows, String params) throws Exception {
		// ��ҳ����
		int start = (page - 1) * rows + 1;
		int end = (page) * rows;

//		List<OriBlackDotLibrary> oriBlackDotLibraryList = service.selectPaging(start, end);
//		int total = service.selectCount();
		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		paramMap.put("start", String.valueOf(start));
		paramMap.put("end", String.valueOf(end));
		List<OriBlackDotLibrary> oriBlackDotLibraryList = service.selectPaging(paramMap);
		int total = service.selectCount(paramMap);
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("total", total);
		jsonMap.put("rows", oriBlackDotLibraryList);
		String jsonString = JSONObject.valueToString(jsonMap);
		return jsonString;
	}

	@RequestMapping(value = "/uploadExcel", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String uploadExcel(@RequestParam(value = "uploadFilebox", required = false) MultipartFile uploadFilebox) throws Exception {
		String className = "com.huaxing.complaints.model.OriBlackDotLibrary";
		ExcelUtil<OriBlackDotLibrary> eu = new ExcelUtil<OriBlackDotLibrary>();
		XSSFSheet sheet = eu.getSheet0(uploadFilebox);
		if (!eu.checkCellsLength(sheet, className)) {
			return StringUtil.getJsonString(false, 0, "����ʧ�ܣ�excel�������Ϊ�ջ�excle�ֶ������ݿⲻһ�£�");
		}
		List<List<String>> sheetList = eu.getList(sheet);
		List<OriBlackDotLibrary> list = eu.conversionType(sheetList, className);
		int insertBatch = service.insertBatch(list);
		return StringUtil.getJsonString(true, insertBatch, "����ɹ������ι�����"+insertBatch+"�����ݣ�");
	}

	@RequestMapping("/deleteBatch")
	@ResponseBody
	public String deleteBatch(@RequestParam("field0s") String field0s) {
		List<String> field0List = StringUtil.getListFromString(field0s);
		int deleteBatch = service.deleteBatch(field0List);
		return StringUtil.getJsonString(true, deleteBatch, "ɾ���ɹ������ι�ɾ��"+deleteBatch+"�����ݣ�");
	}
	
	@RequestMapping("/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String params) throws Exception {
		String codedFileName = java.net.URLEncoder.encode("�ڵ��ID��Ϣ��", "UTF-8");
		response.setHeader("content-disposition", "attachment;filename=" + codedFileName + ".xls");

		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		List<OriBlackDotLibrary> list = service.selectPaging(paramMap);

		ServletOutputStream outputStream = response.getOutputStream();
		ExportExcelUtil<OriBlackDotLibrary> util = new ExportExcelUtil<OriBlackDotLibrary>();
		String[] headers = { "uuidΨһ��ʶ", "��������", "Ͷ�ߵ�id", "Ͷ�ߵ�����", "Ͷ�ߵ�����", "��ʼʱ��", "���״̬", "����ԭ��", "Ӱ�췶Χ", "������", "��", "��ַ", "Ͷ����", "Ͷ������", "��ϵ�绰", "����", "γ��", "����취", "��ϸ�������", "��ǰ״̬", "Ͷ�ߵ�����id", "վ������", "վ������", "Ԥ�ڽ��ʱ��", "�ܷ���", "������Դ", "����ʱ��", "����վ��id", "�⽨վ������", "ʵ��վ������", "վ�㾭��", "վ��γ��", "�滮���", "���̽���", "�ƻ����ʱ��", "ʵ�����ʱ��", "վ�㸲�Ƿ�Χ", "վ��˵��", "���ʱ��" };
		util.exportExcel(headers, list, outputStream);
	}
}
