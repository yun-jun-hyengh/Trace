package com.jajangso.dao;

import java.util.List;

import com.jajangso.model.Criteria;
import com.jajangso.model.JabdamBoardVO;
import com.jajangso.model.SearchCriteria;

public interface JabdamBoardDAO {
	
	// 게시글 목록
	public List<JabdamBoardVO> list(SearchCriteria scri);
	
	// 게시물 총 갯수
	public int listCount(SearchCriteria scri);
	
	// 게시글 작성 
	public void insert(JabdamBoardVO vo);
	
	// 특정 게시물 조회 
	public JabdamBoardVO read(int boardnum);
	
	// 게시물 삭제 
	void delete(int boardnum);
	
	// 게시물 수정 
	void update(JabdamBoardVO vo);
	
	// 조회수 증가 
	int updateViewCount(int boardnum);

}
