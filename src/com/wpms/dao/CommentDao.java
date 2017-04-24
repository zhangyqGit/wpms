package com.wpms.dao;

import java.util.List;

import com.wpms.model.Comment;

public interface CommentDao {
	/**
	 * 根据商品ID查询评论
	 * @param proid 商品ID
	 * 
	 */
	List<Comment> getCom(Integer proid);
	/**
	 * 增加评论
	 * @param comment 评论信息
	 * 
	 */
	int addCom(Comment comment);
	/**
	 * 获取所有评论 
	 * 
	 */
	List<Comment> getAllCom();
	/**
	 * 根据评论ID删除评论
	 * @param comid 评论ID
	 * 
	 */
	int delCom(Integer comid);
	/**
	 * 查询用户是否购买商品
	 * @param proid 商品ID
	 * @param userid 用户ID
	 *
	 */
	boolean checkbuy(Integer userid, String proname);

}
