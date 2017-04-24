package com.wpms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wpms.service.ProService;
import com.wpms.serviceImpl.ProServiceImpl;


public class ProDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ProService service = new ProServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String pid = request.getParameter("proid");
       int i = service.delPro(pid);
       if(i == 1){
    	   request.getRequestDispatcher("MainServlet").forward(request, response);
       }
  
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
