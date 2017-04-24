<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" dir="ltr">
<head>
<script>
	function setImgPreview() {
		var docObj = document.getElementById("doc");
		var imgObj = document.getElementById("preview");
		if (docObj.files && docObj.files[0]) {
			imgObj.style.display = 'block';
			imgObj.style.width = '100px';
			imgObj.style.height = '100px'
			imgObj.src = window.URL.createObjectURL(docObj.files[0]);
		}
	}
</script>
<link rel="stylesheet" type="text/css" href="css.css" />
<title>iCart HTML Version</title>
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
			<a href="index.jsp">首页</a> &raquo; <a href="#">注册</a>
		</div>
		<div id="column-right">
			<div class="box"></div>
		</div>
	</div>

	<div id="content">
		<div class="login-content">
			<div class="right">
				<h2>新用户注册</h2>
				<div class="content">
					<form action="RegisterServlet" method="post" class="f1" enctype="multipart/form-data">
						<input type="hidden" name="userrole" value="orduser">
							<b>头像</b><br />
							<input type="file" class="form-control" id="doc" name="propic"
								onchange="setImgPreview()">
							<p>
								<div id="LocalImg">
											<img id="preview" witth=-1 height=-1 style="display: none;">
										</div>
										</p>
						 <b>账号</b><br /> <input type="text" name="username" value="" /><span>${msg }</span><br>
						<br> <b>密码</b><br /> <input type="password" name="userpwd"
									value="" /><br> <br> <b>性别</b><br /> <input
									type="radio" name="usersex" value="男" />男&nbsp; <input
									type="radio" name="usersex" value="女" />女<br> <br> <b>邮箱</b><br />
						<input type="text" name="usermail" value="" /><br> <br>
						<input type="submit" value="注册" class="sub_buttons">

					
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