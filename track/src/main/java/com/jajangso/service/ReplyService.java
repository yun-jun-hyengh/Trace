package com.jajangso.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jajangso.dao.ReplyDAO;
import com.jajangso.model.ReplyVO;

@Service
public class ReplyService {
	
	@Autowired private ReplyDAO dao;
	
	// 댓글 목록
	public List<ReplyVO> readReply(int num){
		return dao.readReply(num);
	}
	
	// 댓글 작성
	public int writeReply(ReplyVO vo, int num) {
		vo.setNum(num);
		return dao.writeReply(vo);
	}
	
	// 댓글 삭제 
	public int deleteReply(int num) {
		return dao.deleteReply(num);
	}

}
