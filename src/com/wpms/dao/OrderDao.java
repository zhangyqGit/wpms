package com.wpms.dao;

import java.util.List;

import com.wpms.model.Order;
import com.wpms.model.OrderDetail;

public interface OrderDao {
	/**
	 * 生成新订单
	 * @param order 订单信息
	 * 
	 */
	int addOrder(Order order);
	/**
	 * 生成订单明细
	 * @param detail 订单明细信息
	 */
	void addOrderDetail(OrderDetail detail);
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
	 * 更新商品数量
	 * @param proid 商品ID
	 * @param count 商品数量
	 */
	void updProcount(String proname, int count);
	
}
