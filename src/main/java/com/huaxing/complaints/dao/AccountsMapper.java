package com.huaxing.complaints.dao;

import java.util.List;

import com.huaxing.complaints.model.Accounts;

public interface AccountsMapper {
    int deleteByPrimaryKey(String id);

    int insert(Accounts account);

    int insertSelective(Accounts account);

    Accounts selectByPrimaryKey(String id);
    
    List<Accounts> selectAccounts(Accounts account);
    
    Accounts selectAccountsByFields(String id, String account, String password);
    
    String getPasswordByaccount(String account);

    int updateByPrimaryKeySelective(Accounts account);

    int updateByPrimaryKey(Accounts account);
    
    int updatePasswordByAccount(Accounts account);
}