package com.huaxing.complaints.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.huaxing.complaints.model.TestTable;
import com.huaxing.complaints.service.TestTableService;

@Controller
@RequestMapping("/testTable")
public class TestTableController {
	private static Logger logger = Logger.getLogger(TestTableController.class);
	@Autowired
	private TestTableService testTableService;

	/**
	 * http://localhost:80/complaints/testTable/getTestTable
	 */
	@RequestMapping("/getTestTable")
	public ModelAndView testTable() {
		ModelAndView mv = new ModelAndView();
		TestTable testTable = testTableService.getTestTableById("930b0d007a7a4f4486e54fabb17f1feb");
		logger.debug("=== || testTable : " + testTable);
		mv.addObject("spring", "spring mvc : " + testTable.getField1());
		mv.setViewName("testTable");
		return mv;
	}
}
