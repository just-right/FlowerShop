package com.etc.flowershop.dto;

import java.sql.Date;

public class Customer {
	private int UId;
	private String Name;
	private String Email;
	private String Password;
	private String PhoneNumber;
	private int UserType;
	private Date RegisterDate;
	
	public int getUId() {
		return UId;
	}
	public void setUId(int uId) {
		UId = uId;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	public String getPhoneNumber() {
		return PhoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}
	public int getUserType() {
		return UserType;
	}
	public void setUserType(int userType) {
		UserType = userType;
	}
	public Date getRegisterDate() {
		return RegisterDate;
	}
	public void setRegisterDate(Date registerDate) {
		RegisterDate = registerDate;
	}
	
	
}
