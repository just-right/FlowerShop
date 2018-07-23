<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%  String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Floral Shop, Products, Online Shopping</title>
<meta name="keywords"
	content="free template, floral shop, ecommerce, online shopping, store" />
<meta name="description"
	content="Floral Shop, Products, free website template for ecommerce shopping websites." />
<link href="<%=basePath%>templatemo_style.css" rel="stylesheet"
	type="text/css" />

<link rel="stylesheet" href="<%=basePath%>css/orman.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="<%=basePath%>css/nivo-slider.css"
	type="text/css" media="screen" />

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/ddsmoothmenu.css" />
<script type='text/javascript' src='<%=basePath%>js/logging.js'></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/ddsmoothmenu.js">

/***********************************************
* Smooth Navigational Menu- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
***********************************************/

</script>

<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "templatemo_menu", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}

</script>


<style>
	.nav{
		color:#FBCF60;
		position:absolute;
		right:50px;
		top:10px;
		z-index:999;
		font-size: 20px;
		font-weight: bold;
		text-decoration: underline;
	}
</style>
</head>

<body>
	<c:choose>
		<c:when test="${not empty uid}">
			<div class="nav">你好,${username}</div>
		</c:when>
		<c:otherwise>
			<a class="nav" style="text-decoration: underline;" href="../jumpAction/login.do">考虑一下登录吧!</a>
		</c:otherwise>
	</c:choose>
	<div id="templatemo_wrapper_sp">
		<div id="templatemo_header_wsp">
			<div id="templatemo_header" class="header_subpage">
				<div id="site_title">
					<a href="" title=""></a>
				</div>
				<div id="templatemo_menu" class="ddsmoothmenu">
					<ul>
						<li><a href="../jumpAction/main.do" class="selected">主页</a></li>
						<li><a href="../jumpAction/login.do">登录注册</a></li>
						<li><a href="../jumpAction/products.do">产品</a></li>
							<c:if test="${not empty uid}">
						<li><a href="../jumpAction/gotocart.do">购物车</a></li>
					</c:if>
						
						<li><a href="../jumpAction/contact.do">关于我们</a></li>
						<li><a href="../jumpAction/faqs.do">常见问题</a></li>
							<c:if test="${not empty uid}">
						<li><a href="../jumpAction/userinfo.do">个人信息</a></li>
				</c:if>
					<c:if test="${not empty uid}">
						<li><a href="../jumpAction/quit.do">退出登录</a></li>
				</c:if>
					</ul>
					<div id="templatemo_search">
							<form action="../jumpAction/search.do" method="post">
							<input type="text"  name="keyword" required="required" id="keyword"
								title="keyword" onfocus="clearText(this)"
								onblur="clearText(this)" class="txt_field"  /> <input
								type="submit" name="" value="" alt="Search"
								id="searchbutton" title="Search" class="sub_btn" />
						</form>
					</div>
					<br style="clear: left" />
				</div>

			</div>
			<!-- END of header -->
		</div>
		<!-- END of header wrapper -->
		<div id="templatemo_main_wrapper">
			<div id="templatemo_main">
				<div id="sidebar" class="left">
					<div class="sidebar_box">
						<span class="bottom"></span>
						<h3>种类</h3>
						<div class="content">
							<ul class="sidebar_list">
								<c:forEach items="${flowerkindlist}" var="flowerkind">
									<li><a href="#"><c:out value="${flowerkind.getName()}" /></a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
					<div class="sidebar_box">
						<span class="bottom"></span>
						<h3>每周特价</h3>
						<div class="content special">
							<img src="<%=basePath%>${bargainflower.getPicPath()}"
								alt="Flowers" /> <a href="#">${bargainflower.getName()}</a>
							<p>
								Price: <span class="price normal_price">${bargainflower.getPrice()}</span>&nbsp;&nbsp;
								<span class="price special_price">${bargainprice}</span>
							</p>
						</div>
					</div>
				</div>

				<div id="content" class="right">
					<h2>产品</h2>
					<p>漂亮的花</p>
					<c:forEach items="${flowerlist}" var="flower">
				
						<div class="product_box">
							<a
								href="../jumpAction/productdetail.do?fid=${flower.getFlowerId()}"><img
								src="<%=basePath%><c:out value="${flower.getPicPath()}" />"
								alt="floral set 1" /></a>
							<h3>
								<c:out value="${flower.getName()}" />
							</h3>
							<p class="product_price" >
								<c:out value="${flower.getPrice()}" />
							</p>
							<p class="add_to_cart">
								<a
									href="../jumpAction/productdetail.do?fid=${flower.getFlowerId()}">Detail</a>
												<c:choose>
						<c:when test="${not empty uid && flower.getAvailabilityNum() > 0}">
									<a href="../shoppingAction/shoppingcart.do?fid=${flower.getFlowerId()}
								&fprice=${flower.getPrice()}&fquantity=1">Add to Cart</a>
								</c:when>
								<c:when test="${not empty uid && flower.getAvailabilityNum() <= 0}">
									<a href="#">库存不足</a>
								</c:when>
								<c:otherwise>
									<a href="#">无法购买</a>
								</c:otherwise>
						</c:choose>
								
							</p>
						</div>
					</c:forEach>

	<div class="blank_box">
	  
		<a class="button left" href="../jumpAction/ProductPageDeal.do?pageNow=1">首页</a>
		<c:choose>
			
			<c:when test="${page.pageNow - 1 > 0}">
				<a class="button left" href="../jumpAction/ProductPageDeal.do?pageNow=${page.pageNow - 1}">上一页</a>
			</c:when>
			<c:when test="${page.pageNow - 1 <= 0}">
				<a class="button left" href="../jumpAction/ProductPageDeal.do?pageNow=1">上一页</a>
			</c:when>
		</c:choose>
		
		
		<c:choose>
			<c:when test="${page.totalPageCount==0}">
				<a class="button right" href="../jumpAction/ProductPageDeal.do?pageNow=${page.pageNow}">尾页</a>
			</c:when>
			<c:otherwise>
				<a class="button right" href="../jumpAction/ProductPageDeal.do?pageNow=${page.totalPageCount}">尾页</a>
			</c:otherwise>
		</c:choose>
			<c:choose>
			<c:when test="${page.totalPageCount==0}">
				<a class="button right" href="../jumpAction/ProductPageDeal.do?pageNow=${page.pageNow}">下一页</a>
			</c:when>
			<c:when test="${page.pageNow + 1 < page.totalPageCount}">
				<a class="button right" href="../jumpAction/ProductPageDeal.do?pageNow=${page.pageNow + 1}">下一页</a>
			</c:when>
			<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
				<a class="button right" href="../jumpAction/ProductPageDeal.do?pageNow=${page.totalPageCount}">下一页</a>
			</c:when>
		</c:choose>
	
		<div style="text-align: center; color: red;font-weight: bold;">
			<font size="2">第${page.pageNow} 页</font>
			<font size="2">共 ${page.totalPageCount} 页</font>
		</div>
	</div>	
					<div class="cleaner h20"></div>
					<div class="blank_box">
						<a href="#"><img src="<%=basePath%>images/free_shipping.jpg"
							alt="Free Shipping" /></a>
					</div>
				</div>
				<div class="cleaner"></div>
			</div>
			<!-- END of main -->
		</div>
		<!-- END of main wrapper -->


	</div>

</body>

</html>