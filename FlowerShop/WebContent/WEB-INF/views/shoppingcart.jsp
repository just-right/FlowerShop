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
<title>Floral Shop, Shopping Cart, Online Store</title>
<meta name="keywords"
	content="free template, shopping cart, floral, ecommerce, online, store" />
<meta name="description"
	content="Floral, Shopping Cart, free template for ecommerce websites." />
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
<script type='text/javascript' src='<%=basePath%>js/logging.js'></script>
<script type="text/javascript" src="<%=basePath%>js/ddsmoothmenu.js">

/***********************************************
* Smooth Navigational Menu- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
***********************************************/

</script>
<script>
window.onbeforeunload=function(){
   // return "你确定要离开吗";
    
	
	/*var fquantity1 = $('#quantity11').val();
	var fquantity2 = $('#quantity12').val();
	var fquantity3 = $('#quantity13').val();
	var fquantity4 = $('#quantity14').val();
	
	var price1 = $('#price1').html();
	var price2 = $('#price2').html();
	var price3 = $('#price3').html();
	var price4 = $('#price4').html();
	
	var flagquantity1 = $('#flagquantity1').html();
	var flagquantity2 = $('#flagquantity2').html();
	var flagquantity3 = $('#flagquantity3').html();
	var flagquantity4 = $('#flagquantity4').html();
	
	var fid1 = $('#fid1').html();
	var fid2 = $('#fid2').html();
	var fid3 = $('#fid3').html();
	var fid4 = $('#fid4').html();
	if (fquantity1!=""){
		window.location.href="../shoppingrAction/CartLeaveDeal.do?fid="+fid1+"&fprice="+price1+"&flagquantity="+flagquantity1+"&quantity="+fquantity1;    	
		return "go here";
	}
	if (fquantity2!=""){
		window.location.href="../shoppingrAction/CartLeaveDeal.do?fid="+fid2+"&fprice="+price2+"&flagquantity="+flagquantity2+"&quantity="+fquantity2;    	
	}
	if (fquantity3!=""){
		window.location.href="../shoppingrAction/CartLeaveDeal.do?fid="+fid3+"&fprice="+price3+"&flagquantity="+flagquantity3+"&quantity="+fquantity3;    	
	}
	if (fquantity4!=""){
		window.location.href="../shoppingrAction/CartLeaveDeal.do?fid="+fid4+"&fprice="+price4+"&flagquantity="+flagquantity4+"&quantity="+fquantity4;    	
	}*/
	if(changeFlag ==true){//如果changeFlag的值为true则提示 
		if(confirm("页面值已经修改，是否保存？")){

		}else{

		}
	}
	
	
}
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

