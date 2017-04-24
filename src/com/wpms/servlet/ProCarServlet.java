package com.wpms.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wpms.model.Project;
import com.wpms.model.User;
import com.wpms.service.ProService;
import com.wpms.service.RoleCheck;
import com.wpms.serviceImpl.ProServiceImpl;

public class ProCarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	ProService service = new ProServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (request.getSession().getAttribute("user") != null) {
			String proid = request.getParameter("proid");
			User user = (User) request.getSession().getAttribute("user");
			Object obj = request.getSession().getAttribute("procar");
			Map<Integer, Integer> mycar = service.queryCar(user.getUserid());
			Map<Integer, Integer> procar;
			if (user.getUserrole().equals(RoleCheck.OrdinaryUser)) {
				if (obj == null) {
					if (mycar == null) {
						procar = new HashMap<Integer, Integer>();
					} else {
						procar = mycar;
					}
					request.getSession().setAttribute("procar", procar);
				} else {
					procar = (Map<Integer, Integer>) obj;
				}
				if (proid != null) {
					Integer procount =  Integer.parseInt(request.getParameter("procount"));
					for (Integer pid : procar.keySet()) {
						if (pid == Integer.parseInt(proid)) {
							procount = procar.get(pid) + procount;
						}
					}
					procar.put(Integer.parseInt(proid), procount);
				}
				if (procar.size() > 0) {
					List<Project> list = service.addCars(procar.keySet());
					for (Project pro : list) {
						for (Integer pid : procar.keySet()) {
							if (pro.getProid() == pid) {
								pro.setBuycount(procar.get(pid));
							}
						}
					}
					request.setAttribute("list", list);
				}
				request.getRequestDispatcher("cart.jsp").forward(request, response);
			} else {
				request.setAttribute("msg", "管理员不可购买商品！");
				request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		} else {
			request.setAttribute("msg", "登录后才可购买商品！");
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
