package com.jajangso.dao;

import java.util.List;

import com.jajangso.model.GroupVO;

public interface GroupDAO {
	
	// 그룹 생성
	public void makeGroup(GroupVO vo);
	
	// 그룹리스트
	public List<GroupVO> selectAllGroup();
	
	// 그룹방내부
	GroupVO getGroup(int grid);
	
	// 그룹삭제
	public void delete(int grid);

}
