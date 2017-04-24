package com.wpms.dao;

import java.util.List;

import com.wpms.model.User;

public interface UserDao {
	/**
	 * 用户登录
	 * @param username 用户名	
	 * @param userpwd 密码
	 * 
	 */
	User login(String username, String userpwd);
	/**
	 * 用户名查重
	 * @param uname 用户名
	 * 
	 */
	boolean checkUsername(String uname);
	/**
	 * 用户注册
	 * @param uname 用户名
	 * @param upwd 密码
	 * @param urole 角色类型
	 * @param usex	性别
	 * @param umail 邮箱
	 * 
	 */
	int register(String uname, String upwd, String urole, String usex, String umail);
	/**
	 * 更新用户信息
	 * @param uid 用户ID
	 * @param uname 用户名
	 * @param upwd 密码
	 * @param usex 性别
	 * @param umail 邮箱	
	 * 
	 */
	int updateUser(Integer uid, String uname, String upwd, String usex, String umail);
	/**
	 * 根据角色查询用户
	 * @param urole 角色类型
	 * 
	 */
	List<User> getAllUser(String urole);
	/**
	 * 删除用户
	 * @param uid 用户ID
	 *
	 */
	int delUser(String uid);
	/**
	 * 根据ID查询用户
	 * @param uid 用户ID
	 * 
	 */
	User selUser(String uid);
	/**
	 * 更新用户账户金额
	 * @param user 用户信息
	 * @param money 账户金额
	 * @return 
	 */
	int updAccount(Integer userid, double money);
}
