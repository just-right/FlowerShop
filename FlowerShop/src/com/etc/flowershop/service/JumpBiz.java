package com.etc.flowershop.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.etc.flowershop.dao.JumpDao;
import com.etc.flowershop.dto.BargainFlower;
import com.etc.flowershop.dto.Company;
import com.etc.flowershop.dto.Customer;
import com.etc.flowershop.dto.Flower;
import com.etc.flowershop.dto.FlowerKind;
import com.etc.flowershop.dto.OfficeInfo;
import com.etc.flowershop.dto.QAnswer;


@Service("jumpbiz")
@Transactional(readOnly=false)
public class JumpBiz {
	@Autowired
	private  JumpDao dao;
	
	public Company companyinfo() {
		// TODO Auto-generated method stub
		return dao.companyinfo();
		
	}
	
	public List<OfficeInfo> officeinfo() {
		// TODO Auto-generated method stub
		return dao.officeinfo();
		
	}
	
	public List<QAnswer> qanswer() {
		// TODO Auto-generated method stub
		return dao.qanswer();
		
	}
	
	public List<FlowerKind> flowerkind() {
		// TODO Auto-generated method stub
		return dao.flowerkind();
		
	}
	
	public List<Flower> flowers() {
		// TODO Auto-generated method stub
		return dao.flowers();
		
	}
	
	public Flower productdetail(int fid) {
		// TODO Auto-generated method stub
		return dao.productdetail(fid);
		
	}
	
	public List<BargainFlower> bargainflower() {
		// TODO Auto-generated method stub
		return dao.bargainflower();
		
	}
	
	public BargainFlower getbargainflower(int fid) {
		// TODO Auto-generated method stub
		return dao.getbargainflower(fid);
		
	}
	
	public List<Flower> selectProductsByPage(int startPos,int pageSize){
		List<Flower> flowers = new ArrayList<Flower>();
		flowers = dao.selectProductsByPage(startPos, pageSize);
		return flowers;
	}
	public int getProductsCount(){
		return dao.getProductsCount();
	}
	public List<Flower> search(String fname){
		List<Flower> flowers = new ArrayList<Flower>();
		flowers = dao.search(fname);
		return flowers;
	}
	
	public Customer userinfo(int uid){
		Customer customer = null;
		customer  = dao.userinfo(uid);
		return customer;
	}
	

}
