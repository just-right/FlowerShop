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
	content="Floral Shop, Product Details, free template for ecommerce websites." />
<link href="<%=basePath%>templatemo_style.css" rel="stylesheet"
	type="text/css" />

<link rel="stylesheet" href="<%=basePath%>css/orman.css" type="text/css"
	media="screen" />
<link rel="stylesheet" href="<%=basePath%>css/nivo-slider.css"
	type="text/css" media="screen" />

<link rel="stylesheet" type="text/css"
	href="<%=basePath%>css/ddsmoothmenu.css" />
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/ddsmoothmenu.js">

/***********************************************
* Smooth Navigational Menu- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
***********************************************/

</script>
<script type="text/javascript" src="<%=basePath%>js/jquery-1-4-2.min.js"></script>
<script type='text/javascript' src='<%=basePath%>js/logging.js'></script>
<link rel="stylesheet" href="<%=basePath%>css/slimbox2.css"
	type="text/css" media="screen" />
<script type="text/JavaScript" src="<%=basePath%>js/slimbox2.js"></script>
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

function goshoppingcart(){
	
	var fid = $('#fid').html();
	var fprice = $('#fprice').html();
	var fquantity = $('#fquantity').val();

	window.location.href="../shoppingAction/shoppingcart.do?fid="+fid+"&fprice="+fprice+"&fquantity="+fquantity;
	
}
</script>
<script>

$(document).ready(function(){

    $('#fquantity').bind('input propertychange', function() {
    	
 		var fquantity = $(this).val();
 		var fid = $('#fid').html();
 		if (fquantity == ""){
 		  	$("#quantitytip").css("color","#ff0000");
 		  	$("#quantitytip").css("width","150px");
     		$('#quantitytip').html("请输入购买数量");
 		}
 		else{
 			
 		
 	 	$.ajax({
    		async :false,
    		type : "POST",
        	url: "../jumpAction/checkquantity2.do",        //后台url
            data: {                          //数据
            	fid: fid,
            },
                  //类型，POST或者GET
            dataType: 'text',              //数据返回类型，可以是xml、json等

            success: function (data) {      //成功，回调函数  
            	if (parseInt(data) >= parseInt(fquantity)){
            		$("#quantitytip").css("color","#FCE169");
            		$("#quantitytip").css("width","150px");
             		$('#quantitytip').html("可以购买");
            	}
            	else{
                	$("#quantitytip").css("color","#ff0000");
                	$("#quantitytip").css("width","150px");
             		$('#quantitytip').html("库存不足,最多可以购买"+data+"朵");
            		
            	}
            },
            error: function (data,type, err) {          //失败，回调函数
                alert(type);
            }
        }); 
 	 	
 	 	
 		
 		}
 	
    });
});  
$(function () {
    	$("#addcart").click(function () {
    		var quantitystatus =$('#quantitytip').html();
    		if (quantitystatus == "可以购买" ){	
    			goshoppingcart();
    		}
    		else{
    			
    		}
    		
    	});  


})

function goshoppingcart(){
	
	var fid = $('#fid').html();
	var fprice = $('#fprice').html();
	var fquantity = $('#fquantity').val();

	window.location.href="../shoppingAction/shoppingcart.do?fid="+fid+"&fprice="+fprice+"&fquantity="+fquantity;
	
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
									<li><a href="#" id="fname"><c:out value="${flowerkind.getName()}" /></a></li>
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
				
					<h2>Product Detail</h2>
					
						<h2 id="fid" style="visibility: hidden;">${flower.getFlowerId()}</h2>
					<div class="content_half left">
						<h2 id="fname">${flower.getName()}</h2>
						<a rel="lightbox" href="<%=basePath%>${flower.getPicPath()}"><img
							src="<%=basePath%>${flower.getPicPath()}" alt="yellow flowers" /></a>
						<h4 style="margin-top: 20px;">Product Description</h4>
						<p>${flower.getDescription()}.</p>
					</div>
					
						<div class="content_half right">
							<table id="flowertable">
								<tr>
									<td width="130">Price:</td>
									<td width="84" id="fprice">${flower.getPrice()}</td>
								</tr>
								<tr>
									<td>Availability:</td>
									<td><strong>${StockStatus}</strong></td>
								</tr>
					<c:choose>
						<c:when test="${not empty uid && StockStatus=='In Stock'}">
								<tr>
									<td>Quantity</td>
									<td><input onkeyup='this.value=this.value.replace(/\D/gi,"")' type="text"   size="6" maxlength="3" id="fquantity"/></td>
									<td ><div id= "quantitytip"></div></td>
								</tr>
						</c:when>
					</c:choose>
							</table>
							<div class="cleaner h20"></div>
					<c:choose>
						<c:when test="${not empty uid && StockStatus=='In Stock'}">
							<input type="button" id="addcart"  value="Add to Cart" class="button" />
						</c:when>
						<c:when test="${not empty uid && StockStatus=='No Stock'}">	
							<a href="#" class="button" >库存不足</a>
						</c:when>
						<c:otherwise>
							<a href="#" class="button" >无法购买</a>
						</c:otherwise>
							
					</c:choose>	
							
						</div>
					
				
		</div>
		
									
					<div class="cleaner h40"></div>
	
			
					<div class="cleaner h40"></div>
				
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


	

</body>

</html>