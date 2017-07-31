<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
  <meta charset="UTF-8">
    <title>注册页面</title>
    <script type="text/javascript">
    	function inputCustomer(){
		var username1=document.getElementById("username1");
		var password1=document.getElementById("password1");
		if(username1.value==""){
			alert("用户名不能为空！");
			return false;
		}else if(password1.value.length<=6){
			alert("密码不能低于7位！");
			return false;
		}
	}
    </script>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/cart.css">
    <link rel="stylesheet" type="text/css" href="css/login.css">
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	
  </head>
  
 <body>
    <div class="login-header">
        <div>
            <img src="images/logo-201305-b.png" alt="">
        </div>
    </div>
    <div class="login-content">
        <div class="login-content-box">
            <div>
           		<form action="ZhuceServlet" method="post" onSubmit="return inputCustomer()">
                <p>&nbsp&nbsp账号注册</p>
                <input type="text" placeholder="用户名" name="username" ><input type="password" placeholder="密码" name="password" >
                <input type="submit" name="submit" value="注册并登陆"><input type="reset"name="reset" value="重置">
                </form>
                <a href="index.jsp">返回 </a> 
            </div>
            
        </div>
    </div>
   
</body>
</html>
