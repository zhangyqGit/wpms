package com.wpms.model;

public class OrderDetail {
	private Integer odid;
	private String proname;
	private Integer orderid;
	private Integer ordercount;

	public OrderDetail() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OrderDetail(String proname, Integer orderid, Integer ordercount) {
		super();
		this.proname = proname;
		this.orderid = orderid;
		this.ordercount = ordercount;
	}

	public Integer getOdid() {
		return odid;
	}

	public void setOdid(Integer odid) {
		this.odid = odid;
	}



	public String getProname() {
		return proname;
	}

	public void setProname(String proname) {
		this.proname = proname;
	}

	public Integer getOrderid() {
		return orderid;
	}

	public void setOrderid(Integer orderid) {
		this.orderid = orderid;
	}

	public Integer getOrdercount() {
		return ordercount;
	}

	public void setOrdercount(Integer ordercount) {
		this.ordercount = ordercount;
	}
}
