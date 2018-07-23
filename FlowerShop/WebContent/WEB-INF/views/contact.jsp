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
<title>Floral Shop, Contact, Online Store</title>
<meta name="keywords"
	content="free template, contact, floral shop, ecommerce, online store" />
<meta name="description"
	content="Floral Shop, Contact Form, Location Maps, Addresses, free template for ecommerce websites." />
<link href="<%=basePath%>templatemo_style.css" rel="stylesheet"
	type="text/css" />

<link rel="stylesheet" href="<%=basePath%>css/orman.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="<%=basePath%>css/nivo-slider.css"
	type="text/css" media="screen" />

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/ddsmoothmenu.css" />
<script type="text/javascript" src="<%=basePath%>js/logging.js"></script>
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
						
						<li><a href="#">关于我们</a></li>
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
				<a href="#" title="#/" class="site_repeat" target="_blank"><img
					src="<%=basePath%>images/top_repeat.png" title="#/" /></a>
				<!-- end of templatemo_menu -->

			</div>
			<!-- END of header -->
		</div>
		<!-- END of header wrapper -->
	</div>
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
				<h2>${Name}</h2>
				<p>${Description}</p>
				<div class="cleaner h20"></div>
				<div class="col col13">
					<h4>${Address}</h4>

					<c:forEach items="${officelist}" var="office">
						<h6>
							<strong><c:out value="${office.getName()}" /></strong>
						</h6>
						<c:out value="${office.getRoomNumber()}" />
						<br />
						<c:out value="${office.getZipCode()}" />
						<br />
						<br />
						<br />

						<strong>电话:</strong>
						<c:out value="${office.getPhoneNumber()}" />
						<br />
						<strong>电子邮件:</strong>
						<a href=""><c:out value="${office.getEmail()}" /></a>
						<br />


					</c:forEach>

				</div>
				<div class="col col23 no_margin_right">

					<img src="<%=basePath%>${PicPath}"
						style="width: 450px; height: 206px;"></img>

					<div class="cleaner h40"></div>

					<div class="cleaner h40"></div>

					<div class="cleaner"></div>
				</div>
				<div class="cleaner"></div>
			</div>
			<!-- END of main -->
		</div>
		<!-- END of main wrapper -->


	</div>

</body>

</html>