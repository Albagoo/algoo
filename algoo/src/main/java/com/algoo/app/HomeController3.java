package com.algoo.app;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController3 {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController3.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/member_comp/memberInfo.ag", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		return "member_comp/memberInfo";
	}
	
}
