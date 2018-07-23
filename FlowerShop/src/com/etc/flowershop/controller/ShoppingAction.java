package com.etc.flowershop.controller;

import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;





import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.etc.flowershop.dto.BargainFlower;
import com.etc.flowershop.dto.Flower;
import com.etc.flowershop.dto.FlowerKind;
import com.etc.flowershop.dto.OrderSum;
import com.etc.flowershop.dto.Page;
import com.etc.flowershop.dto.Page2;
import com.etc.flowershop.dto.PayMent;
import com.etc.flowershop.dto.ShoppingCart;
import com.etc.flowershop.dto.UserAccount;
import com.etc.flowershop.service.JumpBiz;
import com.etc.flowershop.service.ShoppingBiz;
import com.etc.flowershop.util.GetBean;



@Controller
@RequestMapping("/shoppingAction")
public class ShoppingAction {

	@RequestMapping("/shoppingcart")
	public String shoppingcart(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int  fid = Integer.parseInt(request.getParameter("fid"));
		float fprice = Float.parseFloat(request.getParameter("fprice"));
		int fquantity = Integer.parseInt(request.getParameter("fquantity"));
		float total = fprice*fquantity;
		float sumpay = 0;
		ShoppingCart shoppingCart = null;
		HttpSession session = request.getSession();
		int uid = (int) session.getAttribute("uid");
		System.out.println(uid);
		
		
		List<ShoppingCart> list = new ArrayList<ShoppingCart>();
		List<ShoppingCart> PageshoppingCarts = new ArrayList<ShoppingCart>();
		List<Flower> flowers = new ArrayList<Flower>();

		JumpBiz jbiz = (JumpBiz) GetBean.getContext().getBean("jumpbiz");
	
		
		ShoppingBiz biz = (ShoppingBiz) GetBean.getContext().getBean("shoppingbiz");
		
		Page2 page = null;	
		int totalCount = biz.getCartCount(uid);
		System.err.println("多少："+totalCount);
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
	 	
	 	
	 	shoppingCart = biz.judgecart(fid, uid);
	 	if (shoppingCart!=null){
	 		biz.updatecart(fquantity, total, fid, uid);
	 	}
	 	else{
	 		biz.shoppingcart(fid, fquantity, fprice, total, uid);
	 	}
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
	

	@RequestMapping("/removecart")
	public String removecart(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		int  fid = Integer.parseInt(request.getParameter("fid"));
	

		HttpSession session = request.getSession();
		int uid = (int) session.getAttribute("uid");
		String pageNow = request.getParameter("pageNow");

		List<ShoppingCart> shoppingCarts = new ArrayList<ShoppingCart>();
	
		Page2 page = null;
	
		List<Flower> flowers = new ArrayList<Flower>();
		float sumpay = 0;
	
		
		JumpBiz biz = (JumpBiz) GetBean.getContext().getBean("jumpbiz");
		ShoppingBiz shoppingBiz = (ShoppingBiz) GetBean.getContext().getBean("shoppingbiz");
		int num = shoppingBiz.judgecart(fid, uid).getQuantity();
		shoppingBiz.updatefsum(num, fid);
		shoppingBiz.removecart(fid, uid);
		
		int totalCount = (int) shoppingBiz.getCartCount(uid);
	 
		if (pageNow != null) {
			page = new Page2(totalCount, Integer.parseInt(pageNow));
			shoppingCarts = shoppingBiz.selectCartByPage(uid,page.getStartPos(), page.getPageSize());
		} else {
			page = new Page2(totalCount, 1);
			shoppingCarts = shoppingBiz.selectCartByPage(uid,page.getStartPos(), page.getPageSize());
		}
	 
		request.setAttribute("cartlist", shoppingCarts);
		request.setAttribute("page", page);
		
		
		

		System.out.println(uid);
		List<ShoppingCart> list = new ArrayList<ShoppingCart>();

		List<FlowerKind> flowerkindlist = new ArrayList<FlowerKind>();
		flowerkindlist = biz.flowerkind();
	 	request.setAttribute("flowerkindlist",flowerkindlist);
	 	
	 	List<BargainFlower> bargainlist = new ArrayList<BargainFlower>();
	 	bargainlist = biz.bargainflower();
	 	
		request.setAttribute("bargainprice", bargainlist.get(0).getBargainPrice());
		
		int flowerid = bargainlist.get(0).getFlowerId();
	 	
	 	Flower bargainflower = null;
	 	bargainflower = biz.productdetail(flowerid);
	 	request.setAttribute("bargainflower", bargainflower);
	 	
	 	
		
		

		list = shoppingBiz.cartinfo(uid);
	
		
		List<Integer> fidlist = new ArrayList<Integer>();
		for (int i=0;i<list.size();i++){
			fidlist.add(list.get(i).getFlowerId());
		}
		
		for (int i=0;i<list.size();i++){
			flowers.add(biz.productdetail(fidlist.get(i)));
		}
		request.setAttribute("flowers", flowers);
		
		
		for (int i=0;i<list.size();i++){
			sumpay+=list.get(i).getTotal();
		}
		System.out.println(sumpay);
		request.setAttribute("sumpay", sumpay);

		return "shoppingcart.jsp";
	}
	
	@RequestMapping("/checkout")
	public String checkout(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		ShoppingBiz shoppingBiz = (ShoppingBiz) GetBean.getContext().getBean("shoppingbiz");
		JumpBiz jbiz = (JumpBiz) GetBean.getContext().getBean("jumpbiz");
		HttpSession httpSession = request.getSession();
		int uid = (int) httpSession.getAttribute("uid");
	
		List<ShoppingCart> shoppingCarts = new ArrayList<ShoppingCart>();
		List<FlowerKind> list = new ArrayList<FlowerKind>();
		shoppingCarts = shoppingBiz.cartinfo(uid);
		
	 	list = jbiz.flowerkind();
	 	request.setAttribute("flowerkindlist",list);
	 	List<BargainFlower> bargainlist = new ArrayList<BargainFlower>();
	 	bargainlist = jbiz.bargainflower();
	 	
		request.setAttribute("bargainprice", bargainlist.get(0).getBargainPrice());
	 	int fid = bargainlist.get(0).getFlowerId();
	 	Flower bargainflower = null;
	 	bargainflower = jbiz.productdetail(fid);
	 	request.setAttribute("bargainflower", bargainflower);
	 	if (shoppingCarts.size()!=0){
	 		String sumpay = request.getParameter("sumpay");
			request.setAttribute("sumpay", sumpay);
	 	
			return "checkout.jsp";
	 	}
	 	else{
	 		return "forward:/jumpAction/main.do";
	 	}
	}
	

	@RequestMapping("/checkoutdeal")
	public String checkoutdeal(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String name = new String(request.getParameter("fullname").getBytes("iso-8859-1"),"utf-8");
		String address = new String(request.getParameter("address").getBytes("iso-8859-1"),"utf-8");
		String city = new String(request.getParameter("city").getBytes("iso-8859-1"),"utf-8");
		String country = new String(request.getParameter("country").getBytes("iso-8859-1"),"utf-8");
		String email = new String(request.getParameter("email").getBytes("iso-8859-1"),"utf-8");
		String phonenumber = new String(request.getParameter("phone").getBytes("iso-8859-1"),"utf-8");
		System.out.println(address);
		float totalprice = Float.parseFloat(request.getParameter("sumpay"));
		int paymethodid = 1;
		List<ShoppingCart> shoppingCartslist = new ArrayList<ShoppingCart>();
		
		HttpSession httpSession = request.getSession();
		int uid = (int)httpSession.getAttribute("uid");
		System.out.println(uid);
		
		OrderSum orderSum = null;
		PayMent payMent = null;
		Date date = new Date(System.currentTimeMillis());
		System.out.println(date);
		Timestamp timestamp = new Timestamp(System.currentTimeMillis());
		
		System.out.println(timestamp);
		
		JumpBiz jbiz = (JumpBiz) GetBean.getContext().getBean("jumpbiz");
		ShoppingBiz biz = (ShoppingBiz) GetBean.getContext().getBean("shoppingbiz");
		
		biz.checkoutdeal(uid, name, address, city, country, email, phonenumber, totalprice, paymethodid,date,timestamp);

		orderSum = biz.ordersum(timestamp);
		
		payMent = biz.payment(orderSum.getPayMethodId());
		System.out.println(orderSum.getPayMethodId());
		
		shoppingCartslist = biz.cartinfo(uid);
		for (int i=0;i<shoppingCartslist.size();i++){
			ShoppingCart cart = shoppingCartslist.get(i);
			biz.orderinfo(cart.getFlowerId(), cart.getQuantity(), cart.getFlowerPrice(), cart.getTotal(), payMent.getName(), orderSum.getOrderId(), jbiz.productdetail(cart.getFlowerId()).getName());
		}
		
		biz.removesumcart(uid);
		httpSession.removeAttribute("cartid");
		biz.updateaccount(-totalprice, uid);
		
		
		return "forward:/jumpAction/main.do";
		
		//return "main.jsp";
	}
	
	@RequestMapping("/CartPageDeal")
	public String CartPageDeal(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String pageNow = request.getParameter("pageNow");
		List<FlowerKind> flowerkindlist = new ArrayList<FlowerKind>();
		List<ShoppingCart> shoppingCarts = new ArrayList<ShoppingCart>();
	 	List<BargainFlower> bargainlist = new ArrayList<BargainFlower>();
		Page page = null;
		HttpSession httpSession = request.getSession();
		List<Flower> flowers = new ArrayList<Flower>();
		float sumpay = 0;
	
		
		JumpBiz biz = (JumpBiz) GetBean.getContext().getBean("jumpbiz");
		ShoppingBiz shoppingBiz = (ShoppingBiz) GetBean.getContext().getBean("shoppingbiz");
		int uid = (int) httpSession.getAttribute("uid");
		int totalCount = (int) shoppingBiz.getCartCount(uid);

		if (pageNow != null) {
			page = new Page(totalCount, Integer.parseInt(pageNow));
			shoppingCarts = shoppingBiz.selectCartByPage(uid,page.getStartPos(), page.getPageSize());
		} else {
			page = new Page(totalCount, 1);
			shoppingCarts = shoppingBiz.selectCartByPage(uid,page.getStartPos(), page.getPageSize());
		}
	 
		request.setAttribute("cartlist", shoppingCarts);
		request.setAttribute("page", page);
		
		
		
		
		flowerkindlist = biz.flowerkind();
	 	request.setAttribute("flowerkindlist",flowerkindlist);

	 	bargainlist = biz.bargainflower();
		request.setAttribute("bargainprice", bargainlist.get(0).getBargainPrice());
		
		int fid = bargainlist.get(0).getFlowerId();
	 	
	 	Flower bargainflower = null;
	 	bargainflower = biz.productdetail(fid);
	 	request.setAttribute("bargainflower", bargainflower);
	 	
	 	
	 	List<ShoppingCart> shoppingCarts2 = new ArrayList<ShoppingCart>();
	 	shoppingCarts2 = shoppingBiz.cartinfo(uid);
		List<Integer> fidlist = new ArrayList<Integer>();
		for (int i=0;i<shoppingCarts.size();i++){
			fidlist.add(shoppingCarts.get(i).getFlowerId());
		}
		
		for (int i=0;i<shoppingCarts.size();i++){
			flowers.add(biz.productdetail(fidlist.get(i)));
		}
		request.setAttribute("flowers", flowers);
		
		
		for (int i=0;i<shoppingCarts2.size();i++){
			sumpay+=shoppingCarts2.get(i).getTotal();
		}
		System.out.println(sumpay);
		request.setAttribute("sumpay", sumpay);
	

		return "shoppingcart.jsp";
	}
	
	@RequestMapping("/CartLeaveDeal")
	public void CartLeaveDeal(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		ShoppingBiz shoppingBiz = (ShoppingBiz) GetBean.getContext().getBean("shoppingbiz");
		HttpSession httpSession = request.getSession();
		int uid = (int) httpSession.getAttribute("uid");
		int fid= Integer.parseInt(request.getParameter("fid"));
		float fprice = Float.parseFloat(request.getParameter("fprice"));
		int flagquantity = Integer.parseInt(request.getParameter("flagquantity"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int newquantity = quantity - flagquantity;
		float total = newquantity*fprice;
		shoppingBiz.updatecart(newquantity, total, fid, uid);
		
		
		//return "forward:/shoppingAction/shoppingcart.do";
	}
	
	@RequestMapping("/checkpay")
	@ResponseBody
	public String checkpay(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		HttpSession httpSession = request.getSession();
		float pay = Float.parseFloat(request.getParameter("sumpay"));
		System.err.println(pay);
		int uid = (int) httpSession.getAttribute("uid");
		UserAccount userAccount = null;
		String result = "";
		ShoppingBiz shoppingBiz = (ShoppingBiz) GetBean.getContext().getBean("shoppingbiz");
		userAccount = shoppingBiz.useraccount(uid);
		System.err.println(userAccount.getAccount());
		if (userAccount.getAccount()>=pay){
			result = "ok";
		}
		else{
			result = "fail";
		}
		return result;
	}
}
