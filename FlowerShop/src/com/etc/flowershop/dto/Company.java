package com.etc.flowershop.dto;

public class Company {
	private int CompanyId;
	private String Name;
	private String Address;
	private String PicPath;
	private String Description;
	
	public int getCompanyId() {
		return CompanyId;
	}
	public void setCompanyId(int companyId) {
		CompanyId = companyId;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getPicPath() {
		return PicPath;
	}
	public void setPicPath(String picPath) {
		PicPath = picPath;
	}
	public String getDescription() {
		return Description;
	}
	public void setDescription(String description) {
		Description = description;
	}
	

}
