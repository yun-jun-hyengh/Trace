package com.jajangso.dao;

import java.util.List;

import com.jajangso.model.Criteria;
import com.jajangso.model.PreeBoardVO;
import com.jajangso.model.SearchCriteria;

public interface PreeBoardDAO {

	// 게시물 목록 조회 
	List<PreeBoardVO> list(SearchCriteria scri);
	
	// 게시물 총 갯수 
	int listCount(SearchCriteria scri);
	
	PreeBoardVO getBoard(int num);

	void insert(PreeBoardVO article);

	void delete(int num);

	void update(PreeBoardVO dto);
	
	// 조회수 증가
	int updateViewCount(int num);



}
