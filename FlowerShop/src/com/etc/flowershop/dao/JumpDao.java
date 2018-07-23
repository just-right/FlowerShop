package com.etc.flowershop.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.etc.flowershop.dto.BargainFlower;
import com.etc.flowershop.dto.Company;
import com.etc.flowershop.dto.Customer;
import com.etc.flowershop.dto.Flower;
import com.etc.flowershop.dto.FlowerKind;
import com.etc.flowershop.dto.OfficeInfo;
import com.etc.flowershop.dto.QAnswer;
import com.etc.flowershop.mybatis.JumpMapper;



@Repository("jumpdao")
public class JumpDao {
	@Autowired
	private JumpMapper jumpMapper;
	//public static void main(String[] args) throws ClassNotFoundException, SQLException {
		//Class.forName("com.mysql.jdbc.Driver");
		//DriverManager.getConnection("jdbc:mysql://localhost:3306/school","root","wangyong159111");

	//}
	public Company companyinfo() {
		// TODO Auto-generated method stub
		Company company = null;
		company = jumpMapper.companyinfo();
		return company;
	}

	public List<OfficeInfo> officeinfo() {
		// TODO Auto-generated method stub
		List<OfficeInfo> list = new ArrayList<OfficeInfo>();
		list = jumpMapper.officeinfo();
		return list;
	}
	public List<QAnswer> qanswer() {
		// TODO Auto-generated method stub
		List<QAnswer> list = new ArrayList<QAnswer>();
		list = jumpMapper.qanswer();
		return list;
	}
	
	public List<FlowerKind> flowerkind() {
		// TODO Auto-generated method stub
		List<FlowerKind> list = new ArrayList<FlowerKind>();
		list = jumpMapper.flowerkind();
		return list;
	}
	
	public List<Flower> flowers() {
		// TODO Auto-generated method stub
		List<Flower> list = new ArrayList<Flower>();
		list = jumpMapper.flowers();
		return list;
	}
	
	
	public Flower productdetail(int fid) {
		// TODO Auto-generated method stub
		Flower flower = null;
		flower =  jumpMapper.productdetail(fid);
		return flower;
	
	}
	
	public List<BargainFlower> bargainflower() {
		// TODO Auto-generated method stub
		List<BargainFlower> list = new ArrayList<BargainFlower>();
		list = jumpMapper.bargainflower();
		return list;

	}
	
	public BargainFlower getbargainflower(int fid) {
		// TODO Auto-generated method stub
		BargainFlower bargainFlower = null;
		bargainFlower = jumpMapper.getbargainflower(fid);
		return bargainFlower;

	}
	
	public List<Flower> selectProductsByPage(int startPos,int pageSize){
		List<Flower> flowers = new ArrayList<Flower>();
		flowers = jumpMapper.selectProductsByPage(startPos, pageSize);
		return flowers;
	}
	public int getProductsCount(){
		return jumpMapper.getProductsCount();
	}
	public List<Flower> search(String fname){
		List<Flower> flowers = new ArrayList<Flower>();
		flowers = jumpMapper.search(fname);
		return flowers;
	}

	public Customer userinfo(int uid){
		Customer customer = null;
		customer = jumpMapper.userinfo(uid);
		return customer;
	}

	
	
}
