package com.wpms.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.wpms.model.Project;

public interface ProDao {
	/**
	 * 查询所有商品
	 * 
	 */
	List<Project> getAllpro();
	/**
	 * 根据ID查询商品详细信息
	 * @param proid 商品ID
	 * 
	 */
	Project getProDedail(String proid);
	/**
	 * 根据ID数组查询商品信息
	 * @param proids 商品ID数组
	 * 
	 */
	List<Project> getPros(Set<Integer> proids);
	/**
	 * 增加商品
	 * @param project
	 * 
	 */
	int addPro(Project project);
	/**
	 * 根据商品种类查询商品列表
	 * @param pclass 商品种类
	 * 
	 */
	List<Project> getproList(String pclass);
	/**
	 * 根据ID数组将商品加入购物车
	 * @param proids 商品ID数组
	 * 
	 */
	List<Project> getCars(Set<Integer> proids);
	/**
	 * 根据商品ID删除商品
	 * @param pid 商品ID
	 * 
	 */
	int delPro(String pid);
	/**
	 * 更新商品信息
	 * @param pro 商品信息
	 * 
	 */
	int updPro(Project pro);
	/**
	 * 根据用户ID得到购物车
	 * @param userid 用户ID
	 * 
	 */
	Map<Integer, Integer> queryCar(Integer userid);
	/**
	 * 将商品添加到购物车
	 * @param userid 用户ID
	 * @param proid 商品ID
	 * @param procount 商品数量
	 * 
	 */
	int addToCars(Integer userid,String proid, Integer procount);
	/**
	 * 更新购物车中商品的数量
	 * @param userid 用户ID
	 * @param proid 商品ID
	 * @param procount 商品数量
 	 */
	void uptCarCount(Integer userid, String proid, Integer procount);
	/**
	 * 从购物车中删除商品
	 * @param userid 用户ID
	 * @param proid 商品ID
	 */
	void delFromCar(Integer userid, Integer proid);
	/**
	 * 清空购物车
	 * @param userid
	 */
	void emptyCar(Integer userid);

}
