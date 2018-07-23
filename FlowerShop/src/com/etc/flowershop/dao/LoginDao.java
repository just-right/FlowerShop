package com.etc.flowershop.dao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.etc.flowershop.dto.Customer;
import com.etc.flowershop.mybatis.LoginMapper;

@Repository("logindao")
public class LoginDao {
	@Autowired
	private LoginMapper loginMapper;
	//public static void main(String[] args) throws ClassNotFoundException, SQLException {
		//Class.forName("com.mysql.jdbc.Driver");
		//DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","wangyong159111");

	//}
	public Customer login(String uname,String pwd) {
		// TODO Auto-generated method stub
		Customer tuser = null;
		tuser = loginMapper.login(uname, pwd);
		return tuser;
	}
}
