package com.etc.flowershop.dto;

public class BargainFlower {
	private int BargainId;
	private int FlowerId;
	private float Discount;
	private float BargainPrice;
	private String Note;
	public int getBargainId() {
		return BargainId;
	}
	public void setBargainId(int bargainId) {
		BargainId = bargainId;
	}
	public int getFlowerId() {
		return FlowerId;
	}
	public void setFlowerId(int flowerId) {
		FlowerId = flowerId;
	}
	public float getDiscount() {
		return Discount;
	}
	public void setDiscount(float discount) {
		Discount = discount;
	}
	public float getBargainPrice() {
		return BargainPrice;
	}
	public void setBargainPrice(float bargainPrice) {
		BargainPrice = bargainPrice;
	}
	public String getNote() {
		return Note;
	}
	public void setNote(String note) {
		Note = note;
	}
	
}
