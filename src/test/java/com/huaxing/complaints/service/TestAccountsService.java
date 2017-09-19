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
		// ʹ��"spring.xml"��"spring-mybatis.xml"�����������ļ�����Spring������
		ApplicationContext ac = new ClassPathXmlApplicationContext(new String[] { "spring.xml", "spring-mybatis.xml" });
		// ��Spring�����и���bean��idȡ������Ҫʹ�õ�userService����
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
