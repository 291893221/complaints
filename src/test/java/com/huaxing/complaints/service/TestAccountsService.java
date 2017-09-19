package com.huaxing.complaints.service;

import org.apache.log4j.Logger;
import org.junit.Before;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.huaxing.complaints.model.Accounts;
import com.huaxing.complaints.util.UUIDUtil;

public class TestAccountsService {
	private static Logger logger = Logger.getLogger(TestAccountsService.class);
	private AccountsService accountsService;

	@Before
	public void before() {
		// 使用"spring.xml"和"spring-mybatis.xml"这两个配置文件创建Spring上下文
		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "spring.xml", "spring-mybatis.xml" });
		// 从Spring容器中根据bean的id取出我们要使用的userService对象
		accountsService = (AccountsService) ac.getBean("accountsService");
	}

	@Test
	public void testAddAccount() {
		Accounts accounts = new Accounts();
		String randomUUID = UUIDUtil.getRandomUUID();
		accounts.setId(randomUUID);
		accounts.setAccount(randomUUID);
		accounts.setPassword(randomUUID);
		String id = accountsService.addAccounts(accounts);
		logger.debug(id);
	}

}
