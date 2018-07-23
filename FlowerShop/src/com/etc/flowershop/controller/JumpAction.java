                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                package com.etc.flowershop.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.etc.flowershop.dto.BargainFlower;
import com.etc.flowershop.dto.Company;
import com.etc.flowershop.dto.Customer;
import com.etc.flowershop.dto.Flower;
import com.etc.flowershop.dto.FlowerKind;
import com.etc.flowershop.dto.OfficeInfo;
import com.etc.flowershop.dto.Page;
import com.etc.flowershop.dto.Page2;
import com.etc.flowershop.dto.QAnswer;
import com.etc.flowershop.dto.ShoppingCart;
import com.etc.flowershop.dto.UserAccount;
import com.etc.flowershop.service.JumpBiz;

import com.etc.flowershop.service.ShoppingBiz;
import com.etc.flowershop.util.GetBean;



@Controller
@RequestMapping("/jumpAction")
public class JumpAction {

	@RequestMapping("/main")
	public String main(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		JumpBiz biz = (JumpBiz) GetBean.getContext().getBean("jumpbiz");
		List<FlowerKind> list = new ArrayList<FlowerKind>();

	 	list = biz.flowerkind();
	 	request.setAttribute("flowerkindlist",list);

		List<Flower> pageflowerslist = new ArrayList<Flower>();
	
	 	
	 	
		Page page = null;	
		int totalCount = biz.getProductsCount();
		page = new Page(totalCount, 1);
		pageflowerslist = biz.selectProductsByPage(page.getStartPos(), page.getPageSize());

		request.setAttribute("page", page);
	 	
	 	List<BargainFlower> bargainlist = new ArrayList<BargainFlower>();
	 	bargainlist = biz.bargainflower();
	 	
	 	request.setAttribute("bargainprice", bargainlist.get(0).getBargainPrice());
	 	
	 	
	 	int fid = bargainlist.get(0).getFlowerId();
	 	Flower bargainflower = null;
	 	bargainflower = biz.productdetail(fid);
	 	request.setAttribute("bargainflower", bargainflower);
	 	
	 	
	 	for (int i=0;i<pageflowerslist.size();i++){
	 		if (pageflowerslist.get(i).getBargainFlag()==1){
	 			BargainFlower bargainflowerprice = null;
	 			int Bfid= pageflowerslist.get(i).getFlowerId();
	 			bargainflowerprice = biz.getbargainflower(Bfid);
	 			float price = bargainflowerprice.getBargainPrice();
	 			pageflowerslist.get(i).setPrice(price);
	 		}
	 	
	 	}
		request.setAttribute("flowerlist",pageflowerslist);

		return "main.jsp";
	}
	
	@RequestMapping("/products")
	public String products(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		JumpBiz biz = (JumpBiz) GetBean.getContext().getBean("jumpbiz");
		List<FlowerKind> list = new ArrayList<FlowerKind>();
		List<Flower> pageflowerslist = new ArrayList<Flower>();
	 	list = biz.flowerkind();
	 	request.setAttribute("flowerkindlist",list);
	 	
		Page page = null;	
		int totalCount = biz.getProductsCount();
		page = new Page(totalCount, 1);
		pageflowerslist = biz.selectProductsByPage(page.getStartPos(), page.getPageSize());
		request.setAttribute("page", page);
		
		
		List<Flower> flowerslist = new ArrayList<Flower>();
	 	flowerslist = biz.flowers();
	 	request.setAttribute("flowerlist",pageflowerslist);
	 	
	
		
		
		for (int i=0;i<flowerslist.size();i++){
	 		if (flowerslist.get(i).getBargainFlag()==1){
	 			BargainFlower bargainflowerprice = null;
	 			int Bfid= flowerslist.get(i).getFlowerId();
	 			bargainflowerprice = biz.getbargainflower(Bfid);
	 			float price = bargainflowerprice.getBargainPrice();
	 			flowerslist.get(i).setPrice(price);
	 		}
	 	
	 	}
		
		List<BargainFlower> bargainlist = new ArrayList<BargainFlower>();
	 	bargainlist = biz.bargainflower();
	 	
	 	request.setAttribute("bargainprice", bargainlist.get(0).getBargainPrice());
		int fid = bargainlist.get(0).getFlowerId();
	 	Flower bargainflower = null;
	 	bargainflower = biz.productdetail(fid);
	 	request.setAttribute("bargainflower", bargainflower);
	 	
		return "products.jsp";
	}
	
