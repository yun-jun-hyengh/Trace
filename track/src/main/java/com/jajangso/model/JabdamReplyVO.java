package com.jajangso.model;

import java.util.Date;

public class JabdamReplyVO {
	private int boardnum; // 잡담게시판 번호(외래키)설정
	private String writer; // 작성자
	private String context; // 내용
	private Date registDate; // 댓글 작성일자
	private int replyNum; // 댓글번호
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	
	public Date getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}
	public int getReplyNum() {
		return replyNum;
	}
	public void setReplyNum(int replyNum) {
		this.replyNum = replyNum;
	}
	
	

}
