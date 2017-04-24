package com.wpms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wpms.service.CommentService;
import com.wpms.serviceImpl.CommentServiceImpl;


public class ComDelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CommentService service = new CommentServiceImpl();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer comid = Integer.parseInt(request.getParameter("comid"));
		int i = service.delCom(comid);
		if(i == 1){
			request.getRequestDispatcher("GetAllComServlet").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
