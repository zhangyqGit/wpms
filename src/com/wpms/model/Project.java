package com.wpms.model;

public class Project {
	private Integer proid;
	private Integer procount;
	private String proname;
	private double proprice;
	private String proclass;
	private String profirm;
	private String proremark;
	private Integer buycount;

	public Project(Integer proid, Integer procount, String proname, double proprice, String proclass, String profirm) {
		super();
		this.proid = proid;
		this.procount = procount;
		this.proname = proname;
		this.proprice = proprice;
		this.proclass = proclass;
		this.profirm = profirm;
	}

	public Project(Integer proid, String proname, double proprice, String proclass, String profirm) {
		super();
		this.proid = proid;
		this.proname = proname;
		this.proprice = proprice;
		this.proclass = proclass;
		this.profirm = profirm;
	}

	public Project(Integer proid, String proname, double proprice, String profirm, Integer buycount) {
		super();
		this.proid = proid;
		this.proname = proname;
		this.proprice = proprice;
		this.profirm = profirm;
		this.buycount = buycount;
	}

	public Project(Integer proid, String proname, double proprice, String proclass, String profirm, String proremark) {
		super();
		this.proid = proid;
		this.proname = proname;
		this.proprice = proprice;
		this.proclass = proclass;
		this.profirm = profirm;
		this.proremark = proremark;
	}

	public Project(Integer proid, String proname, double proprice, String profirm) {
		super();
		this.proid = proid;
		this.proname = proname;
		this.proprice = proprice;
		this.profirm = profirm;
	}

	public Project(Integer procount, double proprice, String proname, String proclass, String profirm) {
		super();
		this.procount = procount;
		this.proname = proname;
		this.proprice = proprice;
		this.proclass = proclass;
		this.profirm = profirm;
	}

	public Integer getProid() {
		return proid;
	}

	public void setProid(Integer proid) {
		this.proid = proid;
	}

	public Integer getProcount() {
		return procount;
	}

	public void setProcount(Integer procount) {
		this.procount = procount;
	}

	public String getProname() {
		return proname;
	}

	public void setProname(String proname) {
		this.proname = proname;
	}

	public double getProprice() {
		return proprice;
	}

	public void setProprice(double proprice) {
		this.proprice = proprice;
	}

	public String getProclass() {
		return proclass;
	}

	public void setProclass(String proclass) {
		this.proclass = proclass;
	}

	public String getProfirm() {
		return profirm;
	}

	public void setProfirm(String profirm) {
		this.profirm = profirm;
	}

	public String getProremark() {
		return proremark;
	}

	public void setProremark(String proremark) {
		this.proremark = proremark;
	}

	public Integer getBuycount() {
		return buycount;
	}

	public void setBuycount(Integer buycount) {
		this.buycount = buycount;
	}

}
