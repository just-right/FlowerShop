package com.etc.flowershop.controller;


import java.io.IOException;
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
import com.etc.flowershop.dto.ShoppingCart;
import com.etc.flowershop.service.JumpBiz;
import com.etc.flowershop.service.LoginBiz;
import com.etc.flowershop.service.ShoppingBiz;
import com.etc.flowershop.util.GetBean;

import net.sf.json.JSONObject;

@Controller
@RequestMapping("/loginAction")

public class LoginAction {
	
	@RequestMapping(value = "/login")
	@ResponseBody
	public  String  loginDeal(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//System.out.println("start");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String uname = request.getParameter("Userame");
		String pwd = request.getParameter("Password");
	 	request.setAttribute("result", "sucess");   
		List<Flower> flowerslist = new ArrayList<Flower>();
		List<Flower> pageflowerslist = new ArrayList<Flower>();
	
	 	LoginBiz biz = (LoginBiz) GetBean.getContext().getBean("loginbiz");
	 	ShoppingBiz shoppingBiz = (ShoppingBiz) GetBean.getContext().getBean("shoppingbiz");
		//System.out.println("start");
	 	Customer customer = biz.login(uname, pwd);
	

	 	System.out.println(uname);
	 	System.out.println(pwd);
		JumpBiz jbiz = (JumpBiz) GetBean.getContext().getBean("jumpbiz");
		List<FlowerKind> list = new ArrayList<FlowerKind>();

		
		Page page = null;	
		int totalCount = jbiz.getProductsCount();
		page = new Page(totalCount, 1);
		pageflowerslist = jbiz.selectProductsByPage(page.getStartPos(), page.getPageSize());
		request.setAttribute("page", page);
		
		
	 	list = jbiz.flowerkind();
	 	request.setAttribute("flowerkindlist",list);
	 	

	 
	 	flowerslist = jbiz.flowers();
	 	
	
	 
		
	 	for (int i=0;i<flowerslist.size();i++){
	 		if (flowerslist.get(i).getBargainFlag()==1){
	 			BargainFlower bargainflowerprice = null;
	 			int Bfid= flowerslist.get(i).getFlowerId();
	 			bargainflowerprice = jbiz.getbargainflower(Bfid);
	 			float price = bargainflowerprice.getBargainPrice();
	 			flowerslist.get(i).setPrice(price);
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
	 	
	 	
	 	
	 	

	 
	 	String result= "";
	 	JSONObject jsonObject = new JSONObject();
	 	if (customer!=null){
	 		HttpSession session = request.getSession();
	 		session.setAttribute("uid", customer.getUId());
	 		session.setAttribute("username", uname);
	 		session.setAttribute("pwd", pwd);
	 		List<ShoppingCart> shoppingCarts = new ArrayList<ShoppingCart>();
	 		int uid = (int) session.getAttribute("uid");
	 		shoppingCarts = shoppingBiz.cartinfo(uid);
	 		if (shoppingCarts!=null){
	 			session.setAttribute("cartid", shoppingCarts.size());
	 		}
	 		result = "ok";
	 		jsonObject.put("result", "ok");
	 		System.err.println(result);
	 		System.err.println(jsonObject.get("result"));
	 		response.setContentType("text/html;charset=UTF-8");
	 		//response.getWriter().write(result);	
	
	 	} else{ 
	 		result = "fail";
	 		jsonObject.put("result", "fail");
	 		System.err.println(result);
	 		System.err.println(jsonObject.get("result"));
	 		response.setContentType("text/html;charset=UTF-8");
	 		//response.getWriter().write(result);	
	 	}
	 	System.err.println(jsonObject);
	 	return result;
	

		/*System.out.println(request.getParameter("name"));
        Map<String,String> map = new HashMap<String,String>();

        if(request.getParameter("name").equals("123")){
            System.out.println("成功");
            map.put("msg", "成功");
        }else{
            System.out.println("失败");
            map.put("msg", "失败");
        }
       return map;*/
        
    }
	


}
