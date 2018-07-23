<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<%  String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>

<!-- Head -->
<head>

<title>用户信息</title>

<!-- Meta-Tags -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<script type="text/javascript" src="<%=basePath%>js/jquery-1.6.1.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/userinfo.js"></script>
<!-- //Meta-Tags -->

<!-- Style -->
<link rel="stylesheet" href="<%=basePath%>css/userinfo.css" type="text/css"
	media="all">
<script>
$(function () {
	$("#addaccount").click(function () {
		var account = $("#account").val();
		$.ajax({
    		async :false,
    		type : "POST",
        	url: "../jumpAction/addaccount.do",        //后台url
            data: {                          //数据
            	account:account,
  
            },
                  //类型，POST或者GET
            dataType: 'text',              //数据返回类型，可以是xml、json等

            success: function (data) {      //成功，回调函数  
            	$("#useraccount").val(data+"元");
            	$("#account").val("");
            },
            error: function (data,type, err) {          //失败，回调函数
                alert(type);
            }
        }); 
	
	})
	});

</script>
<style>
    
    body {                                

        overflow: hidden;

        position: fixed;

        width:100%;

        height:100%;

        background: url("<%=basePath%>images/backpic.jpg") no-repeat;

        background-size:cover;

	}
</style>

</head>
<!-- //Head -->

<!-- Body -->
<body>
	 <div class="main" style="text-align: center;margin-top: 100px;">
      <div class="one">
        <div class="register">
          <h3>个人信息如下：</h3>
          <form id="reg-form">
            <div>
              <label for="name">用户名</label>
              <input readonly="true" type="text" value = "${customer.getName()}" id="name" spellcheck="false" placeholder=""/>
     
            </div>
            <div>
              <label for="email">邮箱</label>
              <input readonly="true" value = "${customer.getEmail()}" type="text" id="email" spellcheck="false" placeholder="shridhardeshmukh@xyz.com"/>
            </div>
            <div>
              <label for="username">手机号码</label>
              <input readonly="true" value = "${customer.getPhoneNumber()}" type="text" id="username" spellcheck="false" placeholder="shree33" />
            </div>
            <div>
              <label for="password">注册日期</label>
              <input readonly="true" value = "${customer.getRegisterDate()}" type="text" id="password" />
            </div>
            <div>
              <label for="password-again">密码</label>
              <input readonly="true" value = "${customer.getPassword()}" type="text" id="password-again" />
            </div>
            <div>
              <label for="password-again">用户余额</label>
              <input readonly="true" value = "${account}" type="text" id="useraccount" />
            </div>
            <div>
              <label for="password-again">充值金额</label>
              <input type="text" id="account" onkeyup='this.value=this.value.replace(/\D/gi,"")'/>
            </div>
            <div>
              <label></label>
              <a href="../jumpAction/main.do" class="button" style="text-decoration: none;">返回主页</a></li>
              <a id="addaccount" class="button" style="text-decoration: none;">充值</a></li>
            </div>
         
          </form>
       
        </div>
      </div>
      
      
    </div>
	</body>


</html>