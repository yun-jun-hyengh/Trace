package com.jajangso.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;

import com.jajangso.dao.GojiBoardDAO;
import com.jajangso.model.GojiBoardVO;

@Service
public class GojiBoardService { // 스프링 빈은 싱글톤으로 객체를 생성한다 
	@Autowired private GojiBoardDAO dao;
	
	private String type; // 검색 유형을 저장해두고 사용할 수 있는 필드 
	private String word; // 검색 단어 
	
	// 게시글 목록
	/*public List<GojiBoardVO> selectBoardList() {
		return dao.selectBoardList();
	}*/
	
	public ModelAndView getBoardList(int page, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView("list");
		
		// 검색어를 DB쿼리문에 포함시키기 위해서 파라미터 추출 이후 전달한다 
		String searchType = request.getParameter("searchType");
		String searchWord = request.getParameter("searchWord");
		
		if(searchType != null && searchWord != null) { // 검색어가 있을때만 등록함
			type = searchType; // 메서드의 변수를 클래스의 필드에 대입한다 
			word = searchWord;
		}
		
		// 화면 당 출력할 글의 개수 
		int perPage = 10;
		HashMap<String, Object> paramCount = new HashMap<String, Object>();
		paramCount.put("perPage", perPage);
		paramCount.put("searchType", type);
		paramCount.put("searchWord", word);
		int pageCount = dao.getPageCount(paramCount);
		
		// 글 순번
		int first = perPage * (page - 1) + 1;
		int last = first + perPage - 1;
		
		// 페이징 범위 
		int section = (page - 1) / 10;
		int begin = 10 * section + 1;     //첫번째 페이지
		int end = begin + 9 > pageCount ? pageCount : begin + 9; // 마지막페이지
		
		HashMap<String, Object> param = new HashMap<String, Object>();
		
		param.put("first", first);
		param.put("last", last);
		param.put("searchWord", word); // 검색유형
		param.put("searchType", type); // 검색단어
		
		mav.addObject("list", dao.selectBoardList(param));
		mav.addObject("section", section);
		mav.addObject("begin", begin);
		mav.addObject("end", end);
		mav.addObject("first", first);
		mav.addObject("last", last);
		mav.addObject("page", page);
		mav.addObject("prev", section != 0);
		mav.addObject("next", pageCount * perPage > end * perPage);
		mav.addObject("searchType", type);
		mav.addObject("searchWord", word);
		return mav;
		
	}
	
	// 게시글 등록
	public void insert(GojiBoardVO article, HttpServletRequest request) throws IllegalStateException, IOException {
		/*String uploadPath = "resources/img"; 
		String path = request.getSession().getServletContext().getRealPath(uploadPath);
		MultipartRequest mpRequest = (MultipartRequest)request;
		MultipartFile mpFile = mpRequest.getFile("imgFile");
		String fileName = mpFile.getOriginalFilename();
		
		//File dest = new File(path, mpFile.getOriginalFilename());
		File dest = new File(path, fileName);
		mpFile.transferTo(dest);
		article.setImg(fileName);
		dao.insert(article);*/
		
		MultipartRequest mpRequest = (MultipartRequest) request;
		MultipartFile imageFile = mpRequest.getFile("imgFile");
		
		//String uploadPath = "resources/img";
		// 서블릿이 실행되는 곳(프로젝트 하위 폴더)에 그림을 업로드
		//String path = request.getSession().getServletContext().getRealPath(uploadPath);
		
		// 절대 경로에 그림을 업로드 (서버를 재시작해도, 이미지가 정상적으로 뜬다)
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
	
	// 특정 게시물 보기 
	public GojiBoardVO getArticle(int num) {
		int plusViewCount = dao.updateViewCount(num);
		if(plusViewCount == 0) {
			throw new RuntimeException("조회수 증가 실패");
		}
		
		GojiBoardVO dto = dao.getArticle(num);
		String content = dto.getContent();
		String lineContent = "";
		Scanner sc = new Scanner(content);
		while(sc.hasNextLine()) {  // 다음 줄이 있으면
			String line = sc.nextLine(); // 한 줄을 가져와서
			line = "<p>" + line + "</p>"; // 앞뒤로 태그를 붙여서
			lineContent += line; // 바꿀 내용에 추가한다
			//System.out.println(line);
		}
		sc.close();
		dto.setContent(lineContent);
		return dao.getArticle(num);
	}
	
	// 특정 게시물 삭제 
	public void delete(int num) {
		dao.delete(num);
	}
	
	// 게시물 수정 
	public void update(GojiBoardVO dto) {
		dao.update(dto);
	}

	public void initSearch() {
		type = null;
		word = null;
	}

	

}
