package com.jajangso.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jajangso.model.GojiBoardVO;
import com.jajangso.service.GojiBoardService;



@Controller
public class GojiBoardController {
	@Autowired private GojiBoardService bs;
	
	// 게시글 목록
	/*@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(Model model) {
		List<GojiBoardVO> list = bs.selectBoardList();
		model.addAttribute("article", list);
		return "list";
	}*/
	@RequestMapping("/list")
	public ModelAndView list(HttpServletRequest request) {
		return list(1, request);
	}
	
	@RequestMapping("{page}")
	public ModelAndView list(@PathVariable("page") int page,
							 HttpServletRequest request) {
		return bs.getBoardList(page, request);
	}
	
	
	// 글쓰기 페이지 오픈 
	@RequestMapping(value="/writer", method=RequestMethod.GET)
	public String writer(HttpSession session, Model model) {
		Object loginInfo = session.getAttribute("member");
		return "writer";
	}
	
	// 글쓰기 완료 
	@RequestMapping(value="/writer", method=RequestMethod.POST)
	public String writer(GojiBoardVO article, HttpServletRequest request) throws ServletException,IllegalStateException, IOException {
		bs.insert(article, request);
		return "redirect:/list";
	}
	
	// 특정 게시물 상세보기 
	@RequestMapping("/read/{num}")
	public String content(@PathVariable("num") int num, Model model) {
		GojiBoardVO dto = bs.getArticle(num);
		model.addAttribute("dto", dto);
		return "read";
	}
	
	// 게시물 삭제 
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String del(int num) {
		bs.delete(num);
		return "redirect:/list";
	}
	
	// 게시물 수정 페이지 요청 
	@RequestMapping(value="/update", method=RequestMethod.GET)
	public String mod(int num, Model model) {
		// 특정 게시물의 내용을 불러와야 하니까 !!
		GojiBoardVO dto = bs.getArticle(num);
		model.addAttribute("dto", dto);
		return "update";
	}
	
	// 게시물 수정 
	@RequestMapping(value="/update", method=RequestMethod.POST)
	public String update(GojiBoardVO dto) {
		bs.update(dto);
		return "redirect:/read/" + dto.getNum();
	}
	
	@RequestMapping("initsearch")
	public String initSearch() {
		bs.initSearch(); // BoardService에 저장된 type과 word의 값을 null로 처리
		return "redirect:/list"; // 기본 게시판 목록으로 이동
	}
	
}
