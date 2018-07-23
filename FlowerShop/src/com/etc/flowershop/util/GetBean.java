package com.etc.flowershop.util;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class GetBean {

	static ApplicationContext ac;

	static{
		ac = new ClassPathXmlApplicationContext("applicationContext.xml");
	}

	public static ApplicationContext getContext(){
		return  ac;
	}
}
