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

import com.huaxing.complaints.model.OriV600Market;
import com.huaxing.complaints.service.OriV600MarketService;
import com.huaxing.complaints.util.ExcelUtil;
import com.huaxing.complaints.util.ExportExcelUtil;
import com.huaxing.complaints.util.ParamUtil;
import com.huaxing.complaints.util.StringUtil;

@Controller
@RequestMapping("/oriV600Market")
public class OriV600MarketController {
	@Autowired
	private OriV600MarketService service;

	/**
	 * http://localhost/complaints/oriV600Market/list
	 */
	@RequestMapping("/list")
	public String list() {
		return "oriV600Market/list";
	}

	@RequestMapping("/listJson")
	@ResponseBody
	public String listJson(HttpServletRequest request, @RequestParam("page") int page, @RequestParam("rows") int rows, String params) throws Exception {
		// 分页参数
		int start = (page - 1) * rows + 1;
		int end = (page) * rows;

//		List<OriV600Market> selectPaging = service.selectPaging(start, end);
//		int total = service.selectCount();
		
		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		paramMap.put("start", String.valueOf(start));
		paramMap.put("end", String.valueOf(end));
		List<OriV600Market> list = service.selectPaging(paramMap);
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
		String className = "com.huaxing.complaints.model.OriV600Market";
		ExcelUtil<OriV600Market> eu = new ExcelUtil<OriV600Market>();
		XSSFSheet sheet = eu.getSheet0(uploadFilebox);
		if (!eu.checkCellsLength(sheet, className)) {
			return StringUtil.getJsonString(false, 0, "导入失败，excel表格数据为空或excle字段与数据库不一致！");
		}
		List<List<String>> sheetList = eu.getList(sheet);
		List<OriV600Market> list = eu.conversionType(sheetList, className);
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
		String codedFileName = java.net.URLEncoder.encode("V600市场投诉类投诉工单", "UTF-8");
		response.setHeader("content-disposition", "attachment;filename=" + codedFileName + ".xls");

		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		List<OriV600Market> list = service.selectPaging(paramMap);

		ServletOutputStream outputStream = response.getOutputStream();
		ExportExcelUtil<OriV600Market> util = new ExportExcelUtil<OriV600Market>();
		String[] headers = { "投诉类型", "流水号", "受理号码", "服务请求类别", "问题分类", "问题细项", "投诉内容", "客户回复内容", "是否下发调查短信", "受理时间", "客户归属地", "客户品牌", "客户级别", "受理工号", "受理部门", "业务地市", "投诉途径", "受理方式", "紧急程度", "受理短信", "信用度星级数", "升级预警", "客户分类", "语种", "营销方案名称", "请求编号", "录音流水", "录音时间", "反馈时间", "是否敏感客户", "主叫号码", "联系人姓名", "联系电话", "联系方式", "联系地址", "责任部门", "责任原因", "派单质量评价", "评价备注", "终端品牌型号", "批量故障名称", "uuid唯一标识" };
		util.exportExcel(headers, list, outputStream);
	}
}
