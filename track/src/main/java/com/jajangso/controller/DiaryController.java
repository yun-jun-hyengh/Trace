package com.jajangso.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jajangso.model.DiaryVO;
import com.jajangso.model.MemberVO;
import com.jajangso.service.DiaryService;

@Controller
@RequestMapping("/diary")
public class DiaryController {
	
	@Autowired private DiaryService ds;
	
	// 다이어리 리스트
	@RequestMapping(value="/diarylist", method=RequestMethod.GET)
	public String diarylist(Model model, HttpServletRequest request) {
		// 세션에 저장된 아이디 가져오기 
		HttpSession session = request.getSession();
		MemberVO login = (MemberVO) session.getAttribute("member");
		String memberid = login.getMemberid();
		
		List<DiaryVO> list = ds.selectAllDiary(memberid);
		model.addAttribute("list", list);
		return "diary/diarylist";
	}
	
	// 일기 작성페이지 오픈 
	@RequestMapping(value="/diarywriter", method=RequestMethod.GET)
	public String diarywriter() {
		return "diary/diarywriter";
	}
	
	// 실제 글작성 
	@RequestMapping(value="/diarywriter", method=RequestMethod.POST)
	public String diarywriter(DiaryVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		int result = ds.insertDiary(vo, request);
		if(result < 1) {
			throw new RuntimeException("글 작성 실패");
		}
		return "redirect:/diary/diarylist";
	}
	
	// 공개게시판
	@RequestMapping(value="/shareboard", method=RequestMethod.GET)
	public String sharevoard(Model model) {
		List<DiaryVO> list = ds.shareAllDiary();
		model.addAttribute("list", list);
		return "diary/shareboard";
	}
	
	// 상세보기 
	@RequestMapping(value="/diaryread", method=RequestMethod.GET)
	public String diaryread(@RequestParam("no") int no, @RequestParam("memberid") String memberid, Model model) {
		DiaryVO vo = new DiaryVO();
		vo.setMemberid(memberid);
		vo.setNo(no);
		
		DiaryVO detail = ds.selectOneDiary(vo);
		model.addAttribute("detail", detail);
		return "diary/diaryread";
	}
	
	// 일기 삭제 
	@RequestMapping(value="/diarydelete", method=RequestMethod.GET)
	public String diarydelete(@RequestParam("no") int no, @RequestParam("memberid") String memberid, RedirectAttributes attr) {
		DiaryVO vo = new DiaryVO();
		vo.setNo(no);
		vo.setMemberid(memberid);
		
		int res = ds.deleteDiary(vo);
		
		attr.addFlashAttribute("msg", "일기를 삭제하였습니다");
		return "redirect:/diary/diarylist";
	}
	
	// 수정페이지 오픈
	@RequestMapping(value="/diaryupdate", method=RequestMethod.GET)
	public String goUpdate(@RequestParam("no") int no, @RequestParam("memberid") String memberid, Model model) {
		DiaryVO vo = new DiaryVO();
		vo.setNo(no);
		vo.setMemberid(memberid);
		DiaryVO detail = ds.goUpdate(vo);
		model.addAttribute("detail", detail);
		return "diary/diaryupdate";
	}
	
	// 게시물 수정 
	@RequestMapping(value="/diaryupdate", method=RequestMethod.POST)
	public String update(DiaryVO vo, HttpServletRequest request, RedirectAttributes attr) throws IllegalStateException, IOException {
		int result = ds.updateDiary(vo, request);
		attr.addFlashAttribute("msg", "일기를 수정하였습니다.");
		return "redirect:/diary/diarylist";
	}
	

}
