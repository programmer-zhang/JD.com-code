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
    <title>购物网站</title>
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
  
  <body background-color="#f2f2f2">
    <div class="shortcut">
        <div class="public-shortcut">
            <img src="images/logo.jpg" class="logo">
           
            <ul>
           		<%  HttpSession ht = request.getSession(true);
           			String name = (String)ht.getAttribute("name");
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
    <div class="header">
        <div class="public-header">
            <form action="sousuo.jsp" method="get">
            <input type="text" class="searchtext" name="sousuo" placeholder="夏季必备"><input type="submit" class="searchbutton" value="搜索">
            </form>
            
            <ul class="nav">
                <li>秒杀</li>
                <li>优惠券</li>
                <li>拍卖</li>
                <li>闪购</li>
                <li>服装城</li>
                <li>超市</li>
                <li>生鲜</li>
                <li>全球购</li>
                <li>金融</li>
            </ul>
        </div>
    </div>
    <div class="index-banner">
        <div class="banner">
            <div class="banner-nav">
                <ul class="nav1">
                    <li class="nav1-li">数码3C
                        <ul>
                            <li><a href="phone.jsp?lei=shouji">手机</a></li>
                            <li>电脑</li>
                            <li>手机配件</li>
                            <li>手机</li>
                            <li>电脑</li>
                            <li>手机配件</li>
                            <li>手机</li>
                            <li>电脑</li>
                            <li>手机配件</li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav1">
                    <li class="nav1-li">家居建材
                        <ul>
                            <li><a href="phone.jsp?lei=jiaju">家俱</a></li>
                            <li>厨房卫浴</li>
                            <li>灯具</li>
                            <li>家俱</li>
                            <li>厨房卫浴</li>
                            <li>灯具</li>
                            <li>家俱</li>
                            <li>厨房卫浴</li>
                            <li>灯具</li>
                            <li>家俱</li>
                            <li>厨房卫浴</li>
                            <li>灯具</li>
                            <li>家俱</li>
                            <li>厨房卫浴</li>
                            <li>灯具</li>
                            <li>家俱</li>
                            <li>厨房卫浴</li>
                            <li>灯具</li>
                            <li>家俱</li>
                            <li>厨房卫浴</li>
                            <li>灯具</li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav1">
                    <li class="nav1-li">服装服饰
                        <ul>
                            <li>男装</li>
                            <li>女装</li>
                            <li>鞋品</li>
                            <li>男装</li>
                            <li>女装</li>
                            <li>鞋品</li>
                            <li>男装</li>
                            <li>女装</li>
                            <li>鞋品</li>
                            <li>男装</li>
                            <li>女装</li>
                            <li>鞋品</li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav1">
                    <li class="nav1-li">汽车用品
                        <ul>
                            <li>汽车装具</li>
                            <li>清洁用品</li>
                            <li>维修保养</li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav1">
                    <li class="nav1-li">医药保健
                        <ul>
                            <li>滋补养生</li>
                            <li>计生情趣</li>
                            <li>保健器械</li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav1">
                    <li class="nav1-li">食品生鲜
                        <ul>
                            <li>海鲜产品</li>
                            <li>各地特产</li>
                            <li>中外名酒</li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav1">
                    <li class="nav1-li">母婴用品
                        <ul>
                            <li>奶粉</li>
                            <li>尿不湿</li>
                            <li>童车童床</li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav1">
                    <li class="nav1-li">图书音像
                        <ul>
                            <li>儿童</li>
                            <li>文艺</li>
                            <li>科技</li>
                        </ul>
                    </li>
                </ul>
                <ul class="nav1">
                    <li class="nav1-li">机票酒店
                        <ul>
                            <li>交通出行</li>
                            <li>星级酒店</li>
                            <li>旅游度假</li>
                        </ul>
                    </li>
                </ul>
            </div>
            <div class="banner-img">
                <div class="img-t">
                    <div>
                        <!--<div class="icondiv">-->
                            <!--<i id="i1" class="icon"></i>-->
                            <!--<i id="i2" class="icon"></i>-->
                            <!--<i id="i3" class="icon"></i>-->
                            <!--<i id="i4" class="icon"></i>-->
                            <!--<i id="i5" class="icon"></i>-->
                        <!--</div>-->
                        <div >
                            <ul id="photos">
                                <li><img src="images/59152102N18c10880.jpg" alt=""></li>
                                <li><img src="images/591a71bfN7bed2e4e.jpg" alt=""></li>
                                <li><img src="images/5913cbcfN1195efdc.jpg" alt=""></li>
                                <li><img src="images/591556bfNd648bf48.jpg" alt=""></li>
                                <li><img src="images/59192141N3d96e8d0.jpg" alt=""></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="img-bl"><img src="images/59118ba6N72b56d4e.jpg" alt="别看了图片没了"></div>
                <div class="img-br"><img src="images/58ff387dN45a037d6.jpg" alt="别看了图片没了"></div>
            </div>
            <div class="banner-info">
                <div class="banner-info-t">
                    <ul>
                        <li class="huafei">话费
                            <div class="banner-info-t-h">
                                <br>&nbsp&nbsp号码：<input type="text">
                                <br><br>&nbsp&nbsp面值：<select id="money">
                                        <option value="">50元</option>
                                        <option value="">100元</option>
                                        <option value="">150元</option>
                                        <option value="">200元</option>
                                 </select>
                                <br><br><input type="button" value="快速充值" class="button">
                            </div>
                        </li>
                        <li class="jipiao">机票
                            <div class="banner-info-t-j">
                                <br>出发:<input type="text">
                                <br><br>到达:<input type="text">
                                <br><br>时间:<input type="text">
                                <br><br><input type="button" value="机票查询" class="button">
                            </div>
                        </li>
                    </ul>
                </div>
                <div class="banner-info-b">
                    <ul>
                        <li class="jiudian">酒店
                            <div class="banner-info-b-d">
                                <img src="images/banner-info-b-d.jpg" alt="">
                            </div>
                        </li>
                        <li class="youxi">游戏
                            <div class="banner-info-b-y">
                                <img src="images/banner-info-b-y.jpg" alt="">
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    <div class="index-sale">
        <div class="sale">
            <div class="index-sale-t">
                <div>
                    <img src="images/seckill_hd.png">
                    <div class="index-sale-t-corner"></div>
                </div>
                <div class="index-sale-t-img"></div>
                <div class="index-sale-t-img"></div>
                <div class="index-sale-t-img"></div>
                <div class="index-sale-t-img"></div>
                <div class="index-sale-t-img"></div>
                <div class="index-sale-t-img"></div>
            </div>
            <div class="index-sale-b1"></div>
            <div class="index-sale-b2"></div>
            <div class="index-sale-b3"></div>
        </div>
    </div>
    <div class="footer">
        <div class="public-footer">
            <div class="footer-t">
                <h3>快速导航</h3>
                <ul>网站帮助
                    <li>在线提问</li>
                    <li>意见建议</li>
                    <li></li>
                </ul>
                <ul>加入我们
                    <li>事业特色</li>
                    <li>建店支持</li>
                    <li>经营管理</li>
                    <li>在线申请</li>
                </ul>
                <ul>在线支付
                    <li>支付平台</li>
                    <li>支付流程</li>
                    <li>支付帮助</li>
                </ul>
                <ul>关于我们
                    <li>关于公司</li>
                    <li>关于团队</li>
                    <li>联系我们</li>
                    <li>社会责任</li>
                </ul>
                <ul>售后服务
                    <li>售后政策</li>
                    <li>价格保护</li>
                    <li>退款说明</li>
                    <li>返修/退换货</li>
                    <li>取消订单</li>
                </ul>
            </div>
        </div>
        <p class="footer-b">保留一切权利</p>
        <div class="footer-div">
            <a href="#">顶部</a>
        </div>
        <div class="footer-div1">
            <a href=""></a>
        </div>
        <div class="footer-div2">
            <a href="cart.jsp">1</a>
        </div>
        <div class="footer-div3">
            <a href="login.jsp">_</a>
        </div>
    </div>
</body>
</html>
