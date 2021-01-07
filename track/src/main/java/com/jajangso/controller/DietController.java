package com.jajangso.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.jajangso.model.BmiVO;
import com.jajangso.model.CalorieVO;
import com.jajangso.model.Criteria1;
import com.jajangso.model.DietImageVO;
import com.jajangso.model.PageMaker1;
import com.jajangso.service.DietImageService;


@Controller
@RequestMapping("/diet")
public class DietController {
	
	@Autowired private DietImageService ds;
	
	// BMI 계산 페이지 오픈
	@RequestMapping(value="/BMI", method=RequestMethod.GET)
	public String bmi() {
		return "diet/BMI";
	}
	
	// BMI 계산 결과 !! 
	@RequestMapping(value="/BmiResult", method=RequestMethod.GET)
	public String BmiResult(@ModelAttribute("bmi") BmiVO bmi) {
		bmi.bmiresult();
		return "diet/BmiResult";
	}
	
	// 자극사진 이미지 업로드
	@RequestMapping(value="/picture", method=RequestMethod.POST)
	public String imageup(DietImageVO vo, HttpServletRequest request) throws IllegalStateException, IOException {
		int result = ds.insertImage(vo, request);
		if(result < 1) {
			throw new RuntimeException("글 작성 실패");
		}
		return "redirect:/diet/picture";
	}
	
	// 이미지 리스트
	@RequestMapping(value="/picture", method=RequestMethod.GET)
	public String picture(Model model, Criteria1 cri) {
		model.addAttribute("list", ds.list(cri));
		
		PageMaker1 pageMaker = new PageMaker1();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(ds.listcount());
		
		model.addAttribute("pageMaker", pageMaker);
		return "diet/picture";
	}
	
	// 칼로리 처방 페이지 
	@RequestMapping(value="/Calorie", method=RequestMethod.GET)
	public String Calorie() {
		return "diet/Calorie";
	}
	
	// 칼로리 처방 결과 
	@RequestMapping(value="/CalorieResult", method=RequestMethod.GET)
	public String Calorie(@ModelAttribute("vo") CalorieVO vo) {
		vo.rmr();
		vo.extisiting();
		vo.eatsiting();
		vo.basicweight();
		vo.GoodCalo();
		return "diet/CalorieResult";
	}
	
	
}
