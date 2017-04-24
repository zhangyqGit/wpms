package com.wpms.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wpms.model.User;
import com.wpms.service.UserService;
import com.wpms.serviceImpl.UserServiceImpl;

public class AccountUptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService service = new UserServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer uid = Integer.parseInt(request.getParameter("userid"));
		Double money = Double.parseDouble(request.getParameter("uaccount"));
		int i = service.updAccount(uid, money);
		if(i>0){
			User user = (User) request.getSession().getAttribute("user");
			User newuser = service.login(user.getUsername(), user.getUserpwd());
			request.getSession().setAttribute("user", newuser);
			request.setAttribute("msg", "≥‰÷µ≥…π¶£°£°");
			request.getRequestDispatcher("account.jsp").forward(request, response);
		}
	}

}
