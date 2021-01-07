package com.jajangso.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jajangso.dao.JabdamReplyDAO;
import com.jajangso.model.JabdamReplyVO;

@Service
public class JabdamReplyService {
	
	@Autowired private JabdamReplyDAO dao;
	
	// 댓글작성
	public int writeReply(JabdamReplyVO vo, int boardnum) {
		vo.setBoardnum(boardnum);
		return dao.writeReply(vo);
	}
	
	// 댓글목록
	public List<JabdamReplyVO> readReply(int boardnum) {
		return dao.readReply(boardnum);
	}
	
	// 댓글삭제
	public int deleteReply(int boardnum) {
		return dao.deleteReply(boardnum);
	}

}
