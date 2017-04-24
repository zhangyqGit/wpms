<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c"uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>

<head>
<!-- Meta, title, CSS, favicons, etc. -->
<meta charset="utf-8">
<title>ICART外设商城后台</title>
<base href="<%=basePath%> ">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Font CSS (Via CDN) -->
<link rel='stylesheet' type='text/css'
	href='assets\fonts\font\Open.font'>
<link rel="stylesheet" type="text/css"
	href="assets\fonts\font\Roboto.font">
<!-- Theme CSS -->
<link rel="stylesheet" type="text/css"
	href="assets/skin/default_skin/css/theme.css">
<!-- Admin Panels CSS -->
<link rel="stylesheet" type="text/css"
	href="assets/admin-tools/admin-plugins/admin-panels/adminpanels.css">
<!-- Admin Forms CSS -->
<link rel="stylesheet" type="text/css"
	href="assets/admin-tools/admin-forms/css/admin-forms.css">
<link rel="stylesheet" type="text/css" href="css.css" />
<style type="text/css">
table {
	font-family: "Open Sans", Helvetica, Arial, sans-serif;
	font-size: 13px;
	color: #666666;
}

a:link {
	text-decoration: none;
}
</style>
<script language="javascript">
	function checkdel() {
		if (!confirm("确认要删除？")) {
			window.event.returnValue = false;
		}
	}
</script>
</head>

<body class="Home-page sb-l-o sb-r-c">
	<!-- Start: Main -->

	<div id="main">
		<!-- Start: Header -->
		<header class="navbar navbar-fixed-top bg-dark">
		<div class="menu">
			<jsp:include page="../mhead.jsp" />
		</div>
		</header>
		<!-- End: Header -->

		<!-- Start: Sidebar -->
		<aside id="sidebar_left" class="nano nano-primary">
		<div class="nano-content">


			<!-- End: Sidebar Header -->

			<!-- sidebar menu -->
			<ul class="nav sidebar-menu">
				<li class="sidebar-label pt20">系统页面</li>
				<li><a href="admin/index.jsp"> <span
						class="glyphicons glyphicons-home"></span> <span
						class="sidebar-title">后台首页</span>
				</a></li>
				<li class="sidebar-label pt20">后台管理</li>
				<li class="active"><a class="accordion-toggle menu-open"
					href="#"> <span class="glyphicons glyphicons-parents"></span> <span
						class="sidebar-title">用户管理</span> <span class="caret"></span>
				</a>
					<ul class="nav sub-nav">
						<li><a href="GetAllUserServlet?urole=admin"> <span
								class="glyphicons glyphicons-old_man"></span>管理员信息管理
						</a></li>
						<li class="active"><a href="GetAllUserServlet?urole=orduser"> <span
								class="glyphicons glyphicons-parents"></span>会员信息管理
						</a></li>
					</ul></li>
				<li><a class="accordion-toggle" href="#"> <span
						class="glyphicons glyphicons-file"></span> <span
						class="sidebar-title">订单管理</span> <span class="caret"></span>
				</a>
					<ul class="nav sub-nav">
						<li><a href="GetAllOrdServlet"> <span
								class="glyphicons glyphicons-upload"></span>订单信息管理
						</a></li>
					</ul></li>

				<li><a class="accordion-toggle" href="#"> <span
						class="glyphicons glyphicons-iphone"></span> <span
						class="sidebar-title">商品管理</span> <span class="caret"></span>
				</a>
					<ul class="nav sub-nav">
						<li><a href="admin/proadd.jsp"> <span
								class="glyphicons glyphicons-more"></span>商品信息录入
						</a></li>
						<li><a href="MainServlet"> <span
								class="glyphicons glyphicons-hand_up"></span>商品信息管理
						</a></li>
					</ul></li>

				<li><a class="accordion-toggle" href=""> <span
						class="glyphicons glyphicons-star"></span> <span
						class="sidebar-title">评论管理</span> <span class="caret"></span>
				</a>
					<ul class="nav sub-nav">
						<li><a href="GetAllComServlet"> <span
								class="glyphicons glyphicons-eye_open"></span>评论管理
						</a></li>
					</ul></li>
				<li><a class="accordion-toggle" href=""> <span
						class="glyphicons glyphicons-picture"></span> <span
						class="sidebar-title">轮播管理</span> <span class="caret"></span>
				</a>
					<ul class="nav sub-nav">
						<li><a href="admin/albumlist.jsp"> <span
								class="glyphicons glyphicons-picture"></span>轮播管理
						</a></li>
					</ul></li>
			</ul>
			<div class="sidebar-toggle-mini">
				<a href="#"> <span class="fa fa-sign-out"></span>
				</a>
			</div>
		</div>
		</aside>

		<!-- Start: Content -->
		<section id="content_wrapper"> <!-- Start: Topbar-Dropdown -->

		<!-- End: Topbar-Dropdown --> <!-- Start: Topbar --> <header
			id="topbar">
		<div class="topbar-left">
			<ol class="breadcrumb">
				<li class="crumb-active"><a href="#"
					style="text-decoration: none; font-family: 幼圆; font-size: 15px;">ICART外设商城用户列表</a>
				</li>
				<li class="crumb-icon"><span class="glyphicon glyphicon-home"></span>
			</ol>
		</div>
		</header> <!-- End: Topbar --> <!-- Begin: Content  This place write function()-->
		<div id="content">
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-visible">
						<div class="panel-heading br-b-n">
							<div class="panel-title hidden-xs">
								<span class="glyphicon glyphicon-tasks"></span>ICART外设商城用户列表
							</div>
						</div>
						<div class="panel-body pn">

							<table class="table table-striped table-bordered table-hover"
								id="datatable" width="100%">
								<thead>
									<tr>
										<th>用户名</th>
										<th>头像</th>
										<th>密码</th>
										<th>钱包余额</th>
										<th>性别</th>
										<th>邮箱</th>
										<th>查看详细</th>
										<th>修改</th>
										<th>删除</th>

									</tr>
								</thead>

								<c:forEach items="${list }" var="u" >

									<tr>
										<th>${u.username }</th>
										<th><img width="100px" height="100px" src="ProImgServlet?fname=${u.username}"></th>
										<th>${u.userpwd }</th>
										<th>${u.useraccount }</th>
										<th>${u.usersex }</th>
										<th>${u.usermail }</th>
										<th><a href="UserSelServlet?uid=${u.userid}&&urole=orduser&&tp=get">查看详细</a></th>
										<th><a href="UserSelServlet?uid=${u.userid}&&urole=orduser&&tp=up">修改</a></th>
										<th><a href="UserDelServlet?userid=${u.userid}&&urole=orduser" onclick="return checkdel()">删除</a></th>
									</tr>
								</c:forEach>
							</table>
						</div>
					</div>