	@RequestMapping("/checkout")
	public String checkout(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		JumpBiz biz = (JumpBiz) GetBean.getContext().getBean("jumpbiz");
		ShoppingBiz shoppingBiz = (ShoppingBiz) GetBean.getContext().getBean("shoppingbiz");
		List<FlowerKind> list = new ArrayList<FlowerKind>();
		List<ShoppingCart> shoppingCarts = new ArrayList<ShoppingCart>();
		float sumpay = 0;	
	 	list = biz.flowerkind();
	 	request.setAttribute("flowerkindlist",list);
	 	
		List<BargainFlower> bargainlist = new ArrayList<BargainFlower>();
	 	bargainlist = biz.bargainflower();
	 	
	 	request.setAttribute("bargainprice", bargainlist.get(0).getBargainPrice());
		int fid = bargainlist.get(0).getFlowerId();
	 	Flower bargainflower = null;
	 	bargainflower = biz.productdetail(fid);
	 	request.setAttribute("bargainflower", bargainflower);
	 	
	 	HttpSession httpSession = request.getSession();
	 	int uid = (int)httpSession.getAttribute("uid");
	 	shoppingCarts = shoppingBiz.cartinfo(uid);
		for (int i=0;i<shoppingCarts.size();i++){
			sumpay+=shoppingCarts.get(i).getTotal();
		}
		System.out.println(sumpay);
		request.setAttribute("sumpay", sumpay);
	 	
		return "checkout.jsp";
	}
	
	@RequestMapping("/login")
	public String login(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession httpSession = request.getSession();
		httpSession.removeAttribute("uid");
		httpSession.removeAttribute("uname");
		httpSession.removeAttribute("pwd");
		return "login.jsp";
	}
	
	
	@RequestMapping("/contact")
	public String contact(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		JumpBiz jbiz = (JumpBiz) GetBean.getContext().getBean("jumpbiz");
		List<FlowerKind> kindlist = new ArrayList<FlowerKind>();
		kindlist = jbiz.flowerkind();
	 	request.setAttribute("flowerkindlist",kindlist);
	 	
	 	JumpBiz biz = (JumpBiz) GetBean.getContext().getBean("jumpbiz");
	 	Company company = biz.companyinfo();
	 	request.setAttribute("Name", company.getName());
	 	request.setAttribute("Address", company.getAddress());
	 	request.setAttribute("PicPath", company.getPicPath());
	 	request.setAttribute("Description", company.getDescription());
	 	

		List<OfficeInfo> list = new ArrayList<OfficeInfo>();
	 	list = biz.officeinfo();
	 	request.setAttribute("officelist",list);
	 	//System.out.println(list.size());
	 	//System.out.println(list.get(0).getEmail());
	 	
		List<BargainFlower> bargainlist = new ArrayList<BargainFlower>();
	 	bargainlist = biz.bargainflower();
	 	
	 	request.setAttribute("bargainprice", bargainlist.get(0).getBargainPrice());
		int fid = bargainlist.get(0).getFlowerId();
	 	Flower bargainflower = null;
	 	bargainflower = biz.productdetail(fid);
	 	request.setAttribute("bargainflower", bargainflower);
		return "contact.jsp";
	}
	
