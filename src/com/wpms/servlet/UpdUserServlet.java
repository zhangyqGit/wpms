package com.wpms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wpms.model.User;
import com.wpms.service.RoleCheck;
import com.wpms.service.UserService;
import com.wpms.serviceImpl.UserServiceImpl;

public class UpdUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService service = new UserServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Integer uid = Integer.parseInt(request.getParameter("userid"));
		String uname = request.getParameter("username");
		String upwd = request.getParameter("userpwd");;
		String usex = request.getParameter("usersex");
		String umail = request.getParameter("usermail");
		String urole = request.getParameter("urole");
		String urlPath = "account.jsp";
		String msg = null;
		int i = service.updateUser(uid,uname,upwd,usex,umail);
		if(i>0){
			if(urole.equals(RoleCheck.OrdinaryUser)){
			msg = "修改成功";
			User user = service.login(uname,upwd);
			request.getSession().setAttribute("user", user);
			}else if(urole.equals("manord")){
				urlPath = "GetAllUserServlet?urole=orduser";
			}else{
				urlPath = "GetAllUserServlet?urole=admin";
			}
		}else{
			msg = "修改失败";
			urlPath = "user/userupdate.jsp";
		}
		request.setAttribute("msg", msg);
		request.getRequestDispatcher(urlPath).forward(request, response);
	}

}
