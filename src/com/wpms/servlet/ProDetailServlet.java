package com.wpms.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wpms.model.Project;
import com.wpms.service.ProService;
import com.wpms.service.RoleCheck;
import com.wpms.serviceImpl.ProServiceImpl;


public class ProDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ProService service = new ProServiceImpl();
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String proid = request.getParameter("proid");
		String urole = request.getParameter("urole");
		String type = request.getParameter("tp");
		Project project = service.getProDetail(proid);
		request.setAttribute("pro",project);
		if(urole.equals(RoleCheck.Admin)){
			if(type.equals("get")){
			request.getRequestDispatcher("admin/prodetail.jsp").forward(request, response);
			}else{
			request.getRequestDispatcher("admin/proupd.jsp").forward(request, response);	
			}
		}else{
	    request.getRequestDispatcher("product.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