	@RequestMapping("/faqs")
	public String faqs(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		JumpBiz jbiz = (JumpBiz) GetBean.getContext().getBean("jumpbiz");
		List<FlowerKind> kindlist = new ArrayList<FlowerKind>();
		kindlist = jbiz.flowerkind();
	 	request.setAttribute("flowerkindlist",kindlist);
	 	
		JumpBiz biz = (JumpBiz) GetBean.getContext().getBean("jumpbiz");
		List<QAnswer> list = new ArrayList<QAnswer>();
	 	list = biz.qanswer();
	 	request.setAttribute("answerlist",list);
	 	//System.out.println(list.size());
	 	//System.out.println(list.get(0).getNote());
		List<BargainFlower> bargainlist = new ArrayList<BargainFlower>();
	 	bargainlist = biz.bargainflower();
	 	
	 	request.setAttribute("bargainprice", bargainlist.get(0).getBargainPrice());
		int fid = bargainlist.get(0).getFlowerId();
	 	Flower bargainflower = null;
	 	bargainflower = biz.productdetail(fid);
	 	request.setAttribute("bargainflower", bargainflower);
		return "faqs.jsp";
	}
	
	@RequestMapping("/productdetail")
	public String productdetail(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int fid = Integer.parseInt(request.getParameter("fid"));
		JumpBiz biz = (JumpBiz) GetBean.getContext().getBean("jumpbiz");
		Flower flower = null;
		flower = biz.productdetail(fid);
		if (flower.getAvailabilityNum()>0){
			request.setAttribute("StockStatus", "In Stock");
		}
		else{
			request.setAttribute("StockStatus", "No Stock");
		}
		

		if (flower.getBargainFlag()==1){
	 			BargainFlower bargainflowerprice = null;
	 			int Bfid= flower.getFlowerId();
	 			bargainflowerprice = biz.getbargainflower(Bfid);
	 			float price = bargainflowerprice.getBargainPrice();
	 			flower.setPrice(price);
	 	}
	 	
	 	
		
		request.setAttribute("flower", flower);
		
		
		
		
		List<FlowerKind> kindlist = new ArrayList<FlowerKind>();
		kindlist = biz.flowerkind();
	 	request.setAttribute("flowerkindlist",kindlist);
	
		List<BargainFlower> bargainlist = new ArrayList<BargainFlower>();
	 	bargainlist = biz.bargainflower();
	 	
	 	request.setAttribute("bargainprice", bargainlist.get(0).getBargainPrice());
		
	 	
	 	
	 	int flowerid = bargainlist.get(0).getFlowerId();
	 	Flower bargainflower = null;
	 	
	 	bargainflower = biz.productdetail(flowerid);
	 	request.setAttribute("bargainflower", bargainflower);
		return "productdetail.jsp";
	}
	
	@RequestMapping("/quit")
	public String quit(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession httpSession = request.getSession();
		httpSession.removeAttribute("uid");
		httpSession.removeAttribute("uname");
		httpSession.removeAttribute("pwd");
		return "login.jsp";
	}

	@RequestMapping("/ProductPageDeal")
	public String  showProductsByPage(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String pageNow = request.getParameter("pageNow");
		List<FlowerKind> flowerkindlist = new ArrayList<FlowerKind>();
	 	List<BargainFlower> bargainlist = new ArrayList<BargainFlower>();
		Page page = null;
	 
		List<Flower> flowers = new ArrayList<Flower>();
		JumpBiz biz = (JumpBiz) GetBean.getContext().getBean("jumpbiz");
		int totalCount = (int) biz.getProductsCount();
	 
		if (pageNow != null) {
			page = new Page(totalCount, Integer.parseInt(pageNow));
			flowers = biz.selectProductsByPage(page.getStartPos(), page.getPageSize());
		} else {
			page = new Page(totalCount, 1);
			flowers = biz.selectProductsByPage(page.getStartPos(), page.getPageSize());
		}
	 	for (int i=0;i<flowers.size();i++){
	 		if (flowers.get(i).getBargainFlag()==1){
	 			BargainFlower bargainflowerprice = null;
	 			int Bfid= flowers.get(i).getFlowerId();
	 			bargainflowerprice = biz.getbargainflower(Bfid);
	 			float price = bargainflowerprice.getBargainPrice();
	 			flowers.get(i).setPrice(price);
	 		}
	 	
	 	}
		request.setAttribute("flowerlist", flowers);
		request.setAttribute("page", page);
		
		
		
		
		flowerkindlist = biz.flowerkind();
	 	request.setAttribute("flowerkindlist",flowerkindlist);

	 	bargainlist = biz.bargainflower();
		request.setAttribute("bargainprice", bargainlist.get(0).getBargainPrice());
		
		int fid = bargainlist.get(0).getFlowerId();
	 	
	 	Flower bargainflower = null;
	 	bargainflower = biz.productdetail(fid);
	 	request.setAttribute("bargainflower", bargainflower);
		
		return "main.jsp";
	}
	
