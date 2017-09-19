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

import com.huaxing.complaints.model.OriNPSCustomer;
import com.huaxing.complaints.service.OriNPSCustomerService;
import com.huaxing.complaints.util.ExcelUtil;
import com.huaxing.complaints.util.ExportExcelUtil;
import com.huaxing.complaints.util.ParamUtil;
import com.huaxing.complaints.util.StringUtil;

@Controller
@RequestMapping("/oriNPSCustomer")
public class OriNPSCustomerController {
	@Autowired
	private OriNPSCustomerService service;

	/**
	 * http://localhost/complaints/oriNPSCustomer/list
	 */
	@RequestMapping("/list")
	public String list() {
		return "oriNPSCustomer/list";
	}

	@RequestMapping("/listJson")
	@ResponseBody
	public String listJson(HttpServletRequest request, @RequestParam("page") int page, @RequestParam("rows") int rows, String params) throws Exception {
		// 分页参数
		int start = (page - 1) * rows + 1;
		int end = (page) * rows;

//		List<OriNPSCustomer> selectPaging = service.selectPaging(start, end);
//		int total = service.selectCount();
		
		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		paramMap.put("start", String.valueOf(start));
		paramMap.put("end", String.valueOf(end));
		List<OriNPSCustomer> list = service.selectPaging(paramMap);
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
		String className = "com.huaxing.complaints.model.OriNPSCustomer";
		ExcelUtil<OriNPSCustomer> eu = new ExcelUtil<OriNPSCustomer>();
		XSSFSheet sheet = eu.getSheet0(uploadFilebox);
		if (!eu.checkCellsLength(sheet, className)) {
			return StringUtil.getJsonString(false, 0, "导入失败，excel表格数据为空或excle字段与数据库不一致！");
		}
		List<List<String>> sheetList = eu.getList(sheet);
		List<OriNPSCustomer> list = eu.conversionType(sheetList, className);
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
		String codedFileName = java.net.URLEncoder.encode("NPS客户满意度调查表", "UTF-8");
		response.setHeader("content-disposition", "attachment;filename=" + codedFileName + ".xls");

		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		List<OriNPSCustomer> list = service.selectPaging(paramMap);

		ServletOutputStream outputStream = response.getOutputStream();
		ExportExcelUtil<OriNPSCustomer> util = new ExportExcelUtil<OriNPSCustomer>();
		String[] headers = { "手机号码", "用户投诉区域", "市场提供的区域", "是否对应", "推荐意愿评分", "回访批次", "登记时间", "不推荐原因", "初步原因分类", "回访用户后的原因", "回访用户后的原因分类", "是否已恢复", "网络问题分类", "是否已有规划", "信号问题地址", "经度", "维度", "备注", "是否现场测试", "测试情况", "是否网优调整", "规划站点", "距离(km)", "区域类型", "现网站点", "距离(km)", "未规划原因", "是否现网黑点", "网优调整优化预计完成时间", "客户类型", "uuid唯一标识" };
		util.exportExcel(headers, list, outputStream);
	}
}
