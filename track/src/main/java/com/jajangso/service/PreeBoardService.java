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

import com.jajangso.dao.PreeBoardDAO;
import com.jajangso.model.Criteria;
import com.jajangso.model.PreeBoardVO;
import com.jajangso.model.SearchCriteria;

@Service
public class PreeBoardService {
	@Autowired private PreeBoardDAO dao;
	
	public List<PreeBoardVO> list(SearchCriteria scri){
		return dao.list(scri);
	}
	
	public int listCount(SearchCriteria scri) {
		return dao.listCount(scri);
	}

	public PreeBoardVO getBoard(int num) {
		int plusViewCount = dao.updateViewCount(num);
		if(plusViewCount == 0) {
			throw new RuntimeException("조회수 증가 실패");
		}
		PreeBoardVO dto = dao.getBoard(num);
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
		return dao.getBoard(num);
	}

	public void insert(PreeBoardVO article, HttpServletRequest request) throws IllegalStateException, IOException {
		MultipartRequest mpRequest = (MultipartRequest) request;
		MultipartFile imageFile = mpRequest.getFile("imgFile");
		
		//String uploadPath = "resources/img";
		//String path = request.getSession().getServletContext().getRealPath(uploadPath);
		String path = "C:\\uploads";
		File dir = new File(path);
		if(dir.exists() == false) {
			dir.mkdir();
		}
		
		String fileName = imageFile.getOriginalFilename();
		
		if("".equals(fileName) == false) { // 만약 파일이 있으면
			File dest = new File(path, fileName); // 파일 객체 생성
			imageFile.transferTo(dest); // 업로드 파일을 저장
			article.setImg(fileName); // 이미지 이름 설정
		}
		dao.insert(article);
	}

	public void delete(int num) {
		dao.delete(num);
		
	}

	public void update(PreeBoardVO dto) {
		dao.update(dto);
		
	}

	

	
	


}
