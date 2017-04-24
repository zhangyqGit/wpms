package com.wpms.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wpms.model.Comment;
import com.wpms.service.CommentService;
import com.wpms.serviceImpl.CommentServiceImpl;

import net.sf.json.JSONArray;


public class GetComServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CommentService service = new CommentServiceImpl();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=utf-8");
		String pid = request.getParameter("proid");
		Integer proid = Integer.parseInt(pid);
		List<Comment> list = service.getCom(proid);
		if(list !=null){	
//      °Ñ list ×ª»»³Éjson×Ö·û´®
		JSONArray jsonArray = JSONArray.fromObject(list);
		String jsonStr =  jsonArray.toString();
//		System.out.println(jsonStr);
		PrintWriter pw =response.getWriter();
		pw.write(jsonStr); 
		pw.flush();
		pw.close();
		}
	}

}
