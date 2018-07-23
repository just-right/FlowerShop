package com.etc.flowershop.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.etc.flowershop.dao.LoginDao;
import com.etc.flowershop.dto.Customer;


@Service("loginbiz")
@Transactional(readOnly=true)
public class LoginBiz {
	@Autowired
	private  LoginDao dao;
	

	public Customer login(String uname, String pwd) {
		// TODO Auto-generated method stub

		return dao.login(uname,pwd);
	}

}
