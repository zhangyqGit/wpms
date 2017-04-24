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

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService service = new UserServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String uname = request.getParameter("username");
		String upwd = request.getParameter("userpwd");
		String urlPath = "index.jsp";
		String msg = null;
		User user = service.login(uname, upwd);
		if (user != null) {
			request.getSession().setAttribute("user", user);
			String role = user.getUserrole();
			if (role.equals(RoleCheck.Admin)) {
				msg = "×ð¾´µÄ¹ÜÀíÔ±£¬»¶Ó­µÇÂ½";
				urlPath = "admin/index.jsp";
			} else if (role.equals(RoleCheck.OrdinaryUser)) {
				msg = "×ð¾´µÄÓÃ»§£¬»¶Ó­µÇÂ½";
			}
		} else {
			msg = "µÇÂ½Ê§°Ü£¡";
			urlPath = "login.jsp";
		}
		request.setAttribute("msg", msg);
		request.getRequestDispatcher(urlPath).forward(request, response);
	}

}
