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
    <title>登录页面</title>
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
            <img src="images/logo-201305-b.png" alt=""><img src="images/l-icon.png" alt="">
        </div>
    </div>
    <div class="login-content">
        <div class="login-content-box">
            <div>
                <p>&nbsp&nbsp账号登录</p>
                <form method="post" action="LoginServlet">
                <input type="text" placeholder="邮箱/用户名/已验证手机号" name="username1"><input type="password" placeholder="密码" name="password1"><input type="submit" name="submit"value="登  录">
                <a href="zhuce.jsp">立即注册</a>
                </form>
            </div>
        </div>
    </div>
    <div class="login-footer">
        <p>Copyright © 2004-2017  京东JD.com 版权所有</p>
    </div>
</body>
</html>
