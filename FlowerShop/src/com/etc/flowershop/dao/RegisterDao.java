package com.etc.flowershop.dao;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.etc.flowershop.dto.Customer;
import com.etc.flowershop.mybatis.RegisterMapper;

@Repository("registerdao")
public class RegisterDao {
	@Autowired
	private RegisterMapper registerMapper;
	//public static void main(String[] args) throws ClassNotFoundException, SQLException {
		//Class.forName("com.mysql.jdbc.Driver");
		//DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","wangyong159111");

	//}
	public void register(String uname, String email, String pwd, String phonenumber, int usertype, Date date) {
		// TODO Auto-generated method stub
	
		registerMapper.register(uname, email, pwd, phonenumber, usertype, date);
	}
	public Customer checkname(String name){
		Customer customer = null;
		customer = registerMapper.checkname(name);
		return customer;
	}
	
	public Customer checkemail(String email){
		Customer customer = null;
		customer = registerMapper.checkemail(email);
		return customer;
	}
	public Customer checktel(String tel){
		Customer customer = null;
		customer = registerMapper.checktel(tel);
		return customer;
	}
	public void insertaccount(float account,int uid){
		registerMapper.insertaccount(account, uid);
	}
}
