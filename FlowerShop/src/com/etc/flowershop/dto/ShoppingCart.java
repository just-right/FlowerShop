package com.etc.flowershop.dto;

public class ShoppingCart {

	private int ItemId;
	private int FlowerId;
	private int Quantity;
	private float FlowerPrice;
	private float Total;
	private int UId;
	public int getItemId() {
		return ItemId;
	}
	public void setItemId(int itemId) {
		ItemId = itemId;
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
	public int getUId() {
		return UId;
	}
	public void setUId(int uId) {
		UId = uId;
	}
	
	
}
