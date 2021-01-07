package com.jajangso.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.jajangso.dao.DiaryDAO;
import com.jajangso.model.DiaryVO;
import com.jajangso.model.MemberVO;

@Service
public class DiaryService {
	
	@Autowired private DiaryDAO dao;
	
	static boolean linebreak;
	static int no;
	// 다이어리 리스트 
	public List<DiaryVO> selectAllDiary(String memberid){
		return dao.selectAllDiary(memberid);
	}
	
	// 게시글 작성 
	public int insertDiary(DiaryVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		// 세션에 저장되어있는 아이디값 가져오기
		HttpSession session = request.getSession();
		MemberVO membervo = (MemberVO) session.getAttribute("member");
		
		String memberid = membervo.getMemberid();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		// 체크박스에 추가된 값 가져오기 
		String ckshare = request.getParameter("ckshare");
		
		vo.setMemberid(memberid);
		vo.setTitle(title);
		vo.setContent(content);
		
		if(ckshare == null || ckshare.equals("")) {
			vo.setCkshare("false");
		} else {
			vo.setCkshare(ckshare);
		}
		
		MultipartRequest mpRequest = (MultipartRequest) request;
		MultipartFile imageFile = mpRequest.getFile("imageFile");
		
		String path = "C:\\uploads";
		File dir = new File(path);
		if(dir.exists() == false) {
			dir.mkdir();
		}
		
		String fileName = imageFile.getOriginalFilename();
		if("".equals(fileName) == false) {
			File dest = new File(path, fileName);
			imageFile.transferTo(dest);
			vo.setImage(fileName);
		}
		return dao.insertDiary(vo);	
	}
	
	// 공개게시판
	public List<DiaryVO> shareAllDiary() {
		return dao.shareAllDiary();
	}
	
	// 상세보기
	public DiaryVO selectOneDiary(DiaryVO vo) {
		DiaryVO before = dao.selectOneDiary(vo);
		dao.updateViewCount(no);
		DiaryVO after = dao.selectOneDiary(vo);
		if(before.getReadcnt() == after.getReadcnt())
			throw new RuntimeException("조회수 증가 실패");
		
		// 가져온 글의 내용을 줄 바꿈 처리 하는 코드 
		DiaryVO dto = dao.selectOneDiary(vo);
		if(linebreak) {
			String content = dto.getContent();
			String lineContent = "";
			Scanner sc = new Scanner(content);
			while(sc.hasNextLine()) {
				String line = sc.nextLine();
				line = "<p>" + line + "</p>";
				lineContent += line;
			}
			sc.close();
			dto.setContent(lineContent);
		}
		return dto;
	}
	
	// 일기 삭제 
	public int deleteDiary(DiaryVO vo) {
		return dao.deleteDiary(vo);
	}
	
	// 수정 페이지로 이동 = id와 글 번호를 받아서 데이터 전달
	public DiaryVO goUpdate(DiaryVO vo) {
		return dao.selectOneDiary(vo);
	}
	
	// 일기 수정 
	public int updateDiary(DiaryVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		String memberid = request.getParameter("memberid");
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		String ckshare = request.getParameter("ckshare");
		
		vo.setNo(no);
		vo.setMemberid(memberid);
		vo.setTitle(title);
		vo.setContent(content);
		
		if(ckshare == null || ckshare.equals("")) {
			vo.setCkshare("false");
		} else {
			vo.setCkshare(ckshare);
		}
		
		MultipartRequest mpRequest = (MultipartRequest) request;
		MultipartFile imageFile = mpRequest.getFile("imageFile");
		
		String path = "C:\\uploads";
		File dir = new File(path);
		if(dir.exists() == false) {
			dir.mkdir();
		}
		
		String fileName = imageFile.getOriginalFilename();
		if("".equals(fileName) == false) {
			File dest = new File(path, fileName);
			imageFile.transferTo(dest);
			vo.setImage(fileName);
		}
		return dao.updateDiary(vo);
	}

}