<!--  				<div style="margin-top: 20px;">

						当前页:${pages } <a
							href="../ShowAllServlet?type=lookall&pages=1&counts=${counts}">首页</a>
						<a
							href="../ShowAllServlet?type=lookall&pages=${pages-1 }&counts=${counts}">上一页</a>
						<a
							href="../ShowAllServlet?type=lookall&pages=${pages+1 }&counts=${counts}">下一页</a>
						<a
							href="../ShowAllServlet?type=lookall&pages=${maxage }&counts=${counts}">尾页</a>
						总页数:${maxage } <br /> <br />
						<form action="../ShowAllServlet?pages=${pages}"
							style="width: 200px; display: inline-block;">
							<input type="hidden" name="type" value="lookall">
							修改每页显示数量<input id="number" type="text" name="counts"
								style="width: 50px; display: inline-block;" /> <input
								type="submit" value="确定" onclick="return queding()"
								style="display: inline-block;" />
						</form>
						<form action="../ShowAllServlet" method="post"
							style="width: 200px; display: inline-block;">
							<input type="hidden" name="counts" value=""
								style="display: inline-block;"> <input type="hidden"
								name="type" value="lookall" style="display: inline-block;">
							跳页<input type="text" name="pages" id="tiaoye"
								style="display: inline-block; width: 50px;"> <input
								type="submit" value="确定" onclick="return tijiao()"
								style="display: inline-block;">
						</form>
					</div>  -->
					
				</div>
			</div>
		</div>
	</div>
	</div>


	<!-- End: Content  This place write function()-->



	</section>
	<!-- End: Content-Wrapper -->
	</div>
	<!-- End: Main -->

	<!-- BEGIN: PAGE SCRIPTS -->

	<!-- jQuery -->
	<script type="text/javascript" src="vendor/jquery/jquery-1.11.1.min.js"></script>
	<script type="text/javascript"
		src="vendor/jquery/jquery_ui/jquery-ui.min.js"></script>

	<!-- Bootstrap -->
	<script type="text/javascript"
		src="assets/js/bootstrap/bootstrap.min.js"></script>

	<!-- Sparklines CDN -->
	<script type="text/javascript" src="assets/js/jquery.sparkline.min.js"></script>

	<!-- Chart Plugins -->
	<script type="text/javascript"
		src="vendor/plugins/highcharts/highcharts.js"></script>
	<script type="text/javascript" src="vendor/plugins/circles/circles.js"></script>
	<script type="text/javascript" src="vendor/plugins/raphael/raphael.js"></script>

	<!-- Holder js  -->
	<script type="text/javascript" src="assets/js/bootstrap/holder.min.js"></script>

	<!-- Theme Javascript -->
	<script type="text/javascript" src="assets/js/utility/utility.js"></script>
	<script type="text/javascript" src="assets/js/main.js"></script>
	<script type="text/javascript" src="assets/js/demo.js"></script>

	<!-- Admin Panels  -->
	<script type="text/javascript"
		src="assets/admin-tools/admin-plugins/admin-panels/json2.js"></script>
	<script type="text/javascript"
		src="assets/admin-tools/admin-plugins/admin-panels/jquery.ui.touch-punch.min.js"></script>
	<script type="text/javascript"
		src="assets/admin-tools/admin-plugins/admin-panels/adminpanels.js"></script>


	<!-- Datatables -->
	<script type="text/javascript"
		src="vendor/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="vendor/plugins/datatables/media/js/dataTables.bootstrap.js"></script>
	<script type="text/javascript"
		src="vendor/plugins/datatables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>


	<!-- Page Javascript -->
	<script type="text/javascript" src="assets/js/pages/widgets.js"></script>
	<!-- Import  Main Javascript -->
	<script type="text/javascript" src="assets/js/pages/main.js"></script>
	<script type="text/javascript">
		function tijiao() {
			var tiaoye = $('#tiaoye').val();
			if (tiaoye == "") {
				return false;
			}
		}
		function queding() {
			var tiaoye = $('#number').val();
			if (tiaoye == "") {
				return false;
			}
		}
	</script>
</body>

</html>
