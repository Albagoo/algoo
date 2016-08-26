package com.algoo.app.faq.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.algoo.app.faq.model.FaqService;
import com.algoo.app.faq.model.FaqVO;

@Controller
@RequestMapping("/faq/")
public class FaqController {
	private static final Logger logger
	=LoggerFactory.getLogger(FaqController.class);
	
	@Autowired
	private FaqService faqService;
	
	@RequestMapping(value="faqWrite.ag", method=RequestMethod.GET)
	public String WriteFaq_get(){
		logger.info("FAQ 쓰기 화면 보여주기");
		
		return "faq/faqWrite";
	}
	
	@RequestMapping(value="faqWrite.ag", method=RequestMethod.POST)
	public String WriteFaq_post(@ModelAttribute FaqVO faqVo){
		logger.info("FAQ 쓰기, 파라미터 faqVo = {}", faqVo);
		
		int cnt=faqService.WriteFaq(faqVo);
		logger.info("FAQ 쓰기 결과 cnt = {}", cnt);
		
		
		return "redirect:/faq/faqList.ag";
	}
	
	@RequestMapping(value="faqList.ag")
	public String ListFaq(){
		
		return "";
	}
}