<script>
$(document).ready(function(){
	
		
	
    $('#quantity11').bind('input propertychange', function() {
    	
 		var fquantity = $(this).val();
 		var fid = $('#fid1').html();
 		var flagquantity = $('#flagquantity1').html();
 		var price = $('#price1').html();
 		var flagtotal = $('#flagtotal1').html();
 	
 		var countsum = $('#countsum').html();	
 		if (fquantity == ""){
 			//$(this).val(flagquantity);
 		  	$("#quantitytip1").css("color","#ff0000");
 		  	$("#quantitytip1").css("width","150px");
 		  	$("#quantitytip1").html("请输入购买数量");
 		}
 		else{
 			
 		
 	 	$.ajax({
    		async :false,
    		type : "POST",
        	url: "../jumpAction/checkquantity.do",        //后台url
            data: {                          //数据
            	fid: fid,
            	fquantity: fquantity,
            	flagquantity: flagquantity,
            	price: price,
            },
                  //类型，POST或者GET
            dataType: 'text',              //数据返回类型，可以是xml、json等

            success: function (data) {      //成功，回调函数  
            	//alert(data);
            	if (parseInt(data)>= parseInt(fquantity)){
            		$("#quantitytip1").css("color","#FCE169");
            		$("#quantitytip1").css("width","150px");
            		$("#quantitytip1").html("可以购买");
            		$("#total1").html(parseInt(fquantity)*parseFloat(price));
            		//var sum = //parseFloat(countsum);//
            		var sum = parseFloat(countsum)+parseFloat(fquantity)*parseFloat(price)-parseFloat(flagtotal);
            		//alert(sum);
            		$("#sumpay").html(parseFloat(sum));
            		$('#countsum').html(parseFloat(sum));
            		$('#flagtotal1').html(parseFloat(fquantity)*parseFloat(price));
            		$('#flagquantity1').html(fquantity);
            		
             		//$('#total').html(parseInt(fquantity)*parseInt(price));
             		
            	}
            	else{
            		var sum = parseInt(data);
            		$("#quantitytip1").css("color","#ff0000");
            		$("#quantitytip1").css("width","150px");
            		$("#quantitytip1").html("库存不足,最多可以购买"+sum+"朵");
            		
            	}
            },
            error: function (data,type, err) {          //失败，回调函数
                alert(type);
            }
        }); 
 	 	
 	 	
 		
 		}
 	
    });
    
    
    //2
    $('#quantity12').bind('input propertychange', function() {
    	
 		var fquantity = $(this).val();
 		var fid = $('#fid2').html();
 		var flagquantity = $('#flagquantity2').html();
 		var price = $('#price2').html();
 		var flagtotal = $('#flagtotal2').html();
 	 	
 		var countsum = $('#countsum').html();	
 		if (fquantity == ""){
 		  	$("#quantitytip2").css("color","#ff0000");
 		  	$("#quantitytip2").css("width","150px");
 		  	$("#quantitytip2").html("请输入购买数量");
 		}
 		else{
 			
 		
 	 	$.ajax({
    		async :false,
    		type : "POST",
        	url: "../jumpAction/checkquantity.do",        //后台url
            data: {                          //数据
            	fid: fid,
            	fquantity: fquantity,
            	flagquantity: flagquantity,
            	price: price,
            },
                  //类型，POST或者GET
            dataType: 'text',              //数据返回类型，可以是xml、json等

            success: function (data) {      //成功，回调函数  
            	if (parseInt(data) >= parseInt(fquantity)){
            		$("#quantitytip2").css("color","#FCE169");
            		$("#quantitytip2").css("width","150px");
            		$("#quantitytip2").html("可以购买");
             		$('#total2').html(parseInt(fquantity)*parseInt(price));
             		var sum = parseFloat(countsum)+parseFloat(fquantity)*parseFloat(price)-parseFloat(flagtotal);
            		//alert(sum);
            		$("#sumpay").html(parseFloat(sum));
            		$('#countsum').html(sum);	
            		$('#flagtotal2').html(parseFloat(fquantity)*parseFloat(price));
            		$('#flagquantity2').html(fquantity);
            	}
            	else{
            		var sum = parseInt(data);
            		$("#quantitytip2").css("color","#ff0000");
            		$("#quantitytip2").css("width","150px");
            		$("#quantitytip2").html("库存不足,最多可以购买"+sum+"朵");
            		
            	}
            },
            error: function (data,type, err) {          //失败，回调函数
                alert(type);
            }
        }); 
 	 	
 	 	
 		
 		}
 	
    });
    
    
    
    //3
    $('#quantity13').bind('input propertychange', function() {
    	
 		var fquantity = $(this).val();
 		var fid = $('#fid3').html();
 		var flagquantity = $('#flagquantity3').html();
 		var price = $('#price3').html();
		var flagtotal = $('#flagtotal3').html();
 	 	
 		var countsum = $('#countsum').html();
 		if (fquantity == ""){
 		  	$("#quantitytip3").css("color","#ff0000");
 		  	$("#quantitytip3").css("width","150px");
 		  	$("#quantitytip3").html("请输入购买数量");
 		}
 		else{
 			
 		
 	 	$.ajax({
    		async :false,
    		type : "POST",
        	url: "../jumpAction/checkquantity.do",        //后台url
            data: {                          //数据
            	fid: fid,
            	fquantity: fquantity,
            	flagquantity: flagquantity,
            	price: price,
            },
                  //类型，POST或者GET
            dataType: 'text',              //数据返回类型，可以是xml、json等

            success: function (data) {      //成功，回调函数  
            	if (parseInt(data)>= parseInt(fquantity)){
            		$("#quantitytip3").css("color","#FCE169");
            		$("#quantitytip3").css("width","150px");
            		$("#quantitytip3").html("可以购买");
             		$('#total3').html(parseInt(fquantity)*parseInt(price));
             		var sum = parseFloat(countsum)+parseFloat(fquantity)*parseFloat(price)-parseFloat(flagtotal);
            		//alert(sum);
            		$("#sumpay").html(parseFloat(sum));
            		$('#countsum').html(sum);	
            		$('#flagtotal3').html(parseFloat(fquantity)*parseFloat(price));
            		$('#flagquantity3').html(fquantity);
            	}
            	else{
            		var sum = parseInt(data);
            		$("#quantitytip3").css("color","#ff0000");
            		$("#quantitytip3").css("width","150px");
            		$("#quantitytip3").html("库存不足,最多可以购买"+sum+"朵");
            		
            	}
            },
            error: function (data,type, err) {          //失败，回调函数
                alert(type);
            }
        }); 
 	 	
 	 	
 		
 		}
 	
    });
    
    
    
    //4
    $('#quantity14').bind('input propertychange', function() {
    	
 		var fquantity = $(this).val();
 		var fid = $('#fid4').html();
 		var flagquantity = $('#flagquantity4').html();
 		var price = $('#price4').html();
		var flagtotal = $('#flagtotal4').html();
 	 	
 		var countsum = $('#countsum').html();
 		if (fquantity == ""){
 		  	$("#quantitytip4").css("color","#ff0000");
 		  	$("#quantitytip4").css("width","150px");
 		  	$("#quantitytip4").html("请输入购买数量");
 		}
 		else{
 			
 		
 	 	$.ajax({
    		async :false,
    		type : "POST",
        	url: "../jumpAction/checkquantity.do",        //后台url
            data: {                          //数据
            	fid: fid,
            	fquantity: fquantity,
            	flagquantity: flagquantity,
            	price: price,
            },
                  //类型，POST或者GET
            dataType: 'text',              //数据返回类型，可以是xml、json等

            success: function (data) {      //成功，回调函数  
            	if (parseInt(data)>= parseInt(fquantity)){
            		$("#quantitytip4").css("color","#FCE169");
            		$("#quantitytip4").css("width","150px");
            		$("#quantitytip4").html("可以购买");
             		$('#total4').html(parseInt(fquantity)*parseInt(price));
             		var sum = parseFloat(countsum)+parseFloat(fquantity)*parseFloat(price)-parseFloat(flagtotal);
            		//alert(sum);
            		$("#sumpay").html(parseFloat(sum));
            		$('#countsum').html(sum);	
            		$('#flagtotal4').html(parseFloat(fquantity)*parseFloat(price));
            		$('#flagquantity4').html(fquantity);
            	}
            	else{
            		var sum = parseInt(data);
            		$("#quantitytip4").css("color","#ff0000");
            		$("#quantitytip4").css("width","150px");
            		$("#quantitytip4").html("库存不足,最多可以购买"+sum+"朵");
            		
            	}
            },
            error: function (data,type, err) {          //失败，回调函数
                alert(type);
            }
        }); 
 	 	
 	 	
 		
 		}
 	
    });
	
}); 


