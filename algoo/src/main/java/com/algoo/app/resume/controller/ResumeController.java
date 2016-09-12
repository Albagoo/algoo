package com.algoo.app.resume.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.algoo.app.resume.model.ResumeService;
import com.algoo.app.resume.model.ResumeVO;

@Controller
@RequestMapping("/resume")
public class ResumeController {
	private static final Logger logger
		= LoggerFactory.getLogger(ResumeController.class);
	
	@Autowired
	private ResumeService resumeService;
	
	@RequestMapping(value="/write.ag", method=RequestMethod.GET)
	public String resumeWrite_get(){
		logger.info("resumeWrite_get()핸들러 진입");
		
		return "resume/write";
	}
	
	@RequestMapping(value="/imageUp.ag", method=RequestMethod.GET)
	public void imageUp_get(){
		
	}
	
	@RequestMapping(value="/write.ag", method=RequestMethod.POST)
	public String resumeWrite_post(
			@ModelAttribute ResumeVO resumeVo){
		logger.info("resumeWrite_post()핸들러 진입, 파라미터 resumeVo = {}"
				, resumeVo);
		
		int cnt = resumeService.insertResume(resumeVo);
		logger.info("이력서 입력 결과 cnt = {}", cnt);
		
		return "redirect:/home.ag";
	}
}
