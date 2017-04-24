package com.wpms.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wpms.model.Comment;
import com.wpms.service.CommentService;
import com.wpms.serviceImpl.CommentServiceImpl;

public class ProAddComServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CommentService service = new CommentServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");;
		Integer proid = Integer.parseInt(request.getParameter("proid"));
		Integer userid = Integer.parseInt(request.getParameter("userid"));
		String proname =  request.getParameter("proname");
		String username = request.getParameter("username").trim();
		String comitem = request.getParameter("comitem");
		String msg = null;
		boolean i = service.checkBuy(proname,userid);
		if(i){
		Comment comment = new Comment(proid, userid, proname,username, comitem);
		int a = service.addCom(comment);
		   if(a<0){
			msg = "提交评论失败，请检查您的网络。";
		   }else{
			   msg = "评论提交成功";  
		   }
		}else{
			msg = "您没有购买此商品，无法评论。";
		}
		request.setAttribute("msg", msg);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}

}
