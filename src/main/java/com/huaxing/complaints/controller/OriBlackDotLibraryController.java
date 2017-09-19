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
		// 分页参数
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
			return StringUtil.getJsonString(false, 0, "导入失败，excel表格数据为空或excle字段与数据库不一致！");
		}
		List<List<String>> sheetList = eu.getList(sheet);
		List<OriBlackDotLibrary> list = eu.conversionType(sheetList, className);
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
		String codedFileName = java.net.URLEncoder.encode("黑点库ID信息表", "UTF-8");
		response.setHeader("content-disposition", "attachment;filename=" + codedFileName + ".xls");

		Map<String, Object> paramMap = ParamUtil.getParamMap(params);
		List<OriBlackDotLibrary> list = service.selectPaging(paramMap);

		ServletOutputStream outputStream = response.getOutputStream();
		ExportExcelUtil<OriBlackDotLibrary> util = new ExportExcelUtil<OriBlackDotLibrary>();
		String[] headers = { "uuid唯一标识", "网络类型", "投诉点id", "投诉点名称", "投诉点类型", "开始时间", "审核状态", "故障原因", "影响范围", "地市名", "域", "地址", "投诉量", "投诉类型", "联系电话", "经度", "纬度", "解决办法", "详细处理情况", "当前状态", "投诉点所属id", "站点名称", "站点类型", "预期解决时间", "能否解决", "问题来源", "更新时间", "工程站点id", "拟建站点名称", "实际站点名称", "站点经度", "站点纬度", "规划年份", "工程进度", "计划完成时间", "实际完成时间", "站点覆盖范围", "站点说明", "解决时间" };
		util.exportExcel(headers, list, outputStream);
	}
}
