package com.algoo.app.freeboard.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.algoo.app.freeboard.model.FreeboardService;
import com.algoo.app.freeboard.model.FreeboardVO;

@Controller
@RequestMapping("/freeboard")
public class FreeboardController {
	private static final Logger logger
	=LoggerFactory.getLogger(FreeboardController.class);
	
	@Autowired
	private FreeboardService freeService;
	
	@RequestMapping(value="/write.ag", method=RequestMethod.GET)
	public String freeWrite_get(){
		logger.info("freeboard 글 쓰기 화면 보여주기");
		
		return "freeboard/write";
	}
	
	@RequestMapping(value="/write.ag", method=RequestMethod.POST)
	public String freeWrite_post(@ModelAttribute FreeboardVO freeVo){
		logger.info("freeboard 글 쓰기, 파라미터 freeVo = {}", freeVo);
		
		int cnt=freeService.insertFreeboard(freeVo);
		logger.info("freeboard 글 쓰기 결과 cnt = {}", cnt);
		
		return "redirect:/freeboard/list.ag";
	}
}
