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

import com.huaxing.complaints.model.OriNetV600;
import com.huaxing.complaints.service.OriNetV600Service;
import com.huaxing.complaints.util.ExcelUtil;
import com.huaxing.complaints.util.ExportExcelUtil;
import com.huaxing.complaints.util.ParamUtil;
import com.huaxing.complaints.util.StringUtil;

@Controller
@RequestMapping("/oriNetV600")
public class OriNetV600Controller {
	@Autowired
	private OriNetV600Service service;

	/**
	 * http://localhost/complaints/oriNetV600/list
	 */
	@RequestMapping("/list")
	public String list() {
		return "oriNetV600/list";
	}

	@RequestMapping("/listJson")
	@ResponseBody
	public String listJson(HttpServletRequest request, 
			@RequestParam("page") int page, @RequestParam("rows") int rows, 
			String params) throws Exception {
		// ��ҳ����
		int start = (page - 1) * rows + 1;
		int end = (page) * rows;
		
		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		paramMap.put("start", String.valueOf(start));
		paramMap.put("end", String.valueOf(end));
		
//		List<OriNetV600> list = service.selectPaging(start, end);
//		int total = service.selectCount();
		List<OriNetV600> list = service.selectPaging(paramMap);
		int total = service.selectCount(paramMap);
		Map<String, Object> jsonMap = new HashMap<String, Object>();
		jsonMap.put("total", total);
		jsonMap.put("rows", list);
		String jsonString = JSONObject.valueToString(jsonMap);
		return jsonString;
	}

	@RequestMapping(value = "/uploadExcel", produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String uploadExcel(@RequestParam(value = "uploadFilebox", required = false) MultipartFile uploadFilebox) throws Exception {
		String className = "com.huaxing.complaints.model.OriNetV600";
		ExcelUtil<OriNetV600> eu = new ExcelUtil<OriNetV600>();
		XSSFSheet sheet = eu.getSheet0(uploadFilebox);
		if (!eu.checkCellsLength(sheet, className)) {
			return StringUtil.getJsonString(false, 0, "����ʧ�ܣ�excel�������Ϊ�ջ�excle�ֶ������ݿⲻһ�£�");
		}
		List<List<String>> sheetList = eu.getList(sheet);
		List<OriNetV600> list = eu.conversionType(sheetList, className);
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
		String codedFileName = java.net.URLEncoder.encode("��Ͷ+V600Ͷ�߹���", "UTF-8");
		response.setHeader("content-disposition", "attachment;filename=" + codedFileName + ".xls");

		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		List<OriNetV600> list = service.selectPaging(paramMap);

		ServletOutputStream outputStream = response.getOutputStream();
		ExportExcelUtil<OriNetV600> util = new ExportExcelUtil<OriNetV600>();
		String[] headers = { "����վ��", "���̻�վ�����ϣ�", "ά����վ�����ϣ�", "����ֱ��վ�����ϣ�", "ά��ֱ��վ�����ϣ�", "�ڲ�����", "�ⲿ����", "��վ�豸����������", "ֱ��վ�豸����������", "��������", "����ԭ�򣨻�վ��", "����ԭ��ֱ��վ��", "���ڹ滮", "ϵͳ����", "����", "���Ĳ����", "����", "��������", "Ͷ������", "Ͷ��ԭ��", "���̻����վ��", "�������β���", "ʵʩ���", "�����ط����", "���ս�����", "���ջظ��ͻ�ʱ��", "������", "Ͷ�ߺ���", "�ͻ�����", "�ڲ�Ͷ�߾�����", "�ֻ�Ʒ���ͺ�", "Ͷ������", "�Ƿ�ڵ�����еǼ�", "�Ƿ��ظ�Ͷ��", "Ͷ������", "Ͷ��ʱ��", "�ظ�������/��", "һ���ؼ���", "�����ؼ���", "��ϸ��ַ", "��������", "Ͷ������С������", "�����������ظ����ݣ�", "������ŵ���ʱ��", "��������", "ʵ�ʽ��ʱ��", "����", "γ��", "�Ƿ��Ѿ��ط�", "��������ʱ��", "��������ʱ��" };
		util.exportExcel(headers, list, outputStream);
	}
}
