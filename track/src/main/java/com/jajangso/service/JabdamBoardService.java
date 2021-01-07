package com.jajangso.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.jajangso.dao.JabdamBoardDAO;
import com.jajangso.model.Criteria;
import com.jajangso.model.JabdamBoardVO;
import com.jajangso.model.SearchCriteria;

@Service
public class JabdamBoardService {
	
	@Autowired private JabdamBoardDAO dao;
	
	// 게시판 목록
	public List<JabdamBoardVO> list(SearchCriteria scri){
		return dao.list(scri);
	}
	
	// 게시물 총 갯수
	public int listCount(SearchCriteria scri) {
		return dao.listCount(scri);
	}
	
	// 게시글 작성 
	public void insert(JabdamBoardVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		MultipartRequest mpRequest = (MultipartRequest) request;
		MultipartFile imageFile = mpRequest.getFile("imgFile");
		String path = "C:\\uploads";
		File dir = new File(path);
		if(dir.exists() == false) {
			dir.mkdir();
		}
		
		String fileName = imageFile.getOriginalFilename();
		
		if("".equals(fileName) == false) { // 만약 파일이 있으면
			File dest = new File(path, fileName); // 파일 객체 생성
			imageFile.transferTo(dest); // 업로드 파일을 저장
			vo.setImg(fileName); // 이미지 이름 설정
		}
		dao.insert(vo);
	}
	
	// 특정 게시물 조회 
	public JabdamBoardVO read(int boardnum) {
		int plusViewCount = dao.updateViewCount(boardnum);
		if(plusViewCount == 0) {
			throw new RuntimeException("조회수 증가 실패");
		}
		JabdamBoardVO dto = dao.read(boardnum);
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
		return dao.read(boardnum);
	}
	
	// 게시물 삭제 
	public void delete(int boardnum) {
		dao.delete(boardnum);
	}
	
	// 게시물 수정 
	public void update(JabdamBoardVO vo) {
		dao.update(vo);
	}

}
