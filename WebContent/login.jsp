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
<link rel="stylesheet" type="text/css" href="css.css" />
<title>iCart HTML Version</title>
<base href="<%=basePath%> ">
</head>
<body>

	<style type="text/css">
/* content */
#content .content {
	padding: 10px;
	overflow: auto;
	margin-bottom: 20px;
	width: 350px;
	float: left;
	background-color: #eee;
	border: 1px solid #BBBBBB;
	box-shadow: 1px 1px 1px #FFFFFF inset;
	margin-right: 20px;
}

.f1 {
	margin-left: 100px;
}
</style>

	<div class="menu">
		<jsp:include page="mhead.jsp" />
	</div>


	<div class="header">
		<div class="logo_img">
			<a href="index.jsp"><img alt="Site Name" src="images/logo.png"></a>
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

	<div style="width: 1000px; margin: 0 auto; margin-top: 10px;">
		<div class="linktree">
			<a href="index.jsp">主页</a>&raquo; <a href="#">登录</a>
		</div>

		<h1 style="margin-top: -10px;">用户登录</h1>

		<div id="content">
			<div class="login-content">
				<div class="left">
					<h2>新用户注册</h2>
					<div class="content">
						<p>
							<b>注册账户</b>
						</p>
						<p>通过创建账户您将成为我们网站的一员，您可以自由的挑选并购买你喜爱的商品，我们会为您提供最优质的服务。</p>
						<a href="register.jsp" class="button"><span>注册</span></a>
					</div>
				</div>
				<div class="right" style="margin-left: 10px">
					<h2>已注册用户</h2>
					<div class="content">
						<form action="LoginServlet" method="post" class="f1">

							<p>我是已注册老用户</p>
							<b>账号</b><br /> <input type="text" name="username"> <br />
							<br /> <b>密码</b><br /> <input type="password" name="userpwd">
							<br> <br> <br> <input type="submit" value="登录"
								class="sub_buttons">
						</form>
					</div>
				</div>
			</div>
		</div>

	</div>
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

</body>
</html>