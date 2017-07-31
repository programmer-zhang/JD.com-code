<%@ page language="java" import="java.util.*,beans.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

GoodsBeanBO gbb=new GoodsBeanBO();
String sousuo = request.getParameter("sousuo");
//接收pageNow
String s_pageNow=(String)request.getAttribute("abc");

int pageNow=1;
if(s_pageNow!=null){

	//string->int
	pageNow=Integer.parseInt(s_pageNow);
}
//默认显示第一页
ArrayList al=gbb.getGoods(6,pageNow,sousuo);


int pageCount=gbb.getPageCount(6,sousuo);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
     <meta charset="UTF-8">
    <title>购物页面</title>
    <link rel="stylesheet" type="text/css" href="css/reset.css">
    <link rel="stylesheet" type="text/css" href="css/index.css">
    <link rel="stylesheet" type="text/css" href="css/common.css">
    <link rel="stylesheet" type="text/css" href="css/cart.css">
    <link rel="stylesheet" type="text/css" href="css/login.css.css">
   
    
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
    <div class="shortcut">
        <div class="public-shortcut">
            <ul>
               <%  
           			String name = (String)request.getSession().getAttribute("name");
           			if(name!=null){
           		%>
           		<li><a href=""><%=name %></a></li>
           		<li><a href="LoginServlet">注销</a></li>
           		<%}else{ %>
                <li><a href="login.jsp">您好，请登录</a></li>
                <li><a href="zhuce.jsp" style="color: red">快速注册</a></li>
                <%} %>
                <li><a href="dingdan.jsp">我的订单</a></li>
                <li><a href="cart.jsp">购物车</a></li>
                <li><a href="">客户服务</a></li>
                <li><a href="">网站导航</a></li>
            </ul>
        </div>
    </div>
    <div class="cart-top">
        <img src="images/logo-201305-b.png" alt="">
        <img src="images/cart-icon.png" alt="">
        <div>
            <input type="text" placeholder="夏季必备"><input type="button" value="搜索">
        </div>
    </div>
    <div class="cart-cart"></div>
    <div class="cart-footer">
        <div class="cart-footer-img">
            <img src="images/service_items_1.png" alt=""><img src="images/service_items_2.png" alt=""><img src="images/service_items_3.png" alt=""><img src="images/service_items_4.png" alt="">
        </div>
    <div class="index-sale">
        <div class="sale">
            <div class="index-sale-t">
                <div>
                    <img src="images/seckill_hd.png">
                    <div class="index-sale-t-corner"></div>
                </div>
                
                <table width="100%" border="1" cellpadding="0" cellspacing="0" class="abc">
  
  
  				<%
  
  			  		int time=0;
  			
  					for(int i=0;i<2;i++){
  			
  					//打印两大行(每行有三个）
  				
  				%>
  				<tr>
  				<%
  					for(int j=0;j<3;j++){
  					
  					GoodsBean gb=new GoodsBean();
  					if(time>=al.size()){
  						
  						break;
  						
  					}else{
  					
  					gb=(GoodsBean)al.get(time);
  					time++;
  					}
  				//取出三个 al.size=3 time<=2
  				/**for(int j=0;j<3;j++){
  					
  					GoodsBean gb=new GoodsBean();
  					if(time<al.size()){
  						gb=(GoodsBean)al.get(time);
  						time++;
  					}**/
  					%>
  		<td width="33%" height="174" align="center"><table class="abc" width="100%" height="170" border="1" cellpadding="0" cellspacing="0">
      <tr>
        <td width="32%" rowspan="3"><img src="images/<%=gb.getPhoto() %>" width="112" height="112" /></td>
        <td width="68%" height="51">&nbsp;</td>
      </tr>
      <tr>
        <td height="28" align="left" valign="top"><%=gb.getName() %></td>
      </tr>
      <tr>
        <td height="27" align="left" valign="top">价格: $<%=gb.getPrice() %> </td>
      </tr>
      <tr>
        <td height="56" colspan="2" align="left" valign="top">总件数： <%=gb.getNumber() %> </td>
        </tr>
        <tr>
        <td><a href="ProductServlet?GoodsId=<%=gb.getGoodsId()%>&sousuo=<%=sousuo%>"><input type="button" name="tianjia" value="添加"></a></td>
        </tr>
    </table></td>
  					<%
  				}
  			%>
  			</tr>
  			<%
  			
  			//判断是否第一大行结束
  			if(i==0){
  			
  				%>
  				<tr>
    <td colspan="3" height="10" align="center" bgcolor="#FFCCCC"></td>
  </tr>
  				<%
  			}
  			
  			}
   %>
 
  <tr>
    <td colspan="3" align="center">
    <%
    	for(int i=1;i<=pageCount;i++){
    		
    		%>
    		<a href="GoodsServlet?pageNow=<%=i %>">【<%=i %>】</a>
    		<%
    	}
    
     %>
    </td>
  </tr>
</table>
            </div>
            <div class="index-sale-b1"></div>
            <div class="index-sale-b2"></div>
            <div class="index-sale-b3"></div>
        </div>
    </div>
        <div class="cart-footer-info">
            <div class="cart-footer-info-center">
                <div class="cart-info">
                    <ul>购物指南
                        <li>购物流程</li>
                        <li>会员介绍</li>
                        <li>生活旅行/团购</li>
                        <li>常见问题</li>
                        <li>大家电</li>
                        <li>联系客服</li>
                    </ul>
                    <ul>配送方式
                        <li>上门自提</li>
                        <li>211限时达</li>
                        <li>配送服务查询</li>
                        <li>配送费收取标准</li>
                        <li>海外配送</li>
                    </ul>
                    <ul>支付方式
                        <li>货到付款</li>
                        <li>在线支付</li>
                        <li>邮局汇款</li>
                        <li>公司转账</li>
                    </ul>
                    <ul>售后服务
                        <li>售后政策</li>
                        <li>价格保护</li>
                        <li>退款说明</li>
                        <li>返修/退换货</li>
                        <li>取消订单</li>
                    </ul>
                    <ul>特色服务
                        <li>夺宝岛</li>
                        <li>DIY装机</li>
                        <li>延保服务</li>
                        <li>京东E卡</li>
                        <li>京东通信</li>
                        <li>京东JD+</li>
                    </ul>
                </div>
            </div>
            <p> 京公网安备 11000002000088号  |  京ICP证070359号  |  互联网药品信息服务资格证编号(京)-经营性-2014-0008  |  新出发京零 字第大120007号<br>互联网出版许可证编号新出网证(京)字150号  |  出版物经营许可证  |  网络文化经营许可证京网文[2014]2148-348号  |  违法和不良信息举报电话：4006561155<br>Copyright © 2004-2017  京东JD.com 版权所有  |  消费者维权热线：4006067733    经营证照<br>京东旗下网站：京东钱包</p>
        </div>
        <div class="cart-footer-div">
            <a href="#">顶部</a>
        </div>
    </div>
</body>
</html>
