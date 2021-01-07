package com.jajangso.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jajangso.dao.GroupBoardDAO;
import com.jajangso.model.GroupBoardVO;

@Service
public class GroupBoardService {
	
	@Autowired private GroupBoardDAO dao;
	
	// 스티커 작성 
	public int write(GroupBoardVO vo, int grid) {
		vo.setGrid(grid);
		return dao.write(vo);
	}
	
	// 스티커 리스트
	public List<GroupBoardVO> list(int grid) {
		return dao.list(grid);
	}

}
