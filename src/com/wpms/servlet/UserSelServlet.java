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


public class UserSelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    UserService service = new UserServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uid = request.getParameter("uid");
		String urole = request.getParameter("urole");
		String tp = request.getParameter("tp");
		User user = service.selUser(uid);
		if(user != null){
			if(tp.equals("up")){
			if(urole.equals(RoleCheck.OrdinaryUser)){
			request.setAttribute("uu", user);
			request.getRequestDispatcher("admin/userupd.jsp").forward(request, response);
			}else{
				request.setAttribute("uu", user);
				request.getRequestDispatcher("admin/manupd.jsp").forward(request, response);
			}
		  }else{
			  if(urole.equals(RoleCheck.OrdinaryUser)){
					request.setAttribute("uu", user);
					request.getRequestDispatcher("admin/userdetail.jsp").forward(request, response);
				}else{
					request.setAttribute("uu", user);
					request.getRequestDispatcher("admin/mandetail.jsp").forward(request, response);
				}
		  }
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
