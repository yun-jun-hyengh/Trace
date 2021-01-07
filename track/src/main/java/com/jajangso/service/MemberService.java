package com.jajangso.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jajangso.dao.MemberDAO;
import com.jajangso.model.MemberVO;

@Service
public class MemberService {
	
	@Autowired private MemberDAO dao;
	
	// 회원가입
	public void insertMember(MemberVO memberVO) {
		dao.insertMember(memberVO);
	}
	
	// 로그인
	public MemberVO login(MemberVO memberVO) {
		return dao.login(memberVO);
	}
	
	// 아이디 중복체크
	public int idChk(MemberVO memberVO) {
		int result = dao.idChk(memberVO);
		return result;
	}
	
	// 회원정보 수정 
	public void memberUpdate(MemberVO memberVO) {
		dao.memberUpdate(memberVO);
	}
	
	// 아이디 찾기 
	public MemberVO findid(MemberVO memberVO) {
		return dao.findid(memberVO);
	}
	
	// 비밀번호 찾기 
	public MemberVO findpw(MemberVO memberVO) {
		return dao.findpw(memberVO);
	}
	
	// 회원탈퇴 
	public void memberDelete(MemberVO memberVO) {
		dao.memberDelete(memberVO);
	}
	

}
