package com.etc.flowershop.mybatis;

import java.sql.Date;



import com.etc.flowershop.dto.Customer;
public interface RegisterMapper {
	public void register(String uname, String email, String pwd, String phonenumber, int usertype, Date date);
	public Customer checkname(String name);
	public Customer checkemail(String email);
	public Customer checktel(String tel);
	public void insertaccount(float account,int uid);
}
