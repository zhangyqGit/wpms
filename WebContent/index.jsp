<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html lang="en" dir="ltr">
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css.css" />
<title>iCart 外设</title>
</head>
<body>
	<div class="menu">
		<jsp:include page="mhead.jsp" />
	</div>

	<div class="header">
		<div class="logo_img">
			<a href="default.htm"><img alt="Site Name"
				src="./images/logo.png"></a>
		</div>
	</div>
	<div id="menu">
		<ul>
			<li><a href="ProListServlet?proclass=鼠标">鼠标</a>
				<div>
					<ul>
						<li><a href="ProListServlet?proclass=鼠标">有线鼠标</a></li>
						<li><a href="ProListServlet?proclass=鼠标">无线鼠标</a></li>
					</ul>
				</div></li>
			<li><a href="ProListServlet?proclass=键盘">键盘</a></li>
			<li><a href="ProListServlet?proclass=U盘">U盘</a></li>
			<li><a href="ProListServlet?proclass=键鼠套装">键鼠套装</a></li>
			<li><a href="ProListServlet?proclass=移动硬盘">移动硬盘</a></li>
		</ul>
	</div>

	<div id="wrapper">
		<div class="slider-wrapper theme-orman">
			<div class="ribbon"></div>
			<div id="slider" class="nivoSlider"
				style="border: 1px solid #444; box-shadow: 0 0 5px 0 #080808;">
				<a href="default.htm"><img src="./images/ba1.jpg" alt=""
					title="中秋国庆双节折扣来临" /></a> <a href="default.htm"><img
					src="./images/ba2.jpg" alt="" title="这是最新款的键盘" /></a>
			</div>
			<br>
			<div class="controlNav_box"></div>
		</div>
	</div>
	<script type="text/javascript" src="slider/scripts/jquery-1.7.1.min.js"></script>
	<script type="text/javascript" src="slider/jquery.nivo.slider.pack.js"></script>
	<script type="text/javascript">
		$(window).load(function() {
			$('#slider').nivoSlider();
		});
	</script>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<div class="icart-footer">
		<div class="icart-footer-top">
			<div style="width: 1000px; margin: 0 auto;"></div>
		</div>
		<div class="icart-footer-container">
			<div class="column_footer">
				<div class="footer_description"
					style="margin-top: 30px; margin-left: 30px">
					<img alt="Site Name" src="images/002.png"> <img
						alt="Site Name" src="images/002.jpg"><br> <img
						alt="Site Name" src="images/001.png"> <img alt="Site Name"
						src="images/003.png">
				</div>
			</div>

			<div class="column_footer" style="width: 350px;">
				<h3>商品覆盖范围</h3>
				<div class="footer_description">本店自营覆盖区县
					本店已向全国2392个区县提供自营配送服务，支持货到付款、POS机刷卡和售后上门服务</div>
			</div>
			<div class="column_footer" style="width: 300px">
				<h3>关于我们</h3>

				iCart外设商城目前已成长为中国靠前的自营式电商企业，2015年第三季度在中国自营式B2C电商市场的占有率为56.9%。本商城致力于为消费者提供愉悦的在线购物体验。
			</div>

			<div class="clearfix"></div>
		</div>
		<div class="icart-footer-bottom">
			<div style="width: 1000px; margin: 0 auto;">

				<ul>
					<li style="float: right; padding-top: 10px; list-style: none;">&copy;
						ICart外设 &copy; 2016.ICart外设 All rights reserved. - Creation By:张永强</li>
				</ul>
				<div class="clearfix"></div>
			</div>

		</div>
	</div>

</body>
</html>