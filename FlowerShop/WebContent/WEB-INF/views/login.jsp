<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

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
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //Meta-Tags -->

<!-- Style -->
<link rel="stylesheet" href="<%=basePath%>css/style.css" type="text/css"
	media="all">

<script>




$(function () {
    $("#submit").click(function () {
    	
    	var name = $("input[name='Userame']").val();
    	var pwd = $("input[name='Password']").val();
    	if (name == "" && pwd !="")
    	{
    		alert("用户名不能为空");
    		//$("#name").css("color","#ff0000");
   
    		return 0;
    	}
    	if (name != "" && pwd =="")
    	{
    		//$("#pwd").css("type","text");
    		alert("密码不能为空");
    		//$("#pwd").css("color","#ff0000");
    
    		return 0;
    	}
    	if (name == "" && pwd =="")
    	{	//$("#pwd").css("type","text");
    		alert("用户名和密码不能为空");
    		//$("#name").css("color","#ff0000");
    		//$("#name").css("font-size","10px");
    		//$("#pwd").val("密码不能为空");
    		//$("#pwd").css("color","#ff0000");
    	
    		return 0;
    	}
    	else{	
	    	$.ajax({
	    		async :false,
	    		type : "POST",
            	url: "../loginAction/login.do",        //后台url
                data: {                          //数据
                	Userame:$("input[name='Userame']").val(),
                	Password:$("input[name='Password']").val()
                },
                      //类型，POST或者GET
                dataType: 'text',              //数据返回类型，可以是xml、json等

                success: function (data) {      //成功，回调函数  
                	if (data == "ok"){
                		$("#submit").val("登录成功");
                		window.location.href="../jumpAction/main.do";
                	}
                	else{
                		alert("用户名或密码错误");
                		$("#name").val("");
                		$("#pwd").val("");
                		
                	}
                },
                error: function (data,type, err) {          //失败，回调函数
                    alert(type);
                }
            }); 
    	}
    })
})
    

</script>
<script>

$(document).ready(function(){

    $('#registername').on('input propertychange', function() {
     var name = $(this).val();
     var reg = 	 /^[\u4E00-\u9FA5a-zA-Z0-9_]{3,10}$/;
     if (!reg.test(name)){
    	 if (name == ""){
    		$("#nametip").css("color","#ff0000");
         	$('#nametip').html("用户名不能为空");
    	 }
    	 else{   	
     		$("#nametip").css("color","#ff0000");
     		$('#nametip').html("用户名由汉字、英文字母、数字、下划线组成，3-10位");
    	}
 	}
 	else{
 		
 	 	$.ajax({
    		async :false,
    		type : "POST",
        	url: "../registerAction/checkname.do",        //后台url
            data: {                          //数据
            	Userame:$("input[name='Name']").val(),
  
            },
                  //类型，POST或者GET
            dataType: 'text',              //数据返回类型，可以是xml、json等

            success: function (data) {      //成功，回调函数  
            	if (data == "ok"){
            		$("#nametip").css("color","#FCE169");
             		$('#nametip').html("用户名可以注册");
            	}
            	else{
                	$("#nametip").css("color","#ff0000");
             		$('#nametip').html("用户名已存在");
            		
            	}
            },
            error: function (data,type, err) {          //失败，回调函数
                alert(type);
            }
        }); 
 	 	
 	 	
 		

 	}
    });
    
    
 
    
    $('#registeremail').on('input propertychange', function() {
        var email = $(this).val();
        var reg = /^[a-z0-9]+([._\\-]*[a-z0-9])*@([a-z0-9]+[-a-z0-9]*[a-z0-9]+.){1,63}[a-z0-9]+$/;
        if (!reg.test(email)){
        	
        	if (email == ""){
        		$("#emailtip").css("color","#FD9BFD");
        		$('#emailtip').html("邮箱不能为空");
        	}
        	else{
        		$("#emailtip").css("color","#FD9BFD");
        		$('#emailtip').html("邮箱格式不正确");
        	}
    	}
    	else{
    		
    		$.ajax({
        		async :false,
        		type : "POST",
            	url: "../registerAction/checkemail.do",        //后台url
                data: {                          //数据
                	Email:$("input[name='Email']").val(),
      
                },
                      //类型，POST或者GET
                dataType: 'text',              //数据返回类型，可以是xml、json等

                success: function (data) {      //成功，回调函数  
                	if (data == "ok"){
                		$("#emailtip").css("color","#FCE169");
                 		$('#emailtip').html("邮箱可以注册");
                	}
                	else{
                    	$("#emailtip").css("color","#ff0000");
                 		$('#emailtip').html("邮箱已被注册");
                		
                	}
                },
                error: function (data,type, err) {          //失败，回调函数
                    alert(type);
                }
            }); 
     	
    	}
    });
    
    
    $('#registertel').on('input propertychange', function() {
        var tel = $(this).val();
        
        if(!(/^1(3|4|5|7|8)\d{9}$/.test(tel))){ 
        	
        	if (tel == ""){
        		$("#teltip").css("color","#DD7F03");
        		$('#teltip').html("电话号码不能为空");	
        	}
        	else{
         		$("#teltip").css("color","#DD7F03");
        		$('#teltip').html("电话号码格式不正确");
        	}
        } 
        else{
        	
        	$.ajax({
        		async :false,
        		type : "POST",
            	url: "../registerAction/checktel.do",        //后台url
                data: {                          //数据
                	PhoneNumber:$("input[name='PhoneNumber']").val(),
      
                },
                      //类型，POST或者GET
                dataType: 'text',              //数据返回类型，可以是xml、json等

                success: function (data) {      //成功，回调函数  
                	if (data == "ok"){
                		$("#teltip").css("color","#FCE169");
                 		$('#teltip').html("号码可以注册");
                	}
                	else{
                    	$("#teltip").css("color","#ff0000");
                 		$('#teltip').html("该号码已被注册");
                		
                	}
                },
                error: function (data,type, err) {          //失败，回调函数
                    alert(type);
                }
            }); 
         	
        }
    });  
    
    $('#registerpwd').on('input propertychange', function() {
        var pwd = $(this).val();
        
        if(!(/^(?![^a-zA-Z]+$)(?!\D+$)/.test(pwd)) || pwd.length<8){ 
        	if (pwd ==""){
        		$("#pwdtip").css("color","#FEA5C5");
        		$('#pwdtip').html("密码不能为空");
        	}else{

         		$("#pwdtip").css("color","#FEA5C5");
        		$('#pwdtip').html("密码必须包含数字和字母且大于等于8位");
        	}
        } 
        else{
         	$("#pwdtip").css("color","#FCE169");
        	$('#pwdtip').html("密码符合规范");
        }
    });
    
  });

$(function () {
$("#registerbtn").click(function () {
	var namestatus =$('#nametip').text();
	var telstatus = $('#teltip').text();
	var emailstatus= $('#emailtip').text();
	var pwdstatus = $('#pwdtip').text();

	if (namestatus == "用户名可以注册" && telstatus == "号码可以注册" && emailstatus == "邮箱可以注册" && pwdstatus == "密码符合规范"){
  		$("#registerbtn").val("注册成功");
    	
     	var name = $("input[name='Name']").val();
    	var pwd = $("input[name='Password2']").val();
    	var email = $("input[name='Email']").val();
    	var tel =  $("input[name='PhoneNumber']").val();
    
    	
		window.location.href="../registerAction/register.do?Name="+name+"&Email="+email+"&Password2="+pwd+"&PhoneNumber="+tel;    	
	}
	else{
		
	}
	
});
  
})


</script>
<script>
	

</script>
<style>

	#registerbtn,#submit { width: 60%;
    padding: 10px 0;
    font-size: 16px;
    font-weight: 100;
    background-color: transparent;
    color: #CCC;
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
</style>
</head>
<!-- //Head -->

<!-- Body -->
<body>

	<h1>登录表单</h1>

	<div  class="container w3layouts agileits">

		<div class="login w3layouts agileits">
			<h2>登 录</h2>
			<form >
				<input  type="text" Name="Userame" id="name" placeholder="用户名"
					 />
			
				
				 <input  type="password" Name="Password"
					id="pwd" placeholder="密码"  />
		
			
				<div class="send-button w3layouts agileits">
					<input id="submit" type="button" value="登 录">
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
			<form >
				<input style="float: left;width:150px"  type="text" Name="Name" placeholder="用户名" required="required" id="registername"/>
			
				<div style="float: left;width:150px"  id="nametip"></div>
				
				<input style="float: left;width:150px" type="text" Name="Email" placeholder="邮箱" required="required" id="registeremail"/>
				<div  style="float: left;width:150px" id="emailtip"></div>
				<input style="float: left;width:150px" type="password" Name="Password2" placeholder="密码"
					required="required" id="registerpwd"/> 	
				<div  style="float: left;width:150px" id="pwdtip"></div>
	
				<input style="float: left;width:150px" type="text" Name="PhoneNumber"
					placeholder="手机号码" required="required" id="registertel"/>
					
			<div  style="float: left;width:150px" id="teltip"></div>
			
			
				<div class="send-button w3layouts agileits">

					<input id="registerbtn" type="button" value="免费注册">

				</div>
			</form>

			<div class="clear"></div>
		</div>

		<div class="clear"></div>

	</div>



</body>
<!-- //Body -->

</html>