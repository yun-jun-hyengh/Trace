package com.jajangso.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jajangso.model.MemberVO;
import com.jajangso.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired private MemberService ms;
	
	@RequestMapping(value="/member", method=RequestMethod.GET)
	public ModelAndView join() {
		ModelAndView mav = new ModelAndView("member");
		return mav;
	}
	
	// 회원가입 성공 !! 
	@RequestMapping(value="/member", method=RequestMethod.POST)
	public String join(MemberVO memberVO) {
		int result = ms.idChk(memberVO);
		try {
			if(result == 1) {
				return "member";
			}else if(result == 0) {
				ms.insertMember(memberVO);
			}
		} catch(Exception e) {
			throw new RuntimeException();
		}
		return "login";
	}
	
	// 아이디 중복체크
	@ResponseBody
	@RequestMapping(value="/idChk", method=RequestMethod.POST)
	public int idChk(MemberVO vo) {
		int result = ms.idChk(vo);
		return result;
	}
	
	// 로그인 페이지 오픈 
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public ModelAndView login() {
		ModelAndView mav = new ModelAndView("login");
		return mav;
	}
	
	// 실제 로그인 
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(MemberVO memberVO, HttpSession session) {
		String returnURL = "";
		if(session.getAttribute("member") != null) {
			session.removeAttribute("member");
		}
		MemberVO member = ms.login(memberVO);
		if(member != null) {
			session.setAttribute("member", member);
			returnURL = "redirect:/";
		} else {
			returnURL = "redirect:/login";
		}
		return returnURL;
	}
	
	// 로그아웃
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		ModelAndView mav = new ModelAndView("redirect:/");
		session.invalidate();
		return mav;
	}
	
	// 회원정보 수정창 오픈 
	@RequestMapping(value="/memberUpdateView", method=RequestMethod.GET)
	public String registerUpdateView() {
		return "/memberUpdateView";
	}
	
	// 회원정보 수정 
	@RequestMapping(value="/memberUpdateView", method=RequestMethod.POST)
	public String registerUpdateView(MemberVO memberVO, HttpSession session) {
		ms.memberUpdate(memberVO);
		session.invalidate();
		return "redirect:/login";
	}
	
	// 아이디 찾기 창 띄우기
	@RequestMapping(value="/findId", method=RequestMethod.GET)
	public ModelAndView findid() {
		ModelAndView mav = new ModelAndView("findId");
		return mav;
	}	
	
	// 아이디 찾기 
	@RequestMapping(value="/findId", method=RequestMethod.POST)
	public ModelAndView findid(@ModelAttribute("member1") MemberVO memberVO, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = ms.findid(memberVO);
		//System.out.println(memberVO.getMemberid());
		session.setAttribute("member1", memberVO);
		mav.setViewName("findViewID");
		return mav;
	}
	
	// 비밀번호 찾기 창 띄우기
	@RequestMapping(value="/findPw", method=RequestMethod.GET)
	public ModelAndView findpw() {
		ModelAndView mav = new ModelAndView("findPw");
		return mav;
	}
	
	// 실제 비밀번호 찾기 
	@RequestMapping(value="/findPw", method=RequestMethod.POST)
	public ModelAndView findpw(@ModelAttribute("member2") MemberVO memberVO, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		memberVO = ms.findpw(memberVO);
		session.setAttribute("member2", memberVO);
		mav.setViewName("findViewPw");
		return mav;
	}
	
	// 이름을 클릭했을시 마이페이지로 이동 
	@RequestMapping(value="/mypage", method=RequestMethod.GET)
	public String diarylist() {
		return "mypage";
	}
	
	// 내정보 창 열기 
	@RequestMapping(value="/memberview")
	public String memberview(Model model, HttpSession session) {
		return "memberview";
	}
	
	// 회원탈퇴창 오픈 
	@RequestMapping(value="/memberdelete", method=RequestMethod.GET)
	public String memberDelete() {
		return "memberdelete";
	}
	
	// 실제 회원탈퇴 
	@RequestMapping(value="/memberdelete", method=RequestMethod.POST)
	public String memberDelete(MemberVO memberVO, HttpSession session, RedirectAttributes rttr) {
		MemberVO member = (MemberVO) session.getAttribute("member");
		String sessionPass = member.getMemberpw();
		String voPass = memberVO.getMemberpw();
		
		if(!(sessionPass.equals(voPass))) {
			rttr.addFlashAttribute("msg", false);
			return "redirect:/memberdelete";
		}
		ms.memberDelete(memberVO);
		session.invalidate();
		return "redirect:/";
	}
	
}
