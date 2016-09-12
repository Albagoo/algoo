package com.algoo.app.resume.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/resume")
public class ResumeController {
	private static final Logger logger
		= LoggerFactory.getLogger(ResumeController.class);
	
	@RequestMapping("/write.ag")
	public String resumeWrite_get(){
		logger.info("resumeWrite_get()메서드 진입");
		
		return "resume/write";
	}
	
	@RequestMapping(value="/imageUp.ag", method=RequestMethod.GET)
	public void imageUp_get(){
		
	}
}
