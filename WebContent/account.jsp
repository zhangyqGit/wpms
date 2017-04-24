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
<style>
.cart-info {
	padding-left: 200px;
}

.cart-info table {
	width: 70%;
}

.cart-info td {
	background-color: #F4F4F4;
	border: 2px solid #BBBBBB;
	box-shadow: 1px 1px 1px #FFFFFF inset;
}
#recharge {
	position: absolute;
    margin-left: 430px;
    margin-top: -90px;
    border: 1px #ccc solid;
    padding: 10px;
    background: #fff;
    display:none;
}
.sub_buttons {
    float: none;
    width: 40px;
    font-weight: normal;
}
#content .content li {
	padding: 0px;
}
#content .content li a{
	margin: 10px;
	display:block;
}
</style>
</head>
<script>
function hide() {
	var obj = document.getElementById('recharge');
	if (obj.style.display == 'block') {
		obj.style.display = 'none';
	} else {
		obj.style.display = 'block';
	}
}
</script>
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
		<div id="column-right">
			<div class="box"></div>
		</div>
		<div id="content">
			<h2>我的账户</h2>
			<div class="cart-info">
				<table>
					<tr>
						<td rowspan=3><img width="100px" height="100px"
							src="ProImgServlet?fname=${user.username}"></td>
						<td colspan=2>用户名： ${user.username }</td>
					</tr>
					<tr>
						<td>ICART钱包余额</td>
						<td>￥${user.useraccount }&nbsp;&nbsp;<a onclick="hide()" class="button" style="width: 80px;font-weight: NORMAL;"><span>点击充值</span></a>
					</tr>
				</table>
				<div id="recharge">
				<form action="AccountUptServlet" method="post">
					<input type="hidden" name="userid" value="${user.userid}"/>
					请输入充值金额：<input name="uaccount" type="text" />
					<input type="submit" value="充值" class="sub_buttons">
				</form>
				</div>
			</div>
			<div class="content">
				<ul>
					<li><a href="user/userupdate.jsp">修改个人信息</a></li>
					<li><a href="GetOrderServlet?userid=${user.userid} ">查看订单信息</a></li>
					<li><a href="ProListServlet?proclass=键盘">go shopping!</a></li>
				</ul>
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