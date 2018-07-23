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
<title>Floral Shop, Check Out, Web Store</title>
<meta name="keywords"
	content="free template, floral shop, ecommerce, online shopping, store" />
<meta name="description"
	content="Floral Shop, Check Out, free template for ecommerce websites." />
<link href="<%=basePath%>templatemo_style.css" rel="stylesheet"
	type="text/css" />

<link rel="stylesheet" href="<%=basePath%>css/orman.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="<%=basePath%>css/nivo-slider.css"
	type="text/css" media="screen" />

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/ddsmoothmenu.css" />
	<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
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

$(document).ready(function(){
$('#fullname').bind('input propertychange', function() {
    var name = $(this).val();
    
    if(!( /^[\u4E00-\u9FA5]{2,10}$/.test(name)) || name.length<2){ 
    	if (name ==""){
    		$("#nametip").css("color","#FEA5C5");
    		$('#nametip').html("&nbsp;&nbsp;&nbsp;姓名不能为空");
    	}else{

     		$("#nametip").css("color","#FEA5C5");
    		$('#nametip').html("&nbsp;&nbsp;&nbsp;姓名由汉字组成，2-10位");
    	}
    } 
    else{
     	$("#nametip").css("color","#FCE169");
    	$('#nametip').html("&nbsp;&nbsp;&nbsp;姓名符合规范");
    }
});


$('#address').bind('input propertychange', function() {
    var address = $(this).val();
    
    if(!( /^[\u4E00-\u9FA50-9]{10,50}$/.test(address)) || address.length<10){ 
    	if (address ==""){
    		$("#addresstip").css("color","#FEA5C5");
    		$('#addresstip').html("&nbsp;&nbsp;&nbsp;地址不能为空");
    	}else{

     		$("#addresstip").css("color","#FEA5C5");
    		$('#addresstip').html("&nbsp;&nbsp;&nbsp;地址由汉字、数字组成，10-50位");
    	}
    } 
    else{
     	$("#addresstip").css("color","#FCE169");
    	$('#addresstip').html("&nbsp;&nbsp;&nbsp;地址符合规范");
    }
});


$('#city').bind('input propertychange', function() {
    var city = $(this).val();
    
    if(!( /^[\u4E00-\u9FA5]{2,10}$/.test(city)) || city.length<2){ 
    	if (city ==""){
    		$("#citytip").css("color","#FEA5C5");
    		$('#citytip').html("&nbsp;&nbsp;&nbsp;城市不能为空");
    	}else{

     		$("#citytip").css("color","#FEA5C5");
    		$('#citytip').html("&nbsp;&nbsp;&nbsp;城市由汉字组成，2-10位");
    	}
    } 
    else{
     	$("#citytip").css("color","#FCE169");
    	$('#citytip').html("&nbsp;&nbsp;&nbsp;城市符合规范");
    }
});



$('#country').bind('input propertychange', function() {
    var country = $(this).val();
    
    if(!( /^[\u4E00-\u9FA5]{2,10}$/.test(country)) || country.length<2){ 
    	if (country ==""){
    		$("#countrytip").css("color","#FEA5C5");
    		$('#countrytip').html("&nbsp;&nbsp;&nbsp;国家不能为空");
    	}else{

     		$("#countrytip").css("color","#FEA5C5");
    		$('#countrytip').html("&nbsp;&nbsp;&nbsp;国家由汉字组成，2-10位");
    	}
    } 
    else{
     	$("#countrytip").css("color","#FCE169");
    	$('#countrytip').html("&nbsp;&nbsp;&nbsp;国家名符合规范");
    }
});

$('#email').bind('input propertychange', function() {
    var email = $(this).val();
    
    if(!( /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/.test(email))){ 
    	if (email ==""){
    		$("#emailtip").css("color","#FEA5C5");
    		$('#emailtip').html("&nbsp;&nbsp;&nbsp;邮箱不能为空");
    	}else{

     		$("#emailtip").css("color","#FEA5C5");
    		$('#emailtip').html("&nbsp;&nbsp;&nbsp;邮箱格式不正确");
    	}
    } 
    else{
     	$("#emailtip").css("color","#FCE169");
    	$('#emailtip').html("&nbsp;&nbsp;&nbsp;邮箱符合规范");
    }
});


$('#phone').bind('input propertychange', function() {
    var phone = $(this).val();
    
    if(!( /^1(3|4|5|7|8)\d{9}$/.test(phone)) ){ 
    	if (country ==""){
    		$("#teltip").css("color","#FEA5C5");
    		$('#teltip').html("&nbsp;&nbsp;&nbsp;电话不能为空");
    	}else{

     		$("#teltip").css("color","#FEA5C5");
    		$('#teltip').html("&nbsp;&nbsp;&nbsp;电话号码格式不正确");
    	}
    } 
    else{
     	$("#teltip").css("color","#FCE169");
    	$('#teltip').html("&nbsp;&nbsp;&nbsp;电话符合规范");
    }
});

});


$(function () {
	$("#checkoutbtn").click(function () {
		var namestatus =$('#nametip').text().replace(/\s+/g,"");
		//alert(namestatus);
		var addressstatus =$('#addresstip').text().replace(/\s+/g,""); 
		
		var citystatus = $('#citytip').text().replace(/\s+/g,"");
		var countrystatus = $('#countrytip').text().replace(/\s+/g,"");
		
		
		var emailstatus= $('#emailtip').text().replace(/\s+/g,"");
		var telstatus = $('#teltip').text().replace(/\s+/g,"");
	

		if (namestatus == "姓名符合规范" && addressstatus == "地址符合规范" && citystatus == "城市符合规范" && countrystatus == "国家名符合规范"
				&& emailstatus =="邮箱符合规范" && telstatus =="电话符合规范"){
	  		$("#checkoutbtn").val("提交成功");
	    	
	  		
	  		
	     	var name = $("input[name='fullname']").val();
	    	var address = $("input[name='address']").val();
	    	var city = $("input[name='city']").val();
	    	var country =  $("input[name='country']").val();
	    
	    	var email =  $("input[name='email']").val();
	    	var phone =  $("input[name='phone']").val();
	    	var allpay = $("#allpay").text().substring(1);
	    	
	    	
	 
	            		window.location.href="../shoppingAction/checkoutdeal.do?fullname="+name+"&address="+address+
						"&city="+city+"&country="+country+"&email="+email+"&phone="+phone+"&sumpay="+allpay;    	
	   
	            
	      
	    	
			
		}
		else{
			
		}
		
	});






})

</script>

<style>
#checkoutbtn{
    width: 60%;
    padding: 10px 0;
    font-size: 16px;
    font-weight: 100;
    background-color: transparent;
    color: red;
    font-weight: bold;
    margin-bottom: 10px;
    border: 1px solid rgba(238, 238, 238, 0.41);
    border-width: thin;
    cursor: pointer;
    outline: none;
    transition: 0.5s all;
    -webkit-transition: 0.5s all;
    -moz-transition: 0.5s all;
    -o-transition: 0.5s all;
    -ms-transition: 0.5s all;
    text-decoration: none;
    }
}

</style>
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
					<a href="#" title=""></a>
				</div>
				<div id="templatemo_menu" class="ddsmoothmenu">
					<ul>
						<li><a href="../jumpAction/main.do" class="selected">主页</a></li>
						<li><a href="../jumpAction/login.do">登录注册</a></li>
						<li><a href="../jumpAction/products.do">产品</a></li>
					<c:if test="${not empty uid}">
						<li><a href="../jumpAction/gotocart.do">购物车</a></li>
					</c:if>
						<li><a href="#">结账</a></li>
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
				<a href="#" title="" class="site_repeat" target="_blank"><img
					src="<%=basePath%>images/top_repeat.png" title="" /></a>
				<!-- end of templatemo_menu -->

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
					<h2>结账</h2>

					<h3>账单详情</h3>
				<form >
					<div class="content_half left form_field">
					<div style="inline-block;"><p style="float: left;">姓名</p>
					<div id="nametip" style="width:300px;color: red;font-size: 15px;" >&nbsp;&nbsp;&nbsp;请输入姓名</div>
						<input  name="fullname" type="text" id="fullname" maxlength="40"  />
						<br />
					</div>
					
					<div style="display:inline-block;">	
						<p style="float: left;">地址</p>
						<div id="addresstip" style="width:150px;color: red;font-size: 15px;" >&nbsp;&nbsp;&nbsp;请输入地址</div>
						<input name="address" type="text" id="address" maxlength="40"  />
						
					</div>
					<div>
						<p style="float: left;">城市</p>
						<div id="citytip" style="width:150px;color: red;font-size: 15px;" >&nbsp;&nbsp;&nbsp;请输入城市</div>
						<input  name="city" type="text" id="city" maxlength="40"  />
						
					</div>
					
					<div>
						<p style="float: left;">国家</p>
						<div id="countrytip" style="width:150px;color: red;font-size: 15px;" >&nbsp;&nbsp;&nbsp;请输入国家</div>
						<input  name="country" type="text" id="country" maxlength="40"  />
					</div>	
					</div>

					<div class="content_half right form_field">
					<div>
						<p style="float: left;">电子邮件</p>
						<div id="emailtip" style="width:150px;color: red;font-size: 15px;" >&nbsp;&nbsp;&nbsp;请输入邮箱</div>
						<input name="email" type="text" id="email" maxlength="40"  />
					</div>
					<div>
						<p style="float: left;">电话:</p>
						<div id="teltip" style="width:150px;color: red;font-size: 15px;" >&nbsp;&nbsp;&nbsp;请输入电话</div>
						<input  name="phone" type="text" id="phone" maxlength="40"  /> 
					</div>
						<br />
						<span>指定您的可达电话号码，以便打电话给您进行验证。</span>
					</div>

					<div class="cleaner h40"></div>

					<h3>购物卡</h3>
					<div style="display: inline;">
					
						<div style="float: left;">共计: &nbsp;</div>
						<div style="" id="allpay">$${sumpay}</div>
					</div>
					<p>
				
				
					</p>
					<input id="checkoutbtn" class="submit" name="submit" type="button"   value="提交订单信息"/>
			</form>
					<a href="#"><img src="<%=basePath%>images/free_shipping.jpg"
						alt="Free Shipping" /></a>
				</div>

			</div>

			<div class="cleaner"></div>
		</div>
		<!-- END of main -->
	</div>
	<!-- END of main wrapper -->




</body>
</html>