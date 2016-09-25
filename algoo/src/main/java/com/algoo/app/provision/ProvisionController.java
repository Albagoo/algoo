package com.algoo.app.provision;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.algoo.app.member.controller.LoginController;

@Controller
@RequestMapping("/provision")
public class ProvisionController {
	private static final Logger logger=LoggerFactory.getLogger(LoginController.class);
	
	@RequestMapping("/pProvision.ag")
	public String PProv(){
		//1.
		logger.info("개인회원약관 보여주기");
		
		return "provision/pprovision";
	}

	@RequestMapping("/cProvision.ag")
	public String CProv(){
		//1.
		logger.info("기업회원약관 보여주기");
		
		return "provision/cprovision";
	}
	
	@RequestMapping("/lProvision.ag")
	public String LProv(){
		//1.
		logger.info("기업회원약관 보여주기");
		
		return "provision/lprovision";
	}
	
	@RequestMapping("/privacy.ag")
	public String privacy(){
		//1.
		logger.info("개인정보처리방침 보여주기");
		
		return "provision/privacy";
	}
	@RequestMapping("/compinfo.ag")
	public String compInfo(){
		//1.
		logger.info("회사소개 보여주기");
		
		return "provision/compinfo";
	}
}