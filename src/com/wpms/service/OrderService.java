package com.wpms.service;

import java.util.List;
import java.util.Map;

import com.wpms.model.Order;
import com.wpms.model.OrderDetail;
import com.wpms.model.User;

public interface OrderService {
	/**
	 * 生成新订单
	 * @param user 用户信息
	 * @param dmoney 订单金额
	 * @param buypros 订单商品数量
	 * 
	 */
	int addorder(User user, double dmoney, Map<String, Integer> buypros);
	/**
	 * 生成订单明细
	 * @param order 订单信息
	 * @param buypros 购买商品集合
	 */
	void setOrderDetail(Order order, Map<String, Integer> buypros);
	/**
	 * 根据用户ID查询其所有订单
	 * @param uid 用户ID
	 * 
	 */
	List<Order> getAllOrder(Integer uid);
	/**
	 * 获得最新一条订单
	 * 
	 */
	Order getOrder();
	/**
	 * 根据订单编号查询订单明细
	 * @param oid 订单编号
	 * 
	 */
	List<OrderDetail> getOrderDil(Integer oid);
	/**
	 * 获取所有订单
	 *
	 */
	List<Order> getAllOrd();
	/**
	 * 根据订单编号删除订单
	 * @param oid 订单编号
	 * 
	 */
	int delOrder(Integer oid);
	/**
	 * 查询购买商品数量
	 * @param buypros 购买商品信息
	 * 
	 */
	int getBuycount(Map<String, Integer> buypros);
}
