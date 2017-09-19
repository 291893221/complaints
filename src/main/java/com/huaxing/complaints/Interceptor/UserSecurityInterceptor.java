package com.huaxing.complaints.Interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.huaxing.complaints.controller.TestTableController;
import com.huaxing.complaints.model.Accounts;

public class UserSecurityInterceptor implements HandlerInterceptor {
	private static Logger logger = Logger.getLogger(TestTableController.class);
	// 从配置文件读取不进行拦截的url
	private List<String> excludedUrls;

	public List<String> getExcludedUrls() {
		return excludedUrls;
	}

	public void setExcludedUrls(List<String> excludedUrls) {
		this.excludedUrls = excludedUrls;
	}

	/**
	 * 校验是否登录，进行拦截
	 */
	private boolean isLogin(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String requestUri = request.getRequestURI();
		logger.debug("==== || 当前访问url ：" + requestUri);
		
		for (String url : excludedUrls) {
			if (requestUri.startsWith(url)) {
				return true;
			}
		}
		HttpSession session = request.getSession();
		Object accountObject = session.getAttribute("account");
		if (null == accountObject || "".equals(accountObject)) {
			response.sendRedirect(request.getContextPath() + "/accounts/login");
			return false;
		}
		Accounts account = (Accounts) accountObject;
		logger.debug("==== || 当前帐号 ：" + account.getAccount());
		return true;
	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		return isLogin(request, response, handler);
		// return false;
	}

	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
	}

	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
	}

}
