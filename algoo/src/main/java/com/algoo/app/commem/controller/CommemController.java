package com.algoo.app.commem.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.algoo.app.commem.model.CommemService;
import com.algoo.app.commem.model.CommemVO;

@Controller
@RequestMapping("/member_comp")
public class CommemController {
	private static final Logger logger
		= LoggerFactory.getLogger(CommemController.class);
	
	@Autowired
	private CommemService commemService;
	
	//회원가입화면 창띄우기
	@RequestMapping("/register.ag")
	public String showRegister(){
		
		return "member_comp/register";
	}
	
	//기업회원 - insert
	@RequestMapping("/memberAdd.ag")
	public String memberAdd(@ModelAttribute CommemVO commemVo,
			@RequestParam String email3){
		logger.info("기업회원 처리 파라미터 commemVo={},email3={}"
				,commemVo,email3);
		return null;
	}
	
}
