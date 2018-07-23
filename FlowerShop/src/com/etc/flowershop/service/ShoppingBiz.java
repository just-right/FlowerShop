package com.etc.flowershop.service;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.etc.flowershop.dao.ShoppingDao;
import com.etc.flowershop.dto.OrderSum;
import com.etc.flowershop.dto.PayMent;
import com.etc.flowershop.dto.ShoppingCart;
import com.etc.flowershop.dto.UserAccount;

@Service("shoppingbiz")
@Transactional(readOnly=false)
public class ShoppingBiz {
	@Autowired
	private  ShoppingDao dao;
	public void shoppingcart(int flowerid,int quantity,float flowerprice,float total,int uid){
		dao.shoppingcart(flowerid, quantity, flowerprice, total, uid);
	}
	
	public List<ShoppingCart> cartinfo(int uid){
		return dao.cartinfo(uid);
	}
	
	public void removecart(int fid,int uid){
		 dao.removecart(fid,uid);
	}
	
	public void checkoutdeal(int uid,String name,String address,String city,String country,String email,String phonenumber,float totalprice,int paymethodid,Date date,Timestamp timestamp){
		 dao.checkoutdeal(uid,name,address,city,country,email,phonenumber,totalprice,paymethodid,date,timestamp);
	}
	
	public void removesumcart(int uid){
		dao.removesumcart(uid);
	}
	public void orderinfo(int flowerid,int quantity,float flowerprice,float total,String paymethod,int orderid,String flowername){
		dao.orderinfo(flowerid, quantity, flowerprice, total, paymethod, orderid, flowername);
	}
	public OrderSum ordersum(Timestamp timestamp ){
		return dao.ordersum(timestamp);
	}
	public PayMent payment(int payid){
		return dao.payment(payid);
	}
	
	public ShoppingCart judgecart(int fid,int uid){
		return dao.judgecart(fid, uid);
	}
	public void updatecart(int quantity,float total,int flowerid,int uid){
		dao.updatecart(quantity, total, flowerid, uid);
	}
	
	public List<ShoppingCart> selectCartByPage(int uid,int startPos,int pageSize){
		return dao.selectCartByPage(uid,startPos,pageSize);
	}
	public int getCartCount(int uid){
		return dao.getCartCount(uid);
	}
	public void updatefsum(int num,int fid){
		dao.updatefsum(num, fid);
	}
	public UserAccount useraccount(int uid){
		UserAccount userAccount = null;
		userAccount = dao.useraccount(uid);
		return userAccount;
	}
	public void updateaccount(float account,int uid){
		dao.updateaccount(account, uid);
	}
	public UserAccount selectaccount(int uid){
		UserAccount userAccount = null;
		userAccount = dao.selectaccount(uid);
		return userAccount;
	}

}


