package com.etc.flowershop.dto;

import java.sql.Date;

public class OrderInfo {

	private int InfoId;
	private int FlowerId;
	private int Quantity;
	private float FlowerPrice;
	private float Total;
	private String PayMethod;
	private int OrderId;
	private String FlowerName;
	private Date DateTime;
	
	public int getInfoId() {
		return InfoId;
	}
	public void setInfoId(int infoId) {
		InfoId = infoId;
	}
	public int getFlowerId() {
		return FlowerId;
	}
	public void setFlowerId(int flowerId) {
		FlowerId = flowerId;
	}
	public int getQuantity() {
		return Quantity;
	}
	public void setQuantity(int quantity) {
		Quantity = quantity;
	}
	public float getFlowerPrice() {
		return FlowerPrice;
	}
	public void setFlowerPrice(float flowerPrice) {
		FlowerPrice = flowerPrice;
	}
	public float getTotal() {
		return Total;
	}
	public void setTotal(float total) {
		Total = total;
	}
	public String getPayMethod() {
		return PayMethod;
	}
	public void setPayMethod(String payMethod) {
		PayMethod = payMethod;
	}
	public int getOrderId() {
		return OrderId;
	}
	public void setOrderId(int orderId) {
		OrderId = orderId;
	}
	public String getFlowerName() {
		return FlowerName;
	}
	public void setFlowerName(String flowerName) {
		FlowerName = flowerName;
	}
	public Date getDateTime() {
		return DateTime;
	}
	public void setDateTime(Date dateTime) {
		DateTime = dateTime;
	}
	
	
	
	
}