	@RequestMapping(value = "/checkquantity")
	@ResponseBody
	public String checkquantity(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//System.out.println("start");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Flower flower = null;
		HttpSession httpSession = request.getSession();
		int uid = (int)(httpSession.getAttribute("uid"));
		int fid = Integer.parseInt(request.getParameter("fid"));
		int fquantity = Integer.parseInt(request.getParameter("fquantity"));
		int flagquantity = Integer.parseInt(request.getParameter("flagquantity"));
		float price =  Float.parseFloat(request.getParameter("price"));
		JumpBiz jumpBiz = (JumpBiz)GetBean.getContext().getBean("jumpbiz");
		int quantity = 0;
		flower = jumpBiz.productdetail(fid);
		String num = "";
		if (flower.getAvailabilityNum()+flagquantity>=fquantity){
			 quantity = fquantity - flagquantity;
		
			float total = quantity*price;
		
			ShoppingBiz shoppingBiz = (ShoppingBiz)GetBean.getContext().getBean("shoppingbiz");
		
			shoppingBiz.updatecart(quantity, total, fid, uid);
			num = String.valueOf(flower.getAvailabilityNum()+flagquantity);
		}
		else{
			num = String.valueOf(flower.getAvailabilityNum()+flagquantity);
			//System.err.println(num);
		}
	
		
		return num;
	}
	
	@RequestMapping(value = "/checkquantity2")
	@ResponseBody
	public String checkquantity2(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//System.out.println("start");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		Flower flower = null;

		int fid = Integer.parseInt(request.getParameter("fid"));
		JumpBiz jumpBiz = (JumpBiz)GetBean.getContext().getBean("jumpbiz");
		flower = jumpBiz.productdetail(fid);
		String num = String.valueOf(flower.getAvailabilityNum());	
		return num;
	}
	
	@RequestMapping("/gotocart")
	public String gotocart(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
	
		float sumpay = 0;
	
		HttpSession session = request.getSession();
		int uid = (int) session.getAttribute("uid");
	
		
		List<ShoppingCart> list = new ArrayList<ShoppingCart>();
		List<ShoppingCart> PageshoppingCarts = new ArrayList<ShoppingCart>();
		List<Flower> flowers = new ArrayList<Flower>();

		JumpBiz jbiz = (JumpBiz) GetBean.getContext().getBean("jumpbiz");
	
		
		ShoppingBiz biz = (ShoppingBiz) GetBean.getContext().getBean("shoppingbiz");
		
		Page2 page = null;	
		int totalCount = biz.getCartCount(uid);

		page = new Page2(totalCount, 1);
	
		request.setAttribute("page", page);
		
		List<FlowerKind> flowerkindlist = new ArrayList<FlowerKind>();
		
		
		flowerkindlist = jbiz.flowerkind();
	 	request.setAttribute("flowerkindlist",flowerkindlist);
	 	
	 	List<BargainFlower> bargainlist = new ArrayList<BargainFlower>();
	 	bargainlist = jbiz.bargainflower();
	 	
		request.setAttribute("bargainprice", bargainlist.get(0).getBargainPrice());
		
		int flowerid = bargainlist.get(0).getFlowerId();
	 	
	 	Flower bargainflower = null;
	 	bargainflower = jbiz.productdetail(flowerid);
	 	request.setAttribute("bargainflower", bargainflower);
	 	

		PageshoppingCarts = biz.selectCartByPage(uid,page.getStartPos(), page.getPageSize());
		list = biz.cartinfo(uid);
		request.setAttribute("cartlist", PageshoppingCarts);
		
		List<Integer> fidlist = new ArrayList<Integer>();
		for (int i=0;i<list.size();i++){
			fidlist.add(list.get(i).getFlowerId());
		}
		
		for (int i=0;i<list.size();i++){
			flowers.add(jbiz.productdetail(fidlist.get(i)));
		}
		request.setAttribute("flowers", flowers);
		
		for (int i=0;i<list.size();i++){
			sumpay+=list.get(i).getTotal();
		}
		System.out.println(sumpay);
		request.setAttribute("sumpay", sumpay);
		
		return "shoppingcart.jsp";
	}

