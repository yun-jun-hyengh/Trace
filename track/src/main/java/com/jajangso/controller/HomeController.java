package com.jajangso.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		return "home";
	}
	
	@RequestMapping(value="/map",method=RequestMethod.GET)
	public String map() {
		return "map";
	}
	
	@RequestMapping(value="/diart", method=RequestMethod.GET)
	public String diet() {
		return "diart";
	}
	
}