function gocheckout(){
	
	var sum = $("#sumpay").html();
	$.ajax({
		async :false,
		type : "POST",
    	url: "../shoppingAction/checkpay.do",        //后台url
        data: {                          //数据
        	sumpay:sum,

        },
              //类型，POST或者GET
        dataType: 'text',              //数据返回类型，可以是xml、json等

        success: function (data) {      //成功，回调函数  
        	if (data == "ok"){
        		    	
        		window.location.href="../shoppingAction/checkout.do?sumpay="+sum;
        	}
        	else{
            	alert("用户余额不足,请去个人信息界面充值");
        		
        	}
        },
        error: function (data,type, err) {          //失败，回调函数
            alert(type);
        }
    }); 
	
	

	
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
						<li><a href="#">购物车</a></li>
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
				<a href="#" title="免费的图像" class="site_repeat"><img
					src="../images/top_repeat.png" title="免费的图像" /></a>
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
	
			<div id="countsum" style="display: none;">${sumpay}</div>
				<div id="content" class="right">
					<h2>Shopping Cart</h2>
					<table width="700" border="0" cellpadding="5" cellspacing="0">
						<tr bgcolor="#395015">
							<th width="168" align="left">Item</th>
							<th width="188" align="left">Description</th>
							<th width="60" align="center">Quantity</th>
							<th width="80" align="right">Price</th>
							<th width="80" align="right">Total</th>
							<th width="64"></th>
						</tr>
					
						<c:forEach items="${cartlist}" var="cartinfo" varStatus="loop">
						<div style="display: none;">
							<div id="fid${loop.count}" style="visibility: hidden;">${flowers[loop.count-1].getFlowerId()}</div>
							<div id="flagquantity${loop.count}" style="visibility: hidden;">${cartinfo.getQuantity()}</div>
							<div id="flagtotal${loop.count}" style="visibility: hidden;">${cartinfo.getTotal()}</div>
						</div>
						<tr bgcolor="#41581B">
						
							<td><img src="<%=basePath%>${flowers[loop.count-1].getPicPath()}"
								alt="flower image 1" /></td>
							<td>${flowers[loop.count-1].getDescription()}</td>
							<td align="center">
							<input maxlength="2" onkeyup='this.value=this.value.replace(/\D/gi,"")' name="quantity1" type="text"
								id="quantity1${loop.count}" value="<c:out value="${cartinfo.getQuantity()}"/>" required="required" />
							
							<div id= "quantitytip${loop.count}" >可以购买</div>
							
							</td>
							
							
							<td align="right"><div id="price${loop.count}"><c:out value="${cartinfo.getFlowerPrice()}" /></div></td>
							<td align="right"><div id="total${loop.count}"><c:out value="${cartinfo.getTotal()}" /></div></td>
							<td align="center"><a href="../shoppingAction/removecart.do?fid=${cartinfo.getFlowerId()}"><img
									src="<%=basePath%>images/remove.png" alt="remove" /><br />Remove</a>
									
							</td>
						</tr>
				
						</c:forEach>
						<tr bgcolor="#41581B">
              			  	<td colspan="3">Have you modified item quantities? Please <a href="#"><strong>Update</strong></a> the Cart.&nbsp;&nbsp;</td>
               				<td align="right"><h4>All Total:</h4></td>
                			<td align="right"><div id="sumpay">${sumpay}</div></td>
                			<td> </td>
            			</tr>
					</table>
					<div class="cleaner h20"></div>
					
						<div class="blank_box">
	  
		<a class="button left" href="../shoppingAction/CartPageDeal.do?pageNow=1">首页</a>
		<c:choose>
			
			<c:when test="${page.pageNow - 1 > 0}">
				<a class="button left" href="../shoppingAction/CartPageDeal.do?pageNow=${page.pageNow - 1}">上一页</a>
			</c:when>
			<c:when test="${page.pageNow - 1 <= 0}">
				<a class="button left" href="../shoppingAction/CartPageDeal.do?pageNow=1">上一页</a>
			</c:when>
		</c:choose>
		
		
		<c:choose>
			<c:when test="${page.totalPageCount==0}">
				<a class="button right" href="../shoppingAction/CartPageDeal.do?pageNow=${page.pageNow}">尾页</a>
			</c:when>
			<c:otherwise>
				<a class="button right" href="../shoppingAction/CartPageDeal.do?pageNow=${page.totalPageCount}">尾页</a>
			</c:otherwise>
		</c:choose>
			<c:choose>
			<c:when test="${page.totalPageCount==0}">
				<a class="button right" href="../shoppingAction/CartPageDeal.do?pageNow=${page.pageNow}">下一页</a>
			</c:when>
			<c:when test="${page.pageNow + 1 < page.totalPageCount}">
				<a class="button right" href="../shoppingAction/CartPageDeal.do?pageNow=${page.pageNow + 1}">下一页</a>
			</c:when>
			<c:when test="${page.pageNow + 1 >= page.totalPageCount}">
				<a class="button right" href="../shoppingAction/CartPageDeal.do?pageNow=${page.totalPageCount}">下一页</a>
			</c:when>
		</c:choose>
	
		<div style="text-align: center; color: red;font-weight: bold;">
			<font size="2">第${page.pageNow} 页</font>
			<font size="2">共 ${page.totalPageCount} 页</font>
		</div>
		<br />
		<div class = "button right" style="color: yellow">
			<a style="font-size: 15px;color: red; font-weight: bold;" href="javascript:gocheckout();" class="button">去结算</a>
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