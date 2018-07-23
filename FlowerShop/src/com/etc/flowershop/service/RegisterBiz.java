package com.etc.flowershop.service;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.etc.flowershop.dao.RegisterDao;
import com.etc.flowershop.dto.Customer;


@Service("registerbiz")
@Transactional(readOnly=false)
public class RegisterBiz {
	@Autowired
	private  RegisterDao dao;
	

	public void register(String uname, String email, String pwd, String phonenumber, int usertype, Date date) {
		// TODO Auto-generated method stub

		dao.register(uname, email, pwd, phonenumber, usertype, date);
	}
	public Customer checkname(String name){
		Customer customer = null;
		customer = dao.checkname(name);
		return customer;
	}
	
	public Customer checkemail(String email){
		Customer customer = null;
		customer = dao.checkemail(email);
		return customer;
	}
	public Customer checktel(String tel){
		Customer customer = null;
		customer = dao.checktel(tel);
		return customer;
	}
	public void insertaccount(float account,int uid){
		dao.insertaccount(account, uid);
	}
}
