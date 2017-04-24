package com.wpms.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wpms.model.Project;
import com.wpms.service.ProService;
import com.wpms.serviceImpl.ProServiceImpl;

/**
 * Servlet implementation class MainServlet
 */
public class MainServlet extends HttpServlet {
	ProService service = new ProServiceImpl();
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Project> list = service.getAllpro();
        if(list != null){
        request.setAttribute("list", list);
        request.getRequestDispatcher("admin/prolist.jsp").forward(request, response);
        }else{
      	 request.getRequestDispatcher("admin/index.jsp").forward(request, response);
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
