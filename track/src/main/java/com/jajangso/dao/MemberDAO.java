package com.jajangso.dao;

import org.springframework.dao.DataAccessException;

import com.jajangso.model.MemberVO;

public interface MemberDAO {
	
	// 회원가입
	void insertMember(MemberVO memberVO);
	
	// 로그인
	MemberVO login(MemberVO memberVO);
	
	// 아이디 중복체크
	int idChk(MemberVO memberVO);
	
	// 회원정보 수정
	void memberUpdate(MemberVO memberVO);
	
	// 아이디 찾기 
	MemberVO findid(MemberVO memberVO) throws DataAccessException;
	
	// 비밀번호 찾기 
	MemberVO findpw(MemberVO memberVO) throws DataAccessException;
	
	// 회월 탈퇴 
	void memberDelete(MemberVO memberVO);
	
}
