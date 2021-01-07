package com.jajangso.dao;

import java.util.List;

import com.jajangso.model.JabdamReplyVO;

public interface JabdamReplyDAO {
	
	// 댓글 작성
	public int writeReply(JabdamReplyVO vo);
	
	// 댓글 조회 
	public List<JabdamReplyVO> readReply(int boardnum);
	
	// 댓글 삭제 
	public int deleteReply(int boardnum);

}
