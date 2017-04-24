package com.wpms.serviceImpl;

import java.util.List;

import com.wpms.dao.CommentDao;
import com.wpms.daoImpl.CommentDaoImpl;
import com.wpms.model.Comment;
import com.wpms.service.CommentService;

public class CommentServiceImpl implements CommentService {
	CommentDao dao = new CommentDaoImpl();

	@Override
	public List<Comment> getCom(Integer proid) {
		return dao.getCom(proid);

	}

	@Override
	public int addCom(Comment comment) {
		return dao.addCom(comment);

	}

	@Override
	public List<Comment> getAllCom() {
		return dao.getAllCom();

	}

	@Override
	public int delCom(Integer comid) {
		return dao.delCom(comid);

	}

	@Override
	public boolean checkBuy(String proname, Integer userid) {
		return dao.checkbuy(userid, proname);

	}

}
