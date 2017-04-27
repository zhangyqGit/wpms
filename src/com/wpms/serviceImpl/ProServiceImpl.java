package com.wpms.serviceImpl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import com.wpms.dao.ProDao;
import com.wpms.daoImpl.ProDaoImpl;
import com.wpms.model.Project;
import com.wpms.service.ProService;

public class ProServiceImpl implements ProService {
	ProDao dao = new ProDaoImpl();

	@Override
	public List<Project> getAllpro() {
		return dao.getAllpro();

	}

	@Override
	public Project getProDetail(String proid) {
		return dao.getProDedail(proid);

	}

	@Override
	public List<Project> getPros(Set<Integer> proids) {
		return dao.getPros(proids);

	}

	@Override
	public int addPro(Project project) {
		return dao.addPro(project);

	}

	@Override
	public List<Project> getproList(String pclass) {
		return dao.getproList(pclass);

	}

	@Override
	public List<Project> addCars(Set<Integer> proids) {
		return dao.addCars(proids);

	}

	@Override
	public int delPro(String pid) {
		return dao.delPro(pid);

	}

	@Override
	public int updPro(Project pro) {
		return dao.updPro(pro);
	}

	@Override
	public Map<Integer, Integer> queryCar(Integer userid) {
		return dao.queryCar(userid);
	}

}
