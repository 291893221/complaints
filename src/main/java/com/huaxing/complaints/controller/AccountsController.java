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
		// �����ǿ�У��
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
			message = "�������ʺ����룡";
			request.setAttribute("message", message);
			return "redirect:/accounts/login";
		}

		// У������
		boolean checkAccount = accountsService.checkAccount(account);
		if (checkAccount) {
			request.getSession().setAttribute("account", account);
			return "main/main";
		}
		message = "�ʺ��������";
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
		return "{'success': true, 'message': '�޸�����ɹ�!'} ";
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
