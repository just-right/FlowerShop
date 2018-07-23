package com.etc.flowershop.mybatis;

import com.etc.flowershop.dto.Customer;

public interface LoginMapper {
	public Customer login(String uname,String pwd);
}
