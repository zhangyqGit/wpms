<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%>
<base href="<%=basePath %> ">
<ul>
<li style="width:0px;"><a></a></li>
<c:if test="${user.userrole == 'orduser'}">
<li><a href="index.jsp" class="home">首页</a></li>
<li><a href="account.jsp" class="account">我的账户</a></li>
<li><a href="ProCarServlet" class="cart">购物车</a></li>
<li style="float:right;"><a href="LogoutServlet" class="login">退出</a></li>
<li style="float:right;"><a href="account.jsp" class="account">${user.username } ${msg }</a></li>
<img style="float:right;margin-right: 10px" width="40px" height="35px" src="ProImgServlet?fname=${user.username}" >
</c:if>
<c:if test="${user.userrole == 'admin'}">
<li><a id="toggle_sidemenu_l" class="checkout"></a></li>
<li style="float:right;"><a href="LogoutServlet" class="login">退出</a></li>
<li style="float:right;"><a href="#" class="account">${user.username } ${msg }</a></li>
</c:if> 
<c:if test="${user==null}">
<li><a href="index.jsp" class="home">首页</a></li>
<li style="float:right;"><a href="login.jsp" class="login">登录</a></li>
<li style="float:right;"><a HREF="register.jsp"class="register">注册</a></li>
<li style="float:right;"><a href="#">欢迎来到Icart外设商城，${msg }请登录</a></li>
</c:if>   
</ul>
