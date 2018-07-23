package com.etc.flowershop.dto;

import java.sql.Date;
import java.sql.Timestamp;


public class OrderSum {
	private int OrderId;
	private int UId;
	private String Name;
	private String Address;
	private String City;
	private String Country;
	private String Email;
	private String PhoneNumber;
	private float TotalPrice;
	private int PayMethodId;
	private Date DateTime;
	private Timestamp Timestamp;
	
	public Date getDateTime() {
		return DateTime;
	}
	public void setDateTime(Date dateTime) {
		DateTime = dateTime;
	}
	public int getOrderId() {
		return OrderId;
	}
	public void setOrderId(int orderId) {
		OrderId = orderId;
	}
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
	public String getAddress() {
		return Address;
	}
	public void setAddress(String address) {
		Address = address;
	}
	public String getCity() {
		return City;
	}
	public void setCity(String city) {
		City = city;
	}
	public String getCountry() {
		return Country;
	}
	public void setCountry(String country) {
		Country = country;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPhoneNumber() {
		return PhoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		PhoneNumber = phoneNumber;
	}
	public float getTotalPrice() {
		return TotalPrice;
	}
	public void setTotalPrice(float totalPrice) {
		TotalPrice = totalPrice;
	}
	public int getPayMethodId() {
		return PayMethodId;
	}
	public void setPayMethodId(int payMethodId) {
		PayMethodId = payMethodId;
	}
	public Timestamp getTimestamp() {
		return Timestamp;
	}
	public void setTimestamp(Timestamp timestamp) {
		Timestamp = timestamp;
	}
	
}
