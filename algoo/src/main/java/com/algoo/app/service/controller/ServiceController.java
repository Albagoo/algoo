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
	private ServiceService Serviceservice;
	
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
		=Serviceservice.insertSevice(serviceVo);
		String msg="",url="/service/serviceWrite.ag";
		//3
		if(cnt>0){
			msg="서비스 등급을 입력하였습니다.";
		}else{
			msg="서비스 등급을 입력실패하였습니다.";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		
		return "common/message";
	}
	
}
