package com.wpms.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wpms.model.Project;
import com.wpms.service.ProService;
import com.wpms.serviceImpl.ProServiceImpl;


public class ProUpdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    ProService service = new ProServiceImpl(); 
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		Integer pid = Integer.parseInt(request.getParameter("proid"));
		String pname = new String(request.getParameter("proname").getBytes("ISO-8859-1"),"utf-8");
		String pclass = new String(request.getParameter("proclass").getBytes("ISO-8859-1"),"utf-8");
		String pfirm = new String(request.getParameter("profirm").getBytes("ISO-8859-1"),"utf-8");
		Integer pcount = Integer.parseInt(request.getParameter("procount"));
		Double pprice = Double.parseDouble(request.getParameter("proprice"));
		String urlPath = "MainServlet";
		Project pro = new Project(pid, pcount, pname, pprice, pclass, pfirm);
		int i = service.updPro(pro);
		if(i == 1){
			request.getRequestDispatcher(urlPath).forward(request, response);
		}	
	}

}
