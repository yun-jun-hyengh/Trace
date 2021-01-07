package com.jajangso.model;

import java.util.Date;

public class GroupVO {
	private int grid; // 그룹 번호
	private String grname; // 그룹명
	private Date grdate; // 그룹생성일
	private String grage; // 나이
	private String grlocal; // 지역
	private String grwriter; // 그룹 만든사람
	
	public String getGrwriter() {
		return grwriter;
	}
	public void setGrwriter(String grwriter) {
		this.grwriter = grwriter;
	}
	public int getGrid() {
		return grid;
	}
	public void setGrid(int grid) {
		this.grid = grid;
	}
	public String getGrname() {
		return grname;
	}
	public void setGrname(String grname) {
		this.grname = grname;
	}
	public Date getGrdate() {
		return grdate;
	}
	public void setGrdate(Date grdate) {
		this.grdate = grdate;
	}
	public String getGrage() {
		return grage;
	}
	public void setGrage(String grage) {
		this.grage = grage;
	}
	public String getGrlocal() {
		return grlocal;
	}
	public void setGrlocal(String grlocal) {
		this.grlocal = grlocal;
	}
	
	

}
