package com.wpms.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wpms.model.Comment;
import com.wpms.service.CommentService;
import com.wpms.serviceImpl.CommentServiceImpl;

public class GetAllComServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CommentService service = new CommentServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Comment> list = service.getAllCom();
		if (list != null) {
			request.setAttribute("list", list);
			request.getRequestDispatcher("admin/commentlist.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
