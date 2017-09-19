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

import com.huaxing.complaints.model.OriCustomer;
import com.huaxing.complaints.service.OriCustomerService;
import com.huaxing.complaints.util.ExcelUtil;
import com.huaxing.complaints.util.ExportExcelUtil;
import com.huaxing.complaints.util.ParamUtil;
import com.huaxing.complaints.util.StringUtil;

@Controller
@RequestMapping("/oriCustomer")
public class OriCustomerController {
	@Autowired
	private OriCustomerService service;

	/**
	 * http://localhost/complaints/oriCustomer/list
	 */
	@RequestMapping("/list")
	public String list() {
		return "oriCustomer/list";
	}

	@RequestMapping("/listJson")
	@ResponseBody
	public String listJson(HttpServletRequest request, @RequestParam("page") int page, @RequestParam("rows") int rows, String params) throws Exception {
		// 分页参数
		int start = (page - 1) * rows + 1;
		int end = (page) * rows;
		
//		List<OriCustomer> list = service.selectPaging(start, end);
//		int total = service.selectCount();
		
		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		paramMap.put("start", String.valueOf(start));
		paramMap.put("end", String.valueOf(end));
		List<OriCustomer> list = service.selectPaging(paramMap);
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
		String className = "com.huaxing.complaints.model.OriCustomer";
		ExcelUtil<OriCustomer> eu = new ExcelUtil<OriCustomer>();
		XSSFSheet sheet = eu.getSheet0(uploadFilebox);
		if (!eu.checkCellsLength(sheet, className)) {
			return StringUtil.getJsonString(false, 0, "导入失败，excel表格数据为空或excle字段与数据库不一致！");
		}
		List<List<String>> sheetList = eu.getList(sheet);
		List<OriCustomer> list = eu.conversionType(sheetList, className);
		int insertBatch = service.insertBatch(list);
		return StringUtil.getJsonString(true, insertBatch, "导入成功，本次共导入"+insertBatch+"条数据！");
	}

	@RequestMapping("/deleteBatch")
	@ResponseBody
	public String deleteBatch(@RequestParam("field0s") String field0s) {
		List<String> field0List = StringUtil.getListFromString(field0s);
		int deleteBatch = service.deleteBatch(field0List);
		return StringUtil.getJsonString(true, deleteBatch, "删除成功，本次共删除"+deleteBatch+"条数据！");
	}
	
	@RequestMapping("/exportExcel")
	public void exportExcel(HttpServletRequest request, HttpServletResponse response, String params) throws Exception {
		String codedFileName = java.net.URLEncoder.encode("用户属性信息表", "UTF-8");
		response.setHeader("content-disposition", "attachment;filename=" + codedFileName + ".xls");

		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		List<OriCustomer> list = service.selectPaging(paramMap);

		ServletOutputStream outputStream = response.getOutputStream();
		ExportExcelUtil<OriCustomer> util = new ExportExcelUtil<OriCustomer>();
		String[] headers = { "UUID唯一标识", "用户号码", "品牌", "品牌名称", "子品牌", "子品牌名称", "在用语音套餐", "在用语音套餐名称" };
		util.exportExcel(headers, list, outputStream);
	}
}
