<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*,com.wpms.model.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>iCart HTML Version</title>
<base href="<%=basePath%> ">
</head>
<body>
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
			<a href="index.jsp">首页</a> &raquo; <a href="#">${class }</a>
		</div>
		<br>
		<h1 style="margin-top: -10px;">${class }</h1>
		<br>
		<div id="notification"></div>
		<div id="column-left">


			<div class="box">
				<div class="box-heading_left">商品</div>
				<div class="box-content" style="background: none; border: none;">
					<div class="box-category">
						<ul>
                            <li><a href="ProListServlet?proclass=鼠标">鼠标</a></li>
							<li><a href="ProListServlet?proclass=键盘">键盘</a></li>
							<li><a href="ProListServlet?proclass=U盘">U盘</a></li>
							<li><a href="ProListServlet?proclass=键鼠套装">键鼠套装</a></li>
							<li><a href="ProListServlet?proclass=移动硬盘">移动硬盘</a></li>
						</ul>
					</div>
				</div>
			</div>

		</div>

		<div id="content">

			<div class="column">
				<div class="category-list block">
					<h2>商品列表</h2>
					<div class="column20p"></div>
				</div>
			</div>

			<div class="product-list">
				<c:forEach items="${list }" var="pro" varStatus="states">
					<div class="struct">
						<div class="struct-right"></div>
						<div class="struct-left"></div>
						<div class="struct-center">
							<div class="line">
								<a href="ProDetailServlet?proid=${pro.proid}&&urole=${user.userrole }" class="image-link">
									<div class="image">
										<img width="100px" height="100px"
											src="ProImgServlet?fname=${pro.proname}">
									</div>
								</a>

								<div class="right">
									<div class="price">
										<h3>价格:${pro.proprice}</h3>
									</div>
									<div class="cart combo">
										<a href="ProDetailServlet?proid=${pro.proid}&&urole=${user.userrole }" title="购买"><span
											class="icon icon-basket">&nbsp;</span></a>
									</div>
								</div>

								<div class="name">
									<a href="#">${pro.proname}</a>
								</div>
								<div class="description">
									<h3>商品种类:${pro.proclass }</h3>
									<h3>商品厂家:${pro.profirm }</h3>

								</div>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>

				</c:forEach>



			</div>
			<div class="clearfix"></div>
			<div class="column">
				<div class="pagination">
					<div class="results">共_页 现在_页</div>
				</div>
			</div>

		</div>

	</div>

	<br>
	<br>
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