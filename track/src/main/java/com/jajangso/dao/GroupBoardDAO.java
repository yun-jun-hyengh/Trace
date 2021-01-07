package com.jajangso.dao;

import java.util.List;

import com.jajangso.model.GroupBoardVO;

public interface GroupBoardDAO {
	
	// 스티커작성
	public int write(GroupBoardVO vo);
	
	// 스티커리스트
	public List<GroupBoardVO> list(int grid);
	
	

}
