<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<link rel="stylesheet" type="text/css" href="../css.css" />
<title>iCart HTML Version</title>
<base href="<%=basePath%> ">
</head>
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
	function hide() {
		var obj = document.getElementById('comment');
		if (obj.style.display == 'block') {
			obj.style.display = 'none';
		} else {
			obj.style.display = 'block';
		}
	}
</script>
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
</style>

	<div class="menu">
		<jsp:include page="../mhead.jsp" />
	</div>



	<div class="header">
		<div class="logo_img">
			<a href="index.jsp"><img alt="Site Name" src="images/logo.png"></a>
		</div>
	</div>

	<div id="menu">
		<ul>
			<li><a href="categories.jsp">鼠标</a>
				<div>
					<ul>
						<li><a href="default.htm">有线鼠标 (0)</a></li>
						<li><a href="default.htm">无线鼠标 (1)</a></li>
					</ul>
				</div></li>
			<li><a href="categories.jsp">键盘</a>
				<div>
					<ul>
						<li><a href="default.htm">薄膜键盘 (0)</a></li>
						<li><a href="default.htm">机械键盘 (0)</a></li>
					</ul>
				</div></li>
			<li><a href="categories.jsp">U盘</a>
				<div>
					<ul>
						<li><a href="default.htm">魔音 (0)</a></li>
						<li><a href="default.htm">铁三角 (2)</a></li>
						<li><a href="default.htm">蓝牙耳机 (0)</a></li>
					</ul>
				</div></li>
			<li><a href="categories.jsp">键鼠套装</a></li>
			<li><a href="categories.jsp">移动硬盘</a></li>
			<li><a href="categories.jsp">电脑清洁</a></li>
		</ul>
	</div>

	<div style="width: 1000px; margin: 0 auto; margin-top: 10px;">

		<div id="column-right">
			<div class="box"></div>
		</div>
	</div>

	<div id="content">
		<div class="login-content">
			<div class="right">
				<h2>会员信息修改</h2>
				<div style="position: absolute; margin-left: 250px; margin-top: 20px;">
					<div class="col-lg-4">
						点击头像可进行修改 <br/><img src="ProImgServlet?fname=${sessionScope.user.username}"
							style="width: 130px; height: 130px; border-radius: 50%;"
							onclick="hide()">
					</div>
					<div id="comment" style="display: none;">
						<form action="ImgUpdServlet">
							<input type="file" class="form-control" id="doc" name="propic" style="width:200px"
								onchange="setImgPreview()">
							<p>
							<div id="LocalImg" style="margin-left: 40px;margin-top: 10px;">
								<img id="preview" style="display: none;">
							</div>
							</p>
							<br> <input type="submit"
								class="btn btn-rounded btn-primary btn-block" value="保存"
								style="width: 150px;"></input>
						</form>
					</div>

				</div>
				<form action="UpdUserServlet" method="post">
					<div class="content" style="width:450px;height:350px">
						<input type="hidden" name="userid"
							value="${sessionScope.user.userid}" /> <input type="hidden"
							name="urole" value="orduser" /> <b>用户名</b><br /> <input
							type="text" name="username" value="${sessionScope.user.username}" /><br>
						<br> <b>密码</b><br /> <input type="text" name="userpwd"
							value="${sessionScope.user.userpwd}" /><br>
						<br> <b>性别</b><br /> <input type="text" name="usersex"
							value="${sessionScope.user.usersex}" /><br>
						<br> <b>邮箱</b><br /> <input type="text" name="usermail"
							value="${sessionScope.user.usermail}" /><br>
						<br> <input type="submit" value="修改" class="sub_buttons">
							<a href="account.jsp" class="button" style="width: 120px;"><span>返回</span></a>
				</form>
			</div>
		</div>
	</div>

	</div>

	<div class="icart-footer">
		<div class="icart-footer-top">
			<div style="width: 1000px; margin: 0 auto;"></div>
		</div>
		<div class="icart-footer-container">
			<div class="column_footer" style="width: 350px;">
				<h3>商品覆盖范围</h3>
				<div class="footer_description">本店自营覆盖区县
					本店已向全国2392个区县提供自营配送服务，支持货到付款、POS机刷卡和售后上门服务</div>
			</div>

			<div class="column_footer">
				<h3>配送方式</h3>
				<ul>
					<li><a href="#">上门自取</a></li>
					<li><a href="#">配送查询</a></li>
					<li><a href="#">物流查询</a></li>
					<li><a href="#">收费标准</a></li>
				</ul>
			</div>

			<div class="column_footer" style="width: 150px;">
				<h3>其他</h3>
				<ul>
					<li><a href="#">品牌</a></li>
					<li><a href="#">礼物凭证</a></li>
					<li><a href="#">附属企业</a></li>
					<li><a href="#">Specials</a></li>
				</ul>
			</div>
			<div class="column_footer" style="width: 150px;">
				<h3>我的账户</h3>
				<ul>
					<li><a href="#">我的账户</a></li>
					<li><a href="#">历史订单</a></li>
					<li><a href="#">喜爱列表</a></li>
					<li><a href="#">时事通讯</a></li>
				</ul>
			</div>

			<div class="clearfix"></div>
		</div>
		<div class="icart-footer-bottom">
			<div style="width: 1000px; margin: 0 auto;">
				<div class="icart-logo-footer">
					<a href="index.php"><img src="images/logo-footer.png"
						alt="Footer Logo"></a>
				</div>
				<ul>
					<li style="float: right; padding-top: 10px; list-style: none;">&copy;
						Copyright &copy; 2013.Company name All rights reserved.<a
						target="_blank" href=""></a> - More Templates <a href=""
						target="_blank" title="banquan">张永强</a>
					</li>
				</ul>
				<div class="clearfix"></div>
			</div>

		</div>
	</div>
</body>
</html>