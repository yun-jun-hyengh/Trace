package com.jajangso.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jajangso.model.Criteria;
import com.jajangso.model.PageMaker;
import com.jajangso.model.PreeBoardVO;
import com.jajangso.model.ReplyVO;
import com.jajangso.model.SearchCriteria;
import com.jajangso.service.PreeBoardService;
import com.jajangso.service.ReplyService;

@Controller
@RequestMapping("/board")
public class PreeBoardController {
	
	@Autowired private PreeBoardService bs;
	@Autowired private ReplyService rs;
	
	@RequestMapping(value="Preelist", method = RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		model.addAttribute("list", bs.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(bs.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/Preelist";
	}
	
	// 상세 게시물 보기 
	@RequestMapping("Preeread/{num}")
	public ModelAndView read(@PathVariable("num") int num) {
		ModelAndView mav = new ModelAndView("board/Preeread");
		try {
			PreeBoardVO dto = bs.getBoard(num);
			mav.addObject("bo", dto);
		} catch(RuntimeException e) {
			System.out.println(e);
		}
		List<ReplyVO> list = rs.readReply(num);
		mav.addObject("replyList", list);
		return mav;
	}
	
	// 글쓰기 페이지 오픈 
	@RequestMapping(value="/Preewrite", method=RequestMethod.GET)
	public String write(HttpSession session, Model model) {
		Object loginInfo = session.getAttribute("member");
		if(loginInfo == null) {
			model.addAttribute("msg", false);
		}
		return "/board/Preewrite";
	}
	
	// 글 작성하기 
	@RequestMapping(value="/Preewrite", method=RequestMethod.POST)
	public String write(PreeBoardVO article, HttpServletRequest request, RedirectAttributes ra) throws IllegalStateException, IOException {
		bs.insert(article, request);
		ra.addFlashAttribute("msg", "regSuccess");
		return "redirect:/board/Preelist";
	}
	
	// 게시물 삭제
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String del(int num, RedirectAttributes ra) {
		bs.delete(num);
		ra.addFlashAttribute("msg", "delSuccess");
		return "redirect:/board/Preelist";
	}
	
	// 글 수정 페이지 요청 
	@RequestMapping(value="Preeupdate", method=RequestMethod.GET)
	public String mod(int num, Model model) {
		PreeBoardVO dto = bs.getBoard(num);
		model.addAttribute("dto", dto);
		return "/board/Preeupdate";
	}
	
	// 게시물 수정 
	@RequestMapping(value="/Preeupdate", method=RequestMethod.POST)
	public String update(PreeBoardVO dto) {
		bs.update(dto);
		return "redirect:/board/Preeread/" + dto.getNum();
	}
	
	// 댓글 작성 
	@RequestMapping(value="Preeread/{num}", method=RequestMethod.POST)
	public String postReply(ReplyVO vo, @PathVariable("num") int num) {
		int result = rs.writeReply(vo, num);
		return "redirect:/board/Preeread/" + num;
	}
	
	// 댓글 삭제 
	@RequestMapping(value="/deleteReply/{num}", method=RequestMethod.GET)
	public String deleteReply(@PathVariable("num") int num, @RequestHeader("referer") String referer) {
		rs.deleteReply(num);
		return "redirect:" + referer;
	}

}
