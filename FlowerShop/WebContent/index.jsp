<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%	response.sendRedirect("jumpAction/login.do"); %>
<%  String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

<!-- Head -->
<head>

<title>登录表单</title>

<!-- Meta-Tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.1.min.js"></script>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Meta-Tags -->

<!-- Style -->
<link rel="stylesheet" href="<%=basePath%>css/style.css" type="text/css"
	media="all">




</head>
<!-- //Head -->

<!-- Body -->
<body>

	<h1>登录表单</h1>

	<div class="container w3layouts agileits">

		<div class="login w3layouts agileits">
			<h2>登 录</h2>
			<form action="#" >
				<input type="text" Name="Userame" id="name" placeholder="用户名"
					required="required" /> <input type="password" Name="Password"
					id="pwd" placeholder="密码" required="required" />
				<div class="send-button w3layouts agileits">
					<input id="submit" type="submit" value="登 录">
				</div>
			</form>
			<ul class="tick w3layouts agileits">
				<li><input type="checkbox" id="brand1" value=""></li>
			</ul>

			<a href="../jumpAction/main.do">返回主页</a>

			<div class="clear"></div>
		</div>
		<div class="copyrights">
			Collect from <a href=""></a>
		</div>
		<div class="register w3layouts agileits">
			<h2>注 册</h2>
		<form action="../registerAction/register.do" >
				<input type="text" Name="Name" placeholder="用户名" required="required" />
				<input type="text" Name="Email" placeholder="邮箱" required="required" />
				<input type="password" Name="Password" placeholder="密码"
					required="required" /> 
				<input type="text" Name="PhoneNumber"
					placeholder="手机号码" required="required" />
				<div class="send-button w3layouts agileits">

					<input type="submit" value="免费注册">

				</div>
			</form>

			<div class="clear"></div>
		</div>

		<div class="clear"></div>

	</div>



</body>
<!-- //Body -->

</html>