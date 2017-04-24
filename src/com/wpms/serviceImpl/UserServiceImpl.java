package com.wpms.serviceImpl;

import java.util.List;

import com.wpms.dao.UserDao;
import com.wpms.daoImpl.UserDaoImpl;
import com.wpms.model.User;
import com.wpms.service.UserService;

public class UserServiceImpl implements UserService {
	UserDao dao = new UserDaoImpl();

	@Override
	public User login(String uname, String upwd) {
		return dao.login(uname, upwd);

	}

	@Override
	public boolean checkUsername(String uname) {
		return dao.checkUsername(uname);

	}

	@Override
	public int register(String uname, String upwd, String urole, String usex, String umail) {
		return dao.register(uname, upwd, urole, usex, umail);

	}

	@Override
	public int updateUser(Integer uid, String uname, String upwd, String usex, String umail) {
		return dao.updateUser(uid, uname, upwd, usex, umail);

	}

	@Override
	public List<User> getAllUser(String urole) {
		return dao.getAllUser(urole);

	}

	@Override
	public int delUser(String uid) {
		return dao.delUser(uid);

	}

	@Override
	public User selUser(String uid) {
		return dao.selUser(uid);

	}

	@Override
	public int updAccount(Integer userid, double money) {
		return dao.updAccount(userid,money);
		
	}
}
