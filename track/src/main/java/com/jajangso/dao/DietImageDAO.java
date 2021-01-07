package com.jajangso.dao;

import java.util.List;

import com.jajangso.model.Criteria1;
import com.jajangso.model.DietImageVO;

public interface DietImageDAO {
	// 이미지 삽입
	public int insertImage(DietImageVO vo);
	
	// 이미지 리스트
	public List<DietImageVO> list(Criteria1 cri);
	
	// 게시물 총 개수 
	public int listcount();

}
