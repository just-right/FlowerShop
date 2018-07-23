package com.etc.flowershop.mybatis;

import java.util.List;

import com.etc.flowershop.dto.BargainFlower;
import com.etc.flowershop.dto.Company;
import com.etc.flowershop.dto.Customer;
import com.etc.flowershop.dto.Flower;
import com.etc.flowershop.dto.FlowerKind;
import com.etc.flowershop.dto.OfficeInfo;
import com.etc.flowershop.dto.QAnswer;



public interface JumpMapper {
	public Company companyinfo();
	public List<OfficeInfo> officeinfo();
	public List<QAnswer> qanswer();
	public List<FlowerKind> flowerkind();
	public List<Flower> flowers();
	public Flower productdetail(int fid);
	public List<BargainFlower> bargainflower();
	public BargainFlower getbargainflower(int fid);
	public List<Flower> selectProductsByPage(int startPos,int pageSize);
	public int getProductsCount();
	public List<Flower> search(String fname);
	public Customer userinfo(int uid);
}
