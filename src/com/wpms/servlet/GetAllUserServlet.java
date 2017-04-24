package com.wpms.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wpms.model.User;
import com.wpms.service.RoleCheck;
import com.wpms.service.UserService;
import com.wpms.serviceImpl.UserServiceImpl;


public class GetAllUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	UserService service = new UserServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String urole = request.getParameter("urole");
		List<User> list = service.getAllUser(urole);
		if(list != null){
			if(urole.equals(RoleCheck.OrdinaryUser)){
				request.setAttribute("list", list);
				request.getRequestDispatcher("admin/userlist.jsp").forward(request, response);	
			}else{
				request.setAttribute("list", list);
				request.getRequestDispatcher("admin/manlist.jsp").forward(request, response);
			}
		}else{
			request.getRequestDispatcher("admin/index.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
