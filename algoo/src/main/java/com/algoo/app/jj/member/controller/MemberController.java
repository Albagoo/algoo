package com.algoo.app.jj.member.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/algoo")
public class MemberController {
	private static final Logger logger=LoggerFactory.getLogger(MemberController.class);
	
	@RequestMapping("/agreement.ap")
	public String agreement(){
		logger.info("약관동의 화면 보여주기");
		
		return "jj/member/agreement";		
	}
	
}
