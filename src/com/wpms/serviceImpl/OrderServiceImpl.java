package com.wpms.serviceImpl;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.wpms.dao.OrderDao;
import com.wpms.dao.UserDao;
import com.wpms.daoImpl.OrderDaoImpl;
import com.wpms.daoImpl.UserDaoImpl;
import com.wpms.model.Order;
import com.wpms.model.OrderDetail;
import com.wpms.model.User;
import com.wpms.service.OrderService;

public class OrderServiceImpl implements OrderService {
	OrderDao dao = new OrderDaoImpl();
	UserDao userdao = new UserDaoImpl();
	@Override
	public int addorder(User user, double dmoney, Map<String, Integer> buypros) {
		userdao.updAccount(user.getUserid(), -dmoney);
		Order order = new Order();
		order.setUserid(user.getUserid());
		order.setOrdertime(new Date());
		order.setOrdermoney(dmoney);
		order.setOrdercount(getBuycount(buypros));
		setOrderDetail(order, buypros);
		return dao.addOrder(order);
	}

	@Override
	public void setOrderDetail(Order order, Map<String, Integer> buypros) {
		Set<String> keys = buypros.keySet();
		for (String key : keys) {
			OrderDetail detail = new OrderDetail();
			detail.setProname(key);
			detail.setOrdercount(buypros.get(key));
			order.getDetails().add(detail);
		}

	}

	@Override
	public List<Order> getAllOrder(Integer uid) {
		return dao.getAllOrder(uid);

	}

	@Override
	public Order getOrder() {
		return dao.getOrder();
	}

	@Override
	public List<OrderDetail> getOrderDil(Integer oid) {
		return dao.getOrderDil(oid);

	}

	@Override
	public List<Order> getAllOrd() {
		return dao.getAllOrd();
	}

	@Override
	public int delOrder(Integer oid) {
		return dao.delOrder(oid);

	}

	@Override
	public int getBuycount(Map<String, Integer> buypros) {
		int allcount = 0;
		Set<String> keys = buypros.keySet();
		for (String key : keys) {
			allcount = allcount + buypros.get(key);
		}
		return allcount;
	}
}
