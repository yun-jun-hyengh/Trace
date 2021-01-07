package com.jajangso.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.jajangso.model.GroupBoardVO;
import com.jajangso.model.GroupVO;
import com.jajangso.service.GroupBoardService;
import com.jajangso.service.GroupService;

@Controller
@RequestMapping("/diet")
public class GroupController {
	
	@Autowired private GroupService gs;
	@Autowired private GroupBoardService gb;
	
	// 그룹방리스트
	@RequestMapping(value = "/GroupRoom", method = RequestMethod.GET)
	public String Group(Model model) {
		model.addAttribute("list", gs.selectAllGroup());
		return "diet/GroupRoom";
	}

	// 그룹 만들기
	@RequestMapping(value = "/GroupMake", method = RequestMethod.GET)
	public String GroupMake(HttpSession session, Model model) {
		Object loginInfo = session.getAttribute("member");
		if(loginInfo == null) {
			model.addAttribute("msg", false);
		}
		return "diet/GroupMake";
	}
	
	// 그룹생성
	@RequestMapping(value="/GroupMake", method=RequestMethod.POST)
	public String GroupMake(GroupVO vo) {
		gs.makeGroup(vo);
		return "redirect:/diet/GroupRoom";
	}
	
	// 그룹방 내부 진입
	@RequestMapping(value="GroupIn/{grid}")
	public ModelAndView getGroup(@PathVariable("grid") int grid) {
		ModelAndView mav = new ModelAndView("diet/GroupIn");
		try {
			GroupVO vo = gs.getGroup(grid);
			mav.addObject("go", vo);
		} catch(RuntimeException e) {
			System.out.println(e);
		}
		List<GroupBoardVO> list = gb.list(grid);
		mav.addObject("list", list);
		return mav;
	}
	
	// 그룹삭제 
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	public String del(int grid) {
		gs.delete(grid);
		return "redirect:/diet/GroupRoom";
	}
	
	// 그룹 스티커 쓰기 페이지 입장
	@RequestMapping(value = "GroupBoardWrite/{grid}", method = RequestMethod.GET)
	public String write(HttpSession session, Model model) {
		Object loginInfo = session.getAttribute("member");
		return "diet/GroupBoardWrite";
	}
	
	// 그룹 스티커 작성
	@RequestMapping(value="GroupBoardWrite/{grid}", method=RequestMethod.POST)
	public String write(GroupBoardVO vo, @PathVariable("grid") int grid) {
		int result = gb.write(vo, grid);
		return "redirect:/diet/GroupIn/" + grid;
	}

}
