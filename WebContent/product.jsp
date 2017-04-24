<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c"uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" dir="ltr">
<head>
<link rel="stylesheet" type="text/css" href="css.css" />
<title>iCart HTML Version</title>
<script type="text/javascript" src="slider/scripts/jquery-1.7.1.min.js"></script>
<style>
.com {
	width: 500px;
	height: 150px;
	margin-top: 60px;
	border: 1px solid #BBBBBB;
}

.comimg {
	padding-left: 10px;
	padding-right: 10px;
	margin: 20px;
	float: left;
	border: 1px solid #BBBBBB;
}

.comt {
	width: 450px;
	padding-top: 40px;
}

#comment {
	display: none;
}
</style>
</head>
<script type="text/javascript">
	function add() {
		var count = parseInt(document.getElementById('in1').value);
		document.getElementById('in1').value = count + 1;
	}
	function del() {
		var count = parseInt(document.getElementById('in1').value);
		document.getElementById('in1').value = count - 1;
	}
	function show() {
		var obj = document.getElementById('comment');
		if (obj.style.display == 'block') {
			obj.style.display = 'none';
		} else {
			obj.style.display = 'block';
		}
		$.ajax({
			type:'post',
			url:'GetComServlet?proid=${pro.proid}',
			success:function(jsonStr){
				var html = " ";
                var json=jsonStr;
				$.each(JSON.parse(json),function(comid,obj){
					html = html+ '<div class="com"><div class="comimg">用户：'+obj.username+'<br> <img width="80px" height="80px"src="ProImgServlet?fname='+obj.username+' "></div><div class="comt">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;'+obj.comitem+'</div></div>'
				});
				$('#comment').html(html);
		}		
		});
	}
</script>
<body>
	<div class="menu">
		<jsp:include page="mhead.jsp" />
	</div>

	<div style="width: 1000px; margin: 0 auto;">


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
			<a href="#">${pro.proclass}</a> &raquo; <a href="#">${pro.proname}</a>
		</div>

		<h1 style="margin-top: -10px;">${pro.proname}</h1>
	</div>
	<div id="container_bg">


		<style type="text/css">
.linktree {
	margin-top: 0px;
	margin-bottom: 10px;
	margin-left: 3px;
}

.linktree a {
	color: #666;
	text-decoration: none;
	font-size: 11px;
}

#menu {
	border-radius: 5px;
}
</style>



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
			<div class="block-white">
				<div class="block-content"></div>
				<div class="separator"></div>
				<div class="block-content">
					<div class="product-info">

						<div class="left">
							<div class="image">
								<a href="#" title="iMac"><img width="200px" height="200px"
									src="ProImgServlet?fname=${pro.proname}"></a>
							</div>
						</div>



						<div id="tab-information" class="tab-content">
							<div id="information"></div>


							<div class="description">
								<span>&raquo;&nbsp;商品名称:</span> <a href="#">${pro.proname}</a><br />
								<span>&raquo;&nbsp;制造商:</span> ${pro.profirm }<br /> <span>&raquo;&nbsp;种类:</span>${pro.proclass}<br />
							</div>

							<div class="price">
								<h3>
									<span>&raquo;&nbsp;售价:</span><span class="price-new">${pro.proprice}</span>
								</h3>
							</div>
							<br>
							<div class="cart">
								<div>
									<form action="ProCarServlet" method="get">
										<input type="hidden" name="proid" value="${pro.proid}" /> <input
											type="button" value="-" onclick="del()" /> <input
											class="quantity" id="in1" type="text" name="procount"
											size="2" value="1" /> <input type="button" value="+"
											onclick="add()" /><br> <input type="submit"
											value="添加到购物车" class="sub_buttons">
									</form>
								</div>
							</div>

							<div>
								<form action="ProAddComServlet" method="post">
                                 <input type="hidden" name="proid" value="${pro.proid}">
                                 <input type="hidden" name="proname" value="${pro.proname}">
                                 <input type="hidden" name="userid" value="${user.userid}">
                                 <input type="hidden" name="username" value=" ${user.username }">
									<c:if test="${user.userrole == 'orduser'}">
									写评论<br>
									<textarea name="comitem" style="width: 500px; height: 80px; max-width: 500px; max-height: 150px;">${mess }</textarea>
									<br> <input type="submit" value="提交" class="sub_buttons">&nbsp;&nbsp;
									</c:if>
									<input type="button" value="查看评论" class="sub_buttons"
										onclick="show()">
								</form>
							</div>
							<div id="comment">
<!-- 							<div class="com">
									<div class="comimg">
										用户：${com.username }<br> <img width="80px" height="80px"
											src="ProImgServlet?type=user&&userid=${com.userid }">
									</div>
									<div class="comt">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${com.comitem }</div>
								</div>
 -->	
							</div>
						</div>
					</div>
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