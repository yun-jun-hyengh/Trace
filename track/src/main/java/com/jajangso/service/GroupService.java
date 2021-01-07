package com.jajangso.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jajangso.dao.GroupDAO;
import com.jajangso.model.GroupVO;

@Service
public class GroupService {
	
	@Autowired private GroupDAO dao;
	
	// 그룹생성
	public void makeGroup(GroupVO vo) {
		dao.makeGroup(vo);
	}
	
	// 그룹리스트
	public List<GroupVO> selectAllGroup() {
		return dao.selectAllGroup();
	}
	
	// 그룹방 내부
	public GroupVO getGroup(int grid) {
		return dao.getGroup(grid);
	}
	
	// 그룹삭제
	public void delete(int grid) {
		dao.delete(grid);
	}

}
