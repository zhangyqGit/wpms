 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css.css" />
<title>购物车</title>
<base href="<%=basePath %> ">
<style>
.cart-info td a{
	color:#00F;
	line-height:19px;
	text-decoration:none;
	font-weight:bold;
	text-shadow: 0 1px #fff;
	padding:3px;
} 
.cart-info{padding-left: 200px;}
.cart-info table {
	width: 70%;
}
</style>
</head>
<body>
	<div class="menu">
		<jsp:include page="../mhead.jsp" />
	</div>


<div class="header">
<div class="logo_img"><a href="index.jsp"><img alt="Site Name" src="images/logo.png"></a></div></div>

<div id="menu">
<ul>  
<li><a href="categories.jsp">鼠标</a>
<div>        
<ul>  
<li><a href="default.htm">有线鼠标 (0)</a></li>
<li><a href="default.htm">无线鼠标 (1)</a></li>
</ul>
</div>
</li>
<li><a href="categories.jsp">键盘</a>    
<div>
<ul>  
<li><a href="default.htm">薄膜键盘 (0)</a></li>
<li><a href="default.htm">机械键盘 (0)</a></li>
</ul>
</div>
</li>
<li><a href="categories.jsp">U盘</a>
<div>
<ul>  
<li><a href="default.htm">魔音 (0)</a></li>
<li><a href="default.htm">铁三角 (2)</a></li>
<li><a href="default.htm">蓝牙耳机 (0)</a></li>
</ul>
</div>
</li>
<li><a href="categories.jsp">键鼠套装</a></li>
<li><a href="categories.jsp">移动硬盘</a></li>
<li><a href="categories.jsp">电脑清洁</a></li>
</ul>
</div>




<div style="width:1000px;margin: 0 auto;margin-top:10px;">
<div class="linktree">
        <a href="#">首页</a>
         &raquo; <a href="#">订单</a>
    </div>
<h1 style="margin-top:-10px;">您的订单</h1>

<br>
      <div class="cart-info">
        <table border="10">
          <thead>
          <tr>
          <td colspan=3 style="text-align: center"><h3><b>订单编号:${order.orderid }&nbsp;物品数量:${order.ordercount }&nbsp;订单总额:${order.ordermoney }&nbsp;下单时间:${otime }</b></h3></td>
          </tr>
               <tr>
               <td>商品名</td>
               <td>商品图片</td>
               <td>数量</td>               
               </tr>
          </thead>
          <tbody>
              <c:forEach items="${list}" var="ord" varStatus="states">     
              <tr>
              <td>${ord.proname }</td>
              <td><img width="100px" height="100px" src="ProImgServlet?fname=${ord.proname }" ></td>
              <td>${ord.ordercount }</td>
            </tr>
            </c:forEach>
                    <tr><td colspan=3 align=center><a href="GetOrderServlet?userid=${user.userid}" class="button" style="width:120px;"><span>返回</span></a></td></tr>
            </tbody>
       </table>
      </div>
</div>
<div class="icart-footer">
<div class="icart-footer-top">
	<div style="width:1000px; margin:0 auto;">	
	</div>
</div>
<div class="icart-footer-container">
		<div class="column_footer" >
	<div class="footer_description" style="margin-top:30px;margin-left:30px">
		<img alt="Site Name" src="images/002.png">
		<img alt="Site Name" src="images/002.jpg"><br>
		<img alt="Site Name" src="images/001.png">
		<img alt="Site Name" src="images/003.png">
		</div>
	</div>

	<div class="column_footer" style="width:350px;">
		<h3>商品覆盖范围</h3>
<div class="footer_description">
		本店自营覆盖区县
本店已向全国2392个区县提供自营配送服务，支持货到付款、POS机刷卡和售后上门服务
</div>
	</div>
<div class="column_footer" style="width:300px">
		<h3>关于我们</h3>

		iCart外设商城目前已成长为中国靠前的自营式电商企业，2015年第三季度在中国自营式B2C电商市场的占有率为56.9%。本商城致力于为消费者提供愉悦的在线购物体验。
	</div>	

	<div class="clearfix"></div>
	</div>		
	<div class="icart-footer-bottom">
		<div style="width:1000px; margin:0 auto;">				

			<ul>
			<li style="float:right;padding-top:10px;list-style:none;">&copy; ICart外设 &copy; 2016.ICart外设 All rights reserved. -  Creation By:张永强</li>
			</ul>		
		<div class="clearfix"></div>
		</div>

</div>
</div>

</body>
</html>