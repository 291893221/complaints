package com.huaxing.complaints.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.huaxing.complaints.dao.AccountsMapper;
import com.huaxing.complaints.model.Accounts;
import com.huaxing.complaints.service.AccountsService;

@Service("accountsService")
public class AccountsServiceImpl implements AccountsService {
	@Autowired
	private AccountsMapper accountsMapper;

	public List<Accounts> getAllAccounts() {
		return accountsMapper.selectAccounts(null);
	}

	public Accounts getAccountsById(String id) {
		return accountsMapper.selectByPrimaryKey(id);
	}

	public boolean checkAccount(Accounts account) {
		String password = accountsMapper.getPasswordByaccount(account.getAccount());
		if (password != null && password.equals(account.getPassword())) {
			return true;
		}
		return false;
	}

	public String addAccounts(Accounts accounts) {
		int insert = accountsMapper.insert(accounts);
		return String.valueOf(insert);
	}

	public String editPassword(Accounts account) {
		int update = accountsMapper.updatePasswordByAccount(account);
		if (update == 1) {
			return "{'success': true, 'message': '–ﬁ∏ƒ√‹¬Î≥…π¶!'} ";
		}
		return "{'success': false, 'message': '–ﬁ∏ƒ√‹¬Î ß∞‹!'} ";
	}
}
