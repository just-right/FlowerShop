package com.etc.flowershop.mybatis;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import com.etc.flowershop.dto.OrderSum;
import com.etc.flowershop.dto.PayMent;
import com.etc.flowershop.dto.ShoppingCart;
import com.etc.flowershop.dto.UserAccount;

public interface ShoppingMapper {
	public void shoppingcart(int flowerid,int quantity,float flowerprice,float total,int uid);
	public List<ShoppingCart> cartinfo(int uid);
	public void removecart(int fid,int uid);
	public void checkoutdeal(int uid,String name,String address,String city,String country,String email,String phonenumber,float totalprice,int paymethodid,Date date,Timestamp timestamp);
	public void removesumcart(int uid);
	public void orderinfo(int flowerid,int quantity,float flowerprice,float total,String paymethod,int orderid,String flowername);
	public OrderSum ordersum(Timestamp  date);
	public PayMent payment(int payid);
	public ShoppingCart judgecart(int fid,int uid);
	public void updatecart(int quantity,float total,int flowerid,int uid);
	public List<ShoppingCart> selectCartByPage(int uid,int startPos,int pageSize);
	public int getCartCount(int uid);
	public void updatefsum(int num,int fid);
	public UserAccount useraccount(int uid);
	public void updateaccount(float account,int uid);
	public UserAccount selectaccount(int uid);
}


