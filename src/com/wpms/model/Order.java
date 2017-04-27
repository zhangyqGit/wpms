package com.wpms.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Order {
	private Integer orderid;              			 //订单ID
	private Integer userid;               		     //用户ID
	private Integer ordercount;            		     //订单商品总数
	private Date ordertime;              	     	 //订单时间
	private Double ordermoney;            		     //订单总金额
	private List<OrderDetail> details;               //订单详细内容

	public Order(Integer orderid, Integer ordercount, Double ordermoney) {
		super();
		this.orderid = orderid;
		this.ordercount = ordercount;
		this.ordermoney = ordermoney;
	}

	public Order(Integer orderid, Integer userid, Integer ordercount, Date ordertime, Double ordermoney) {
		super();
		this.orderid = orderid;
		this.userid = userid;
		this.ordercount = ordercount;
		this.ordertime = ordertime;
		this.ordermoney = ordermoney;
	}

	public Order() {
		details = new ArrayList<OrderDetail>();
	}

	public Integer getOrderid() {
		return orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	public Integer getUserid() {
		return userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public Integer getOrdercount() {
		return ordercount;
	}

	public void setOrdercount(Integer ordercount) {
		this.ordercount = ordercount;
	}

	public Date getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}

	public Double getOrdermoney() {
		return ordermoney;
	}

	public void setOrdermoney(Double ordermoney) {
		this.ordermoney = ordermoney;
	}

	public List<OrderDetail> getDetails() {
		return details;
	}

	public void setDetails(List<OrderDetail> details) {
		this.details = details;
	}

}
