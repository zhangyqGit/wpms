package com.wpms.servlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wpms.model.Project;
import com.wpms.service.ProService;
import com.wpms.serviceImpl.ProServiceImpl;

public class CheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProService service = new ProServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map<Integer, Integer> procar = (Map<Integer, Integer>) request.getSession().getAttribute("procar");
		if (procar.size() > 0) {
			List<Project> pros = service.getPros(procar.keySet());
			double allMoney = 0;
			for (Project pro : pros) {
				pro.setBuycount(procar.get(pro.getProid()));
				allMoney = allMoney + pro.getProprice() * procar.get(pro.getProid());
			}
			request.setAttribute("pros", pros);
			request.setAttribute("allMoney", allMoney);
			request.getRequestDispatcher("checkout.jsp").forward(request, response);
		} else {
			String msg = "购物车为空，无法生成订单";
			request.setAttribute("mesg", msg);
			request.getRequestDispatcher("cart.jsp").forward(request, response);
		}
	}

}
