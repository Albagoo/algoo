package com.algoo.app.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.algoo.app.member.controller.LoginController;

@Controller
public class MainController {
	private static final Logger logger
	=LoggerFactory.getLogger(LoginController.class);
		
	@RequestMapping("/leftSide.ag")
	public String LeftSide(){
		//1.
		logger.info("좌측 내비게이션 보여주기");
		
		return "inc/leftSide";
	}
}