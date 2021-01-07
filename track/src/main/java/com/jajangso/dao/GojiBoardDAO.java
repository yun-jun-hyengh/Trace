package com.jajangso.dao;

import java.util.HashMap;
import java.util.List;

import com.jajangso.model.GojiBoardVO;

public interface GojiBoardDAO {
	
	// 게시글 목록
	//List<GojiBoardVO> selectBoardList();
	
	List<GojiBoardVO> selectBoardList(HashMap<String, Object> param);	
	
	// 게시글 등록
	void insert(GojiBoardVO article);
	
	// 특정 게시물 보기 
	GojiBoardVO getArticle(int num);
	
	// 게시물 삭제 
	void delete(int num);
	
	// 게시물 수정
	void update(GojiBoardVO dto);
	
	// 조회수 증가
	int updateViewCount(int num);

	int getPageCount(HashMap<String, Object> param);

	

}
