package com.algoo.app.apply.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.algoo.app.apply.model.ApplyVO;

@Controller
@RequestMapping("/apply")
public class ApplyController {
	
	@RequestMapping(value="/apply.ag", method=RequestMethod.GET)
	public void apply_get(){
		
	}
	
	@RequestMapping(value="/apply.ag", method=RequestMethod.POST)
	public String apply_post(
			@ModelAttribute ApplyVO applyVo){
		
		return "";
	}
}