	@RequestMapping("/search")
	public String search(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		//System.err.println("go here");
		List<Flower> flowers = new ArrayList<Flower>();

		JumpBiz jbiz = (JumpBiz) GetBean.getContext().getBean("jumpbiz");
		List<FlowerKind> list = new ArrayList<FlowerKind>();
		
		String keyword = request.getParameter("keyword");
		flowers = jbiz.search(keyword);
		request.setAttribute("keyword", keyword);
		System.err.println(flowers.size());
	
		
		
	 	list = jbiz.flowerkind();
	 	request.setAttribute("flowerkindlist",list);
	 	


	 	
	
	 
		
	 	for (int i=0;i<flowers.size();i++){
	 		if (flowers.get(i).getBargainFlag()==1){
	 			BargainFlower bargainflowerprice = null;
	 			int Bfid= flowers.get(i).getFlowerId();
	 			bargainflowerprice = jbiz.getbargainflower(Bfid);
	 			float price = bargainflowerprice.getBargainPrice();
	 			flowers.get(i).setPrice(price);
	 		}
	 	
	 	}
	 	
		if (flowers.size()>0){
		
			request.setAttribute("flowerlist", flowers);
	
			System.err.println(flowers.size());
			request.setAttribute("status", "ok");
		}
		else{
			//request.setAttribute("status", "error");
		}
	
	 	List<BargainFlower> bargainlist = new ArrayList<BargainFlower>();
	 	bargainlist = jbiz.bargainflower();
	 	
		request.setAttribute("bargainprice", bargainlist.get(0).getBargainPrice());
		
	 	
	 	int fid = bargainlist.get(0).getFlowerId();
	 	
	 	Flower bargainflower = null;
	 	bargainflower = jbiz.productdetail(fid);
	 	request.setAttribute("bargainflower", bargainflower);
	
		return "searchresult.jsp";
	}
	
	@RequestMapping("/userinfo")
	public String userinfo(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		JumpBiz jbiz = (JumpBiz) GetBean.getContext().getBean("jumpbiz");
		
		ShoppingBiz shoppingBiz = (ShoppingBiz) GetBean.getContext().getBean("shoppingbiz");
		HttpSession httpSession = request.getSession();
		Customer customer = null;
		UserAccount userAccount = null;
		int uid = (int) httpSession.getAttribute("uid");
		customer = jbiz.userinfo(uid);
		
		userAccount = shoppingBiz.selectaccount(uid);
	
		request.setAttribute("customer", customer);
		request.setAttribute("account", userAccount.getAccount());
		return "userinfo.jsp";
	}
	
	
	@RequestMapping("/addaccount")
	@ResponseBody
	public String addaccount(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		float account = 0;
		account = Float.parseFloat(request.getParameter("account"));
		HttpSession httpSession = request.getSession();
		int uid  = (int) httpSession.getAttribute("uid");
		ShoppingBiz shoppingBiz = (ShoppingBiz) GetBean.getContext().getBean("shoppingbiz");
		shoppingBiz.updateaccount(account, uid);
		String result = String.valueOf(shoppingBiz.selectaccount(uid).getAccount()); 
		return result;
	}
	
	
	

}
