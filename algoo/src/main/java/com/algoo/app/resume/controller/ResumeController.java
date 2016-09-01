package com.algoo.app.resume.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
