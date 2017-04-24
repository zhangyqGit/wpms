package com.wpms.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wpms.model.Order;
import com.wpms.model.OrderDetail;
import com.wpms.service.OrderService;
import com.wpms.service.RoleCheck;
import com.wpms.serviceImpl.OrderServiceImpl;

public class OrderDilServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	OrderService service = new OrderServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer oid = Integer.parseInt(request.getParameter("oid"));
		Integer ocount =Integer.parseInt(request.getParameter("ocount"));
		Double omoney = Double.parseDouble(request.getParameter("omoney"));
		String otime = request.getParameter("otime");
		String urole = request.getParameter("role");
		List<OrderDetail> list = service.getOrderDil(oid);
		Order order = new Order(oid, ocount, omoney);
		request.setAttribute("order", order);
		request.setAttribute("otime", otime);
		request.setAttribute("list", list);
		if(urole.equals(RoleCheck.OrdinaryUser)){
		request.getRequestDispatcher("order/orderdil.jsp").forward(request, response);
		}else{
			request.getRequestDispatcher("admin/orddetail.jsp").forward(request, response);	
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
