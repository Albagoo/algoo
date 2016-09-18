package com.algoo.app.register.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller	
public class JoinController {
	
	@RequestMapping("/jj/join.ag")
	public String join() {
		
		return "jj/join";
	}
	
}
