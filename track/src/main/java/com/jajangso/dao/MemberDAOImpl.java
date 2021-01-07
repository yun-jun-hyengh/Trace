package com.jajangso.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;

import com.jajangso.model.MemberVO;

public class MemberDAOImpl implements MemberDAO {
	
	@Autowired private SqlSession sqlSession;
	@Override
	public void insertMember(MemberVO memberVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberVO login(MemberVO memberVO) {
		MemberVO vo = sqlSession.selectOne("mapper.member.loginById", memberVO);
		return vo;
	}

	@Override
	public int idChk(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void memberUpdate(MemberVO memberVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberVO findid(MemberVO memberVO) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public MemberVO findpw(MemberVO memberVO) throws DataAccessException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void memberDelete(MemberVO memberVO) {
		// TODO Auto-generated method stub
		
	}

}
