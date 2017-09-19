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
		// 分页参数
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
			return StringUtil.getJsonString(false, 0, "导入失败，excel表格数据为空或excle字段与数据库不一致！");
		}
		List<List<String>> sheetList = eu.getList(sheet);
		List<OriNetV600> list = eu.conversionType(sheetList, className);
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
		String codedFileName = java.net.URLEncoder.encode("网投+V600投诉工单", "UTF-8");
		response.setHeader("content-disposition", "attachment;filename=" + codedFileName + ".xls");

		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		List<OriNetV600> list = service.selectPaging(paramMap);

		ServletOutputStream outputStream = response.getOutputStream();
		ExportExcelUtil<OriNetV600> util = new ExportExcelUtil<OriNetV600>();
		String[] headers = { "储备站点", "工程基站（故障）", "维护基站（故障）", "工程直放站（故障）", "维护直放站（故障）", "内部干扰", "外部干扰", "基站设备、参数调整", "直放站设备、参数调整", "基本正常", "工程原因（基站）", "工程原因（直放站）", "后期规划", "系统升级", "漫游", "核心侧故障", "其它", "工单类型", "投诉类型", "投诉原因", "工程或故障站名", "建议责任部门", "实施情况", "解决后回访情况", "最终解决情况", "最终回复客户时间", "工单号", "投诉号码", "客户级别", "内部投诉经办人", "手机品牌型号", "投诉内容", "是否黑点库已有登记", "是否重复投诉", "投诉属性", "投诉时间", "回复受理部门/人", "一级关键字", "二级关键字", "详细地址", "所属区域", "投诉区域小区覆盖", "受理的情况（回复内容）", "工单承诺解决时间", "遗留问题", "实际解决时间", "经度", "纬度", "是否已经回访", "工单处理时间", "工单导入时间" };
		util.exportExcel(headers, list, outputStream);
	}
}
