package com.wpms.daoImpl;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.wpms.dao.ProDao;
import com.wpms.model.Project;
import com.wpms.model.User;
import com.wpms.util.ConnectionUtil;

public class ProDaoImpl extends ConnectionUtil implements ProDao {
	List<Project> list;
	List<User> userlist;
	int i = 0;

	@Override
	public List<Project> getAllpro() {
		list = new ArrayList<Project>();
		openConnection();
		try {
			ps = con.prepareStatement("select * from wpms_pro");
			rs = ps.executeQuery();
			while (rs.next()) {
				Integer proid = rs.getInt("pro_id");
				String proname = rs.getString("pro_name");
				Double proprice = rs.getDouble("pro_price");
				String proclass = rs.getString("pro_class");
				String profirm = rs.getString("pro_firm");
				Integer procount = rs.getInt("pro_count");
				Project project = new Project(proid, procount, proname, proprice, proclass, profirm);
				list.add(project);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Project getProDedail(String proid) {
		Project project = null;
		openConnection();
		try {
			ps = con.prepareStatement("select * from wpms_pro where pro_id=?");
			ps.setInt(1, Integer.parseInt(proid));
			rs = ps.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					Integer pid = rs.getInt("pro_id");
					String proname = rs.getString("pro_name");
					Double proprice = rs.getDouble("pro_price");
					String proclass = rs.getString("pro_class");
					String profirm = rs.getString("pro_firm");
					Integer procount = rs.getInt("pro_count");
					project = new Project(pid, procount, proname, proprice, proclass, profirm);

				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return project;
	}

	@Override
	public List<Project> getPros(Set<Integer> proids) {
		String strproid = "";
		List<Project> prolist = null;

		Object[] objs = proids.toArray();
		for (int i = 0; i < objs.length; i++) {
			if (i == 0) {
				strproid = "'" + objs[0] + "'";
			} else {
				strproid = strproid + "," + "'" + objs[i] + "'";
			}
		}
		strproid.trim();
		openConnection();
		try {
			ps = con.prepareStatement(
					"select pro_id,pro_name,pro_price,pro_firm from wpms_pro where pro_id in(" + strproid + ")");
			rs = ps.executeQuery();
			if (rs != null) {
				prolist = new ArrayList<Project>();
				while (rs.next()) {
					Integer proid = rs.getInt("pro_id");
					String proname = rs.getString("pro_name");
					Double proprice = rs.getDouble("pro_price");
					String profirm = rs.getString("pro_firm");
					Project project = new Project(proid, proname, proprice, profirm);
					prolist.add(project);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return prolist;
	}

	@Override
	public int addPro(Project project) {
		int i = 0;
		openConnection();
		try {
			ps = con.prepareStatement(
					"insert into wpms_pro(pro_name,pro_price,pro_class,pro_firm,pro_count) values(?,?,?,?,?)");
			ps.setString(1, project.getProname());
			ps.setDouble(2, project.getProprice());
			ps.setString(3, project.getProclass());
			ps.setString(4, project.getProfirm());
			ps.setInt(5, project.getProcount());

			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public List<Project> getproList(String pclass) {
		List<Project> list = new ArrayList<Project>();
		openConnection();
		try {
			ps = con.prepareStatement("select * from wpms_pro where pro_class=?");
			ps.setString(1, pclass);
			rs = ps.executeQuery();
			while (rs.next()) {
				Integer proid = rs.getInt("pro_id");
				String proname = rs.getString("pro_name");
				Double proprice = rs.getDouble("pro_price");
				String proclass = rs.getString("pro_class");
				String profirm = rs.getString("pro_firm");
				Project project = new Project(proid, proname, proprice, proclass, profirm);
				list.add(project);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<Project> addCars(Set<Integer> proids) {
		String strproid = "";
		List<Project> prolist = null;

		Object[] objs = proids.toArray();
		for (int i = 0; i < objs.length; i++) {
			if (i == 0) {
				strproid = "'" + objs[0] + "'";
			} else {
				strproid = strproid + "," + "'" + objs[i] + "'";
			}
		}
		strproid.trim();
		openConnection();
		try {
			ps = con.prepareStatement(
					"select pro_id,pro_name,pro_price,pro_firm from wpms_pro where pro_id in(" + strproid + ")");
			rs = ps.executeQuery();
			if (rs != null) {
				prolist = new ArrayList<Project>();
				while (rs.next()) {
					Integer proid = rs.getInt("pro_id");
					String proname = rs.getString("pro_name");
					Double proprice = rs.getDouble("pro_price");
					String profirm = rs.getString("pro_firm");
					Project project = new Project(proid, proname, proprice, profirm);
					prolist.add(project);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return prolist;
	}

	@Override
	public int delPro(String pid) {
		int i = 0;
		openConnection();
		try {
			ps = con.prepareStatement("delete from wpms_pro where pro_id=?");
			ps.setInt(1, Integer.parseInt(pid));
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public int updPro(Project pro) {
		int i = 0;
		openConnection();
		try {
			ps = con.prepareStatement(
					"update wpms_pro set pro_name=?,pro_price=?,pro_class=?,pro_firm=?,pro_count=? where pro_id=?");
			ps.setString(1, pro.getProname());
			ps.setDouble(2, pro.getProprice());
			ps.setString(3, pro.getProclass());
			ps.setString(4, pro.getProfirm());
			ps.setInt(5, pro.getProcount());
			ps.setInt(6, pro.getProid());
			i = ps.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	@Override
	public Map<Integer, Integer> queryCar(Integer userid) {
		openConnection();
		Map<Integer, Integer >procar = new HashMap<Integer,Integer>();
		try {
			ps = con.prepareStatement("select * from wpms_car where user_id = ?");
			ps.setInt(1, userid);
			ps.executeQuery();
			while(rs.next()){
				Integer proid = rs.getInt("pro_id");
				Integer procount = rs.getInt("pro_count");
				procar.put(proid, procount);
			}
		} catch (Exception e) {
			return null;
		}
		return procar;
	}

}
