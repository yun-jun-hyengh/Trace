package com.jajangso.model;

import java.util.Date;

public class DiaryVO {
	private String memberid; // 회원아이디
	private int no; // 게시글 번호
	private String title; // 게시글 제목
	private String content; // 게시글 내용
	private String readcnt; // 조회수
	private Date regdate; // 등록날짜
	private String image; // 이미지
	
	private String ckshare; // 공유컬럼 

	public String getMemberid() {
		return memberid;
	}

	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getReadcnt() {
		return readcnt;
	}

	public void setReadcnt(String readcnt) {
		this.readcnt = readcnt;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getCkshare() {
		return ckshare;
	}

	public void setCkshare(String ckshare) {
		this.ckshare = ckshare;
	}
	
	

}
