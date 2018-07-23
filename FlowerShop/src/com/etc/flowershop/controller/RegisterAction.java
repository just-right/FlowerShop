package com.etc.flowershop.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etc.flowershop.dto.BargainFlower;
import com.etc.flowershop.dto.Customer;
import com.etc.flowershop.dto.Flower;
import com.etc.flowershop.dto.FlowerKind;
import com.etc.flowershop.dto.Page;
import com.etc.flowershop.service.JumpBiz;
import com.etc.flowershop.service.LoginBiz;
import com.etc.flowershop.service.RegisterBiz;
import com.etc.flowershop.util.GetBean;


@Controller
@RequestMapping("/registerAction")
public class RegisterAction {
	
	@RequestMapping("/register")
	public String register(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		List<Flower> pageflowerslist = new ArrayList<Flower>();
		List<FlowerKind> list = new ArrayList<FlowerKind>();
		JumpBiz jbiz = (JumpBiz) GetBean.getContext().getBean("jumpbiz");
		
		Page page = null;	
		int totalCount = jbiz.getProductsCount();
		System.out.println();
		page = new Page(totalCount, 1);
		pageflowerslist = jbiz.selectProductsByPage(page.getStartPos(), page.getPageSize());
		request.setAttribute("page", page);
		
		list = jbiz.flowerkind();
	 	request.setAttribute("flowerkindlist",list);
	 	

		
	 	for (int i=0;i<pageflowerslist.size();i++){
	 		if (pageflowerslist.get(i).getBargainFlag()==1){
	 			BargainFlower bargainflowerprice = null;
	 			int Bfid= pageflowerslist.get(i).getFlowerId();
	 			bargainflowerprice = jbiz.getbargainflower(Bfid);
	 			float price = bargainflowerprice.getBargainPrice();
	 			pageflowerslist.get(i).setPrice(price);
	 		}
	 	
	 	}
	 	
	 	request.setAttribute("flowerlist",pageflowerslist);
	 	
	 	List<BargainFlower> bargainlist = new ArrayList<BargainFlower>();
	 	bargainlist = jbiz.bargainflower();
	 	
		request.setAttribute("bargainprice", bargainlist.get(0).getBargainPrice());
		
	 	
	 	int fid = bargainlist.get(0).getFlowerId();
	 	
	 	Flower bargainflower = null;
	 	bargainflower = jbiz.productdetail(fid);
	 	request.setAttribute("bargainflower", bargainflower);
	 	
	 	
		
		
		String name = new String(request.getParameter("Name").getBytes("iso-8859-1"),"utf-8");;
		
		String email = new String(request.getParameter("Email").getBytes("iso-8859-1"),"utf-8");;
		
		String pwd = new String(request.getParameter("Password2").getBytes("iso-8859-1"),"utf-8");;
		
		String phonenumber = new String(request.getParameter("PhoneNumber").getBytes("iso-8859-1"),"utf-8");;
		int userType = 1;
		System.out.println(name);
		System.out.println(email);
		System.out.println(pwd);
		System.out.println(phonenumber);
	
		Date RegisterDate = new Date(System.currentTimeMillis());
		System.out.println(RegisterDate);
	 	RegisterBiz biz = (RegisterBiz) GetBean.getContext().getBean("registerbiz");
	 
	 	biz.register(name, email, pwd, phonenumber, userType, RegisterDate);
		System.out.println(pwd);
		LoginBiz loginBiz = (LoginBiz) GetBean.getContext().getBean("loginbiz");
		Customer customer = loginBiz.login(name, pwd);
		float account = 0;
		biz.insertaccount(account, customer.getUId());
		HttpSession session = request.getSession();
 		session.setAttribute("uid", customer.getUId());
 		session.setAttribute("username", name);
 		session.setAttribute("pwd", pwd);
	 	return "main.jsp";
	 	

	}
	
	@RequestMapping(value = "/checkname")
	@ResponseBody
	public  String  checkname(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//System.out.println("start");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String uname = request.getParameter("Userame");
		Customer customer = null;
		String result= "";
		RegisterBiz biz = (RegisterBiz) GetBean.getContext().getBean("registerbiz");
		customer = biz.checkname(uname);
		
		if (customer!=null){
			result = "fail";
		}
		else{
			result = "ok";
		}
		response.setContentType("text/html;charset=UTF-8");
		return result;
		
	}
	
	
	@RequestMapping(value = "/checktel")
	@ResponseBody
	public  String  checktel(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//System.out.println("start");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String tel = request.getParameter("PhoneNumber");
		Customer customer = null;
		String result= "";
		RegisterBiz biz = (RegisterBiz) GetBean.getContext().getBean("registerbiz");
		customer = biz.checktel(tel);
		
		if (customer!=null){
			result = "fail";
		}
		else{
			result = "ok";
		}
		response.setContentType("text/html;charset=UTF-8");
		return result;
		
	}
	
	
	@RequestMapping(value = "/checkemail")
	@ResponseBody
	public  String  checkemail(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//System.out.println("start");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String email = request.getParameter("Email");
		Customer customer = null;
		String result= "";
		RegisterBiz biz = (RegisterBiz) GetBean.getContext().getBean("registerbiz");
		customer = biz.checkemail(email);
		
		if (customer!=null){
			result = "fail";
		}
		else{
			result = "ok";
		}
		response.setContentType("text/html;charset=UTF-8");
		return result;
		
	}

}
