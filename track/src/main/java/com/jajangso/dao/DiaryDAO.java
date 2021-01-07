package com.jajangso.dao;

import java.util.List;

import com.jajangso.model.DiaryVO;

public interface DiaryDAO {
	
	// 일기 작성 
	public int insertDiary(DiaryVO vo);
	
	// 다이어리 리스트 
	public List<DiaryVO> selectAllDiary(String memberid);
	
	// 공개게시판
	public List<DiaryVO> shareAllDiary();
	
	// 상세보기 
	public DiaryVO selectOneDiary(DiaryVO vo);
	
	// 일기 삭제
	public int deleteDiary(DiaryVO vo);
	
	// 일기 수정 
	public int updateDiary(DiaryVO vo);
	
	// 조회수 증가 
	public int updateViewCount(int no);

}
