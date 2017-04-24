<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("utf-8");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ICART外设商城后台</title>
<base href="<%=basePath %> ">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="assets/skin/default_skin/css/theme.css">
<link rel="stylesheet" type="text/css" href="css.css" />
<link href="zzsc.css" rel="stylesheet">
<style type="text/css">
body {
	overflow: hidden;
}

#cea {
	width: 100%;
	height: 500px;
}

.col-md-3 {
	width: 250px;
	height: 150px;
	margin-left: 50px;
	margin-top: -10px;
}

#boxx {
	margin: 120px 0 0 240px;
}
</style>
</head>

<body class="Home-page sb-l-o sb-r-c">

<div id="main">

<header class="navbar navbar-fixed-top bg-dark">		<!-- Start: Header -->
<div class="menu">
<jsp:include page="../mhead.jsp" /> 
</div>
</header>


		<!-- Start: Sidebar -->
		<aside id="sidebar_left" class="nano nano-primary">
		<div class="nano-content">
			<!-- sidebar menu -->
			<ul class="nav sidebar-menu">
				<li class="sidebar-label pt20">系统页面</li>
				<li class="active"><a href="admin/#"> <span
						class="glyphicons glyphicons-home"></span> <span
						class="sidebar-title">后台首页</span>
				</a></li>
				<li class="sidebar-label pt20">后台管理</li>
				<li><a class="accordion-toggle" href="#"> <span
						class="glyphicons glyphicons-parents"></span> <span
						class="sidebar-title">用户管理</span> <span class="caret"></span>
				</a>
					<ul class="nav sub-nav">
		               	<li><a href="GetAllUserServlet?urole=admin"> <span
								class="glyphicons glyphicons-old_man"></span>管理员信息管理
						</a></li>	
						<li><a href="GetAllUserServlet?urole=orduser"> <span
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
				<a href="#"> <span class="fa fa-sign-out"></span></a>
			</div>
		</div>
		</aside>
	<section id="content_wrapper"> <!-- Start: Topbar-Dropdown -->
		<div style="z-index: 2; position: absolute;" id="cea">
	<div id="level">
		<div id="content">
		  <h1>Hello!Manager</h1>
			<div id="gears">
				<div id="gears-static"></div>
				<div id="gear-system-1">
					<div class="shadow" id="shadow15"></div>
					<div id="gear15"></div>
					<div class="shadow" id="shadow14"></div>
					<div id="gear14"></div>
					<div class="shadow" id="shadow13"></div>
					<div id="gear13"></div>
				</div>
				<div id="gear-system-2">
					<div class="shadow" id="shadow10"></div>
					<div id="gear10"></div>
					<div class="shadow" id="shadow3"></div>
					<div id="gear3"></div>
				</div>
				<div id="gear-system-3">
					<div class="shadow" id="shadow9"></div>
					<div id="gear9"></div>
					<div class="shadow" id="shadow7"></div>
					<div id="gear7"></div>
				</div>
				<div id="gear-system-4">
					<div class="shadow" id="shadow6"></div>
					<div id="gear6"></div>
					<div id="gear4"></div>
				</div>
				<div id="gear-system-5">
					<div class="shadow" id="shadow12"></div>
					<div id="gear12"></div>
					<div class="shadow" id="shadow11"></div>
					<div id="gear11"></div>
					<div class="shadow" id="shadow8"></div>
					<div id="gear8"></div>
				</div>
				<div class="shadow" id="shadow1"></div>
				<div id="gear1"></div>
				<div id="gear-system-6">
					<div class="shadow" id="shadow5"></div>
					<div id="gear5"></div>
					<div id="gear2"></div>
				</div>
				<div class="shadow" id="shadowweight"></div>
				<div id="chain-circle"></div>
				<div id="chain"></div>
				<div id="weight"></div>
			</div>
		</div>
	</div>
		</div> 
		</section>
	</div>


	<!-- jQuery -->
	<script type="text/javascript" src="vendor/jquery/jquery-1.11.1.min.js"></script>
	<script type="text/javascript" src="vendor/jquery/jquery_ui/jquery-ui.min.js"></script>


	<script type="text/javascript" src="assets/js/utility/utility.js"></script>
	<script type="text/javascript" src="assets/js/main.js"></script>
	<script type="text/javascript" src="assets/js/pages/widgets.js"></script>
	<script type="text/javascript" src="assets/js/pages/main.js"></script>


</body>

</html>
