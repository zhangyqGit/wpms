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

public class ProListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProService proservice = new ProServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		String pclass = new String(request.getParameter("proclass").getBytes("ISO-8859-1"),"utf-8");
		List<Project> list = proservice.getproList(pclass);
		if (list != null) {
			request.setAttribute("class", pclass);
			request.setAttribute("list", list);
			request.getRequestDispatcher("categories.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
