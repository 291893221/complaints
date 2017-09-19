package com.huaxing.complaints.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.huaxing.complaints.model.Accounts;
import com.huaxing.complaints.service.AccountsService;

@Controller
@RequestMapping("/accounts")
public class AccountsController {
	private static Logger logger = Logger.getLogger(AccountsController.class);
	@Autowired
	private AccountsService accountsService;

	/**
	 * http://localhost/complaints/accounts/login
	 */
	@RequestMapping("/login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("accounts/login");
		return mv;
	}

	@RequestMapping("/loginSubmit")
	public String loginSubmit(HttpServletRequest request, @ModelAttribute("account") Accounts account) {
		String message = "";
		// 参数非空校验
		if (null == account || null == account.getPassword() || "".equals(account.getPassword()) || null == account.getAccount() || "".equals(account.getAccount())) {

			// HttpSession session = request.getSession();
			// Object accountObject = session.getAttribute("account");
			// if (accountObject != null) {
			// account = (Accounts) accountObject;
			// String account2 = account.getAccount();
			// session.setAttribute("account2", account2);
			// session.removeAttribute("account");
			// session.setAttribute("account", account);
			// return "main/main";
			// }

			// Map<String, String[]> parameterMap = request.getParameterMap();
			// Set<String> keySet = parameterMap.keySet();
			// for (String string : keySet) {
			// logger.debug(string);
			// String[] strings = parameterMap.get(string);
			// for (String string2 : strings) {
			// logger.debug("-- " + string2);
			// }
			// }
			message = "请输入帐号密码！";
			request.setAttribute("message", message);
			return "redirect:/accounts/login";
		}

		// 校验密码
		boolean checkAccount = accountsService.checkAccount(account);
		if (checkAccount) {
			request.getSession().setAttribute("account", account);
			return "main/main";
		}
		message = "帐号密码错误！";
		request.setAttribute("message", message);
		return "accounts/login";
	}

	@RequestMapping("/editPassword")
	public String editPassword() {
		return "accounts/editPassword";
	}

	@RequestMapping("/editPasswordSubmit")
	@ResponseBody
	public String editPasswordSubmit(@ModelAttribute("account") Accounts account) {
		accountsService.editPassword(account);
		return "{'success': true, 'message': '修改密码成功!'} ";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("account");
		return "redirect:/accounts/login";
	}

	/**
	 * http://localhost/complaints/accounts/listAccounts
	 */
	@RequestMapping("/listAccounts")
	public String listAccounts() {
		return "accounts/listAccounts";
	}

	@RequestMapping("/listAccountsJson")
	@ResponseBody
	public String listAccountsJson() {
		List<Accounts> accountsList = accountsService.getAllAccounts();
		String accountsListJson = JSONObject.valueToString(accountsList);
		return accountsListJson;
	}
}
