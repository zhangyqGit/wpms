package com.wpms.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.wpms.dao.OrderDao;
import com.wpms.model.Order;
import com.wpms.model.OrderDetail;
import com.wpms.util.ConnectionUtil;

public class OrderDaoImpl extends ConnectionUtil implements OrderDao {

	@Override
	public int addOrder(Order order) {
		int i = 0;
		openConnection();
		try {
			ps = con.prepareStatement(
					"insert into wpms_order(user_id,order_count,order_money,buy_time) values(?,?,?,?)");
			ps.setInt(1, order.getUserid());
			ps.setInt(2, order.getOrdercount());
			ps.setDouble(3, order.getOrdermoney());
			ps.setTimestamp(4, new java.sql.Timestamp(order.getOrdertime().getTime()));
			i = ps.executeUpdate();
			List<OrderDetail> details = order.getDetails();
			for (OrderDetail detail : details) {
				addOrderDetail(detail);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public void addOrderDetail(OrderDetail detail) {
		openConnection();
		try {
			ps = con.prepareStatement(
					"insert into wpms_orddtl(pro_name,order_id,od_count) values(?,(select max(order_id) from wpms_order),?)");
			ps.setString(1, detail.getProname());
			ps.setInt(2, detail.getOrdercount());
			ps.executeUpdate();
			updProcount(detail.getProname(), -detail.getOrdercount());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	@Override
	public List<Order> getAllOrder(Integer uid) {
		List<Order> list = null;
		openConnection();
		try {
			ps = con.prepareStatement("select * from wpms_order where user_id=?");
			ps.setInt(1, uid);
			rs = ps.executeQuery();
			if (rs != null) {
				list = new ArrayList<Order>();
				while (rs.next()) {
					Integer orderid = rs.getInt("order_id");
					Integer userid = rs.getInt("user_id");
					Date ordertime = rs.getDate("buy_time");
					Integer ordercount = rs.getInt("order_count");
					Double ordermoney = rs.getDouble("order_money");
					Order order = new Order(orderid, userid, ordercount, ordertime, ordermoney);
					list.add(order);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Order getOrder() {
		Order order = null;
		openConnection();
		try {
			ps = con.prepareStatement("select * from wpms_order where order_id=(select max(order_id) from wpms_order)");
			rs = ps.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					Integer orderid = rs.getInt("order_id");
					Integer userid = rs.getInt("user_id");
					Date ordertime = rs.getDate("buy_time");
					Integer ordercount = rs.getInt("order_count");
					Double ordermoney = rs.getDouble("order_money");
					order = new Order(orderid, userid, ordercount, ordertime, ordermoney);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return order;
	}

	@Override
	public List<OrderDetail> getOrderDil(Integer oid) {
		List<OrderDetail> list = new ArrayList<OrderDetail>();
		openConnection();
		try {
			ps = con.prepareStatement("select * from wpms_orddtl where order_id=?");
			ps.setInt(1, oid);
			rs = ps.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					String proname = rs.getString("pro_name");
					Integer orderid = rs.getInt("order_id");
					Integer odcount = rs.getInt("od_count");
					OrderDetail oddil = new OrderDetail(proname, orderid, odcount);
					list.add(oddil);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Order> getAllOrd() {
		List<Order> list = new ArrayList<Order>();
		openConnection();
		try {
			ps = con.prepareStatement("select * from wpms_order");
			rs = ps.executeQuery();
			while (rs.next()) {
				Integer orderid = rs.getInt("order_id");
				Integer userid = rs.getInt("user_id");
				Date ordertime = rs.getDate("buy_time");
				Integer ordercount = rs.getInt("order_count");
				Double ordermoney = rs.getDouble("order_money");
				Order order = new Order(orderid, userid, ordercount, ordertime, ordermoney);
				list.add(order);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int delOrder(Integer oid) {
		int i = 0;
		openConnection();
		try {
			ps = con.prepareStatement("delete from wpms_order where order_id=?");
			ps.setInt(1, oid);
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public void updProcount(String proname, int count) {
		openConnection();
		try {
			ps = con.prepareStatement("update wpms_pro set pro_count=pro_count+? where pro_name=?");
			ps.setInt(1, count);
			ps.setString(2, proname);
			ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
