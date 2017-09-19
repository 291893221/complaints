package com.huaxing.complaints.service;

import java.util.List;

import com.huaxing.complaints.model.Accounts;

public interface AccountsService {
	public List<Accounts> getAllAccounts();
	
	public Accounts getAccountsById(String id);
	
	public boolean checkAccount(Accounts account);
	
	public String editPassword(Accounts account);

	public String addAccounts(Accounts accounts);
}
