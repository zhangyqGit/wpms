package com.wpms.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.wpms.dao.UserDao;
import com.wpms.model.User;
import com.wpms.util.ConnectionUtil;

public class UserDaoImpl extends ConnectionUtil implements UserDao {
	@Override
	public User login(String uname, String upwd) {
		User user = null;
		try {
			openConnection();
			ps = con.prepareStatement("select * from user where user_name=? and user_pwd=?");
			ps.setString(1, uname);
			ps.setString(2, upwd);
			if (ps != null) {
				rs = ps.executeQuery();
				if (rs != null) {
					while (rs.next()) {
						String userrole = rs.getString("user_role");
						int userid = rs.getInt("id");
						String username = rs.getString("user_name");
						String userpwd = rs.getString("user_pwd");
						Double useraccount = rs.getDouble("user_account");
						String usersex = rs.getString("user_sex");
						String usermail = rs.getString("user_mail");
						user = new User(userid, username, userpwd, userrole, useraccount, usersex, usermail);
					}
				}
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public boolean checkUsername(String uname) {
		boolean result = false;
		openConnection();
		try {
			ps = con.prepareStatement("select id from user where user_name=?");
			ps.setString(1, uname);
			rs = ps.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					result = true;
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}

	@Override
	public int register(String uname, String upwd, String urole, String usex, String umail) {
		int i = 0;
		openConnection();
		try {
			ps = con.prepareStatement(
					"insert into user(user_name,user_pwd,user_role,user_sex,user_mail) values(?,?,?,?,?)");
			ps.setString(1, uname);
			ps.setString(2, upwd);
			ps.setString(3, urole);
			ps.setString(4, usex);
			ps.setString(5, umail);

			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public int updateUser(Integer uid, String uname, String upwd, String usex, String umail) {
		int i = 0;
		openConnection();
		try {
			ps = con.prepareStatement("update user set user_name=?,user_pwd=?,user_sex=?,user_mail=? where id=?");
			ps.setString(1, uname);
			ps.setString(2, upwd);
			ps.setString(3, usex);
			ps.setString(4, umail);
			ps.setInt(5, uid);

			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public List<User> getAllUser(String urole) {
		List<User> userlist = new ArrayList<User>();
		openConnection();
		try {
			ps = con.prepareStatement("select * from user where user_role=?");
			ps.setString(1, urole);
			rs = ps.executeQuery();
			while (rs.next()) {
				int userid = rs.getInt("id");
				String username = rs.getString("user_name");
				String userpwd = rs.getString("user_pwd");
				Double useraccount = rs.getDouble("user_account");
				String usersex = rs.getString("user_sex");
				String usermail = rs.getString("user_mail");
				User user = new User(userid, username, userpwd, useraccount, usersex, usermail);
				userlist.add(user);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userlist;
	}

	@Override
	public int delUser(String uid) {
		int i = 0;
		openConnection();
		try {
			ps = con.prepareStatement("delete from user where id=?");
			ps.setInt(1, Integer.parseInt(uid));
			i = ps.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public User selUser(String uid) {
		User user = null;
		openConnection();
		try {
			ps = con.prepareStatement("select * from user where id=?");
			ps.setInt(1, Integer.parseInt(uid));
			rs = ps.executeQuery();
			while (rs.next()) {
				int userid = rs.getInt("id");
				String username = rs.getString("user_name");
				String userpwd = rs.getString("user_pwd");
				Double useraccount = rs.getDouble("user_account");
				String usersex = rs.getString("user_sex");
				String usermail = rs.getString("user_mail");
				user = new User(userid, username, userpwd, useraccount, usersex, usermail);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public int updAccount(Integer userid, double money) {
		int i = 0;
		openConnection();
		try {
			ps = con.prepareStatement("update user set user_account=user_account+? where id=? ");
			ps.setDouble(1, money);
			ps.setInt(2, userid);
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}
}
