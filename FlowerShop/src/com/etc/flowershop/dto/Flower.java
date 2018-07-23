package com.etc.flowershop.dto;

public class Flower {
	private int FlowerId;
	private String Name;
	private float Price;
	private String PicPath;
	private String Description;
	private int KindId;
	private int AvailabilityNum;
	private int BargainFlag;
	private int StockStatus;
	private int FlowerStatus;
	public int getFlowerId() {
		return FlowerId;
	}
	public void setFlowerId(int flowerId) {
		FlowerId = flowerId;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public float getPrice() {
		return Price;
	}
	public void setPrice(float price) {
		Price = price;
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
	public int getKindId() {
		return KindId;
	}
	public void setKindId(int kindId) {
		KindId = kindId;
	}
	public int getAvailabilityNum() {
		return AvailabilityNum;
	}
	public void setAvailabilityNum(int availabilityNum) {
		AvailabilityNum = availabilityNum;
	}
	public int getBargainFlag() {
		return BargainFlag;
	}
	public void setBargainFlag(int bargainFlag) {
		BargainFlag = bargainFlag;
	}
	public int getStockStatus() {
		return StockStatus;
	}
	public void setStockStatus(int stockStatus) {
		StockStatus = stockStatus;
	}
	public int getFlowerStatus() {
		return FlowerStatus;
	}
	public void setFlowerStatus(int flowerStatus) {
		FlowerStatus = flowerStatus;
	}
	
}
