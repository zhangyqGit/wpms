package com.wpms.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wpms.dao.CommentDao;
import com.wpms.model.Comment;
import com.wpms.util.ConnectionUtil;

public class CommentDaoImpl extends ConnectionUtil implements CommentDao {

	@Override
	public List<Comment> getCom(Integer proid) {
		List<Comment> list = new ArrayList<Comment>();
		openConnection();
		try {
			ps = con.prepareStatement("select * from wpms_com where pro_id=?");
			ps.setInt(1, proid);
			rs = ps.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					Integer userid = rs.getInt("user_id");
					String username = rs.getString("user_name");
					String comitem = rs.getString("com_item");
					Comment comment = new Comment(userid, username, comitem);
					list.add(comment);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int addCom(Comment comment) {
		int i = 0;
		openConnection();
		try {
			ps = con.prepareStatement("insert into wpms_com(pro_id,user_id,pro_name,user_name,com_item) values(?,?,?,?,?)");
			ps.setInt(1, comment.getProid());
			ps.setInt(2, comment.getUserid());
			ps.setString(3, comment.getProname());
			ps.setString(4, comment.getUsername());
			ps.setString(5, comment.getComitem());

			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public List<Comment> getAllCom() {
		List<Comment> list = new ArrayList<Comment>();
		openConnection();
		try {
			ps = con.prepareStatement("select * from wpms_com");
			rs = ps.executeQuery();
			while (rs.next()) {
				Integer comid = rs.getInt("com_id");
				Integer proid = rs.getInt("pro_id");
				Integer userid = rs.getInt("user_id");
				String proname = rs.getString("pro_name");
				String username = rs.getString("user_name");
				String comitem = rs.getString("com_item");
				Comment comment = new Comment(comid, proid, userid, username, comitem,proname);
				list.add(comment);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int delCom(Integer comid) {
		int i = 0;
		openConnection();
		try {
			ps = con.prepareStatement("delete from wpms_com where com_id=?");
			ps.setInt(1, comid);
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public boolean checkbuy(Integer userid, String proname) {
		boolean i = false;
		openConnection();
		try {
			ps = con.prepareStatement(
					"select * from wpms_orddtl where order_id in(select order_id from wpms_order where user_id=?) and pro_name=?");
			ps.setInt(1, userid);
			ps.setString(2, proname);
			rs = ps.executeQuery();
			while (rs.next()) {
				i = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
}
