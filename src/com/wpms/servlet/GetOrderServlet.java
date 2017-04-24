package com.wpms.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wpms.model.Order;
import com.wpms.service.OrderService;
import com.wpms.serviceImpl.OrderServiceImpl;


public class GetOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	OrderService service = new OrderServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("userid");
		Integer uid = Integer.parseInt(id);
		String msg = null ;
		List<Order> list =  service.getAllOrder(uid);
		if(list !=null){
			 request.setAttribute("list", list);
		}else{
			  msg = "您没有订单,快去购物吧";
		}
		 request.setAttribute("mesg", msg);
		 request.getRequestDispatcher("order/orderlist.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
