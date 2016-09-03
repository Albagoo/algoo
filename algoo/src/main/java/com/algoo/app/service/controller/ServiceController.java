package com.algoo.app.service.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.algoo.app.service.model.ServiceService;
import com.algoo.app.service.model.ServiceVO;

@Controller
@RequestMapping("/service")
public class ServiceController {
	
	private static final Logger logger
	=LoggerFactory.getLogger(ServiceController.class);
	
	@Autowired
	private ServiceService serviceService;
	
	@RequestMapping(value="/serviceWrite.ag",
			method=RequestMethod.GET)
	public String serviceWrite_get(){
		logger.info("서비스 등록 화면");
		return "service/serviceWrite";
	}
	
	@RequestMapping(value="/serviceWrite.ag",
			method=RequestMethod.POST)
	public String serviceWrite_post(
			@ModelAttribute ServiceVO serviceVo,
			Model model){
		//1
		logger.info("서비스 등록 하기, 파라미터"
				+ "serviceVo={} ",serviceVo);
		//2
		int cnt
		=serviceService.insertSevice(serviceVo);
		logger.info("서비스등록결과 cnt={}",cnt);
		//3
		model.addAttribute("serviceVo", serviceVo);
		
		return "redirect:/service/serviceNew.ag";
	}
	
	@RequestMapping("/serviceNew.ag")
	public String serviceNew(
			@ModelAttribute ServiceVO serviceVo
			,Model model){
		logger.info("방금등록한 서비스 값 찾아오기");
		
		serviceVo=serviceService.selectByNew();
		logger.info("서비스 값 serviceVo={}",
				serviceVo);
		model.addAttribute("serviceVo", serviceVo);
		
		return "service/serviceWrite";
	}
}
