package com.etc.flowershop.dao;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.etc.flowershop.dto.OrderSum;
import com.etc.flowershop.dto.PayMent;
import com.etc.flowershop.dto.ShoppingCart;
import com.etc.flowershop.dto.UserAccount;
import com.etc.flowershop.mybatis.ShoppingMapper;

@Repository("shoppingdao")
public class ShoppingDao {
	@Autowired
	private ShoppingMapper shoppingMapper;
	
	public void shoppingcart(int flowerid,int quantity,float flowerprice,float total,int uid){
		shoppingMapper.shoppingcart(flowerid, quantity, flowerprice, total, uid);
	}
	public List<ShoppingCart> cartinfo(int uid){
		List<ShoppingCart> list = new ArrayList<ShoppingCart>();
		list = shoppingMapper.cartinfo(uid);
		return list;
	}
	
	public void removecart(int fid,int uid){

		shoppingMapper.removecart(fid,uid);
		
	}
	
	public void checkoutdeal(int uid,String name,String address,String city,String country,String email,String phonenumber,float totalprice,int paymethodid,Date 
			date,Timestamp Timestamp){

		shoppingMapper.checkoutdeal(uid,name,address,city,country,email,phonenumber,totalprice,paymethodid,date,Timestamp);
		
	}

	public void removesumcart(int uid){
		shoppingMapper.removesumcart(uid);
	}
	public void orderinfo(int flowerid,int quantity,float flowerprice,float total,String paymethod,int orderid,String flowername){
		shoppingMapper.orderinfo(flowerid, quantity, flowerprice, total, paymethod, orderid, flowername);
	}
	
	public OrderSum ordersum(Timestamp timestamp ){
		OrderSum orderSum = null;
		orderSum = shoppingMapper.ordersum(timestamp);
		return orderSum;
	}
	public PayMent payment(int payid){
		PayMent payMent = null;
		payMent = shoppingMapper.payment(payid);
		return payMent;
	}
	public ShoppingCart judgecart(int fid,int uid){
		ShoppingCart shoppingCart = null;
		shoppingCart = shoppingMapper.judgecart(fid, uid);
		return shoppingCart;
	}
	public void updatecart(int quantity,float total,int flowerid,int uid){
		shoppingMapper.updatecart(quantity, total, flowerid, uid);
	}
	
	public List<ShoppingCart> selectCartByPage(int uid,int startPos,int pageSize){
		List<ShoppingCart> list = new ArrayList<ShoppingCart>();
		list = shoppingMapper.selectCartByPage(uid,startPos,pageSize);
		return list;
	}
	public int getCartCount(int uid){
		return shoppingMapper.getCartCount(uid);
	}
	public void updatefsum(int num,int fid){
		shoppingMapper.updatefsum(num, fid);
	}
	public UserAccount useraccount(int uid){
		UserAccount userAccount = null;
		userAccount = shoppingMapper.useraccount(uid);
		return userAccount;
	}
	public void updateaccount(float account,int uid){
		shoppingMapper.updateaccount(account, uid);
	}
	public UserAccount selectaccount(int uid){
		UserAccount userAccount = null;
		userAccount = shoppingMapper.selectaccount(uid);
		return userAccount;
	}
}
