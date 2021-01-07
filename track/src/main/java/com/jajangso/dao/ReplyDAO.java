package com.jajangso.dao;

import java.util.List;

import com.jajangso.model.ReplyVO;

public interface ReplyDAO {
	
	// 댓글 조회 
	public List<ReplyVO> readReply(int num);
	
	// 댓글 작성
	public int writeReply(ReplyVO vo);
	
	// 댓글 삭제
	public int deleteReply(int num);

}
