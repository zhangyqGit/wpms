package com.wpms.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.wpms.model.Order;
import com.wpms.model.Project;
import com.wpms.model.User;
import com.wpms.service.OrderService;
import com.wpms.service.ProService;
import com.wpms.service.UserService;
import com.wpms.serviceImpl.OrderServiceImpl;
import com.wpms.serviceImpl.ProServiceImpl;
import com.wpms.serviceImpl.UserServiceImpl;

public class PayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	OrderService service = new OrderServiceImpl();
	UserService userservice = new UserServiceImpl();
	ProService pservice = new ProServiceImpl();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String allMoney = request.getParameter("allMoney");
		String msg = null;
		if (allMoney != null) {
			double dmoney = Double.parseDouble(allMoney);
			User user = (User) request.getSession().getAttribute("user");
			Map<Integer, Integer> buypros = (Map<Integer, Integer>) request.getSession().getAttribute("procar");
			Map<String,Integer> ordermap = new HashMap<String,Integer>();
			if (user.getUseraccount() >= dmoney) {
				 List<Project> list = pservice.getAllpro();
				for(Integer proid : buypros.keySet()){
					for(Project pro : list){
						if(pro.getProid()==proid){
							ordermap.put(pro.getProname(), buypros.get(proid));
						}
					}
				}
				int i = service.addorder(user, dmoney, ordermap);
				if (i > 0) {
					Order order = service.getOrder();
					msg = "付款成功，我们会尽快为您进行配送";
					User newuser = userservice.login(user.getUsername(), user.getUserpwd());
					request.getSession().setAttribute("user", newuser);
					request.getSession().removeAttribute("procar");
					request.setAttribute("ord", order);
					request.setAttribute("mesg", msg);
					request.getRequestDispatcher("payresult.jsp").forward(request, response);
				} else {
					msg = "付款失败，请联系管理员!!";
					request.setAttribute("mesg", msg);
					request.getRequestDispatcher("CheckServlet").forward(request, response);
				}
			} else {
				msg = "付款失败，余额不足!!";
				request.setAttribute("mesg", msg);
				request.getRequestDispatcher("CheckServlet").forward(request, response);
			}
		}
	}

}
