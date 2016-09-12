package com.algoo.app.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/login")
public class LoginController2 {
	
	@RequestMapping("/login.ag")
	public String Login(){
		
		return "login/login";
	}

}
