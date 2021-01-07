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
import com.jajangso.model.JabdamBoardVO;
import com.jajangso.model.JabdamReplyVO;
import com.jajangso.model.PageMaker;
import com.jajangso.model.SearchCriteria;
import com.jajangso.service.JabdamBoardService;
import com.jajangso.service.JabdamReplyService;

@Controller
@RequestMapping("jabdam")
public class JabdamBoardController {
	
	@Autowired private JabdamBoardService bs;
	@Autowired private JabdamReplyService rs;
	
	// 게시판 목록 조회 
	@RequestMapping(value="/jabdamlist", method=RequestMethod.GET)
	public String list(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		model.addAttribute("list", bs.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(bs.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		return "jabdam/jabdamlist";
	}
	
	// 게시글 작성 페이지 오픈 
	@RequestMapping(value="/jabdamwrite", method=RequestMethod.GET)
	public void write(HttpSession session, Model model) {
		Object loginInfo = session.getAttribute("member");
		if(loginInfo == null) {
			model.addAttribute("msg", false);
		}
	}
	
	// 게시판 글 작성 
	@RequestMapping(value="/jabdamwrite", method=RequestMethod.POST)
	public String write(JabdamBoardVO vo, HttpServletRequest request, RedirectAttributes ra) throws IllegalStateException, IOException{
		bs.insert(vo, request);
		ra.addFlashAttribute("msg", "regSuccess");
		return "redirect:/jabdam/jabdamlist";
	}
	
	// 게시판 조회 
	@RequestMapping("jabdamread/{boardnum}")
	public ModelAndView read(@PathVariable("boardnum") int boardnum) {
		ModelAndView mav = new ModelAndView("jabdam/jabdamread");
		try {
			JabdamBoardVO dto = bs.read(boardnum);
			mav.addObject("read", dto);
		} catch(RuntimeException e) {
			System.out.println(e);
		}
		List<JabdamReplyVO> list = rs.readReply(boardnum);
		mav.addObject("replyList1", list);
		return mav;
	}
	
	// 게시판 삭제 
	@RequestMapping(value="/delete")
	public String delete(int boardnum, RedirectAttributes ra) {
		bs.delete(boardnum);
		ra.addFlashAttribute("msg", "delSuccess");
		return "redirect:/jabdam/jabdamlist";
	}
	
	// 수정 페이지 오픈
	@RequestMapping(value="/jabdamUpdate", method=RequestMethod.GET)
	public String update(int boardnum, Model model) {
		JabdamBoardVO vo = bs.read(boardnum);
		model.addAttribute("read", vo);
		return "jabdam/jabdamUpdate";
	}
	
	// 진짜 수정
	@RequestMapping(value="/jabdamUpdate", method=RequestMethod.POST)
	public String update(JabdamBoardVO vo) {
		bs.update(vo);
		return "redirect:/jabdam/jabdamread/" + vo.getBoardnum();
	}
	
	// 댓글 작성 
	@RequestMapping(value="jabdamread/{boardnum}", method=RequestMethod.POST)
	public String postReply(JabdamReplyVO vo, @PathVariable("boardnum") int boardnum) {
		int result = rs.writeReply(vo, boardnum);
		return "redirect:/jabdam/jabdamread/" + boardnum;
	}
	
	
	// 댓글 삭제
	@RequestMapping(value = "/deleteReply/{boardnum}", method = RequestMethod.GET)
	public String deleteReply(@PathVariable("boardnum") int boardnum, @RequestHeader("referer") String referer) {
		rs.deleteReply(boardnum);
		return "redirect:" + referer;
	}
	
	
}
