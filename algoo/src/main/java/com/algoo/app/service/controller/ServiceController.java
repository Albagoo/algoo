package com.algoo.app.service.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/service")
public class ServiceController {
	
	private static final Logger logger
	=LoggerFactory.getLogger(ServiceController.class);
	
	@RequestMapping(value="/serviceWrite.ag",
			method=RequestMethod.GET)
	public String serviceWrite_get(){
		logger.info("서비스 등록 화면");
		return "service/serviceWrite";
	}
	
	@RequestMapping(value="/serviceWrite.ag",
			method=RequestMethod.POST)
	public String serviceWrite_post(
			@RequestParam String grade,
			@RequestParam int deadline,
			Model model){
		//1
		logger.info("서비스 등록 하기, 파라미터"
				+ "grade={},deadline={} ",
				grade,deadline);
		
		//2
		
		
		//3
		model.addAttribute("msg", grade+","+deadline);
		model.addAttribute("url", "/service/serviceWrite.ag");
		
		
		
		return "common/message";
	}
	
}
