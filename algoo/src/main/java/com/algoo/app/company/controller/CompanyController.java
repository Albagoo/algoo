package com.algoo.app.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.algoo.app.company.model.CompanyService;

@Controller
@RequestMapping("/company")
public class CompanyController {

	@Autowired
	private CompanyService companyService;
	
	@RequestMapping("/compRegister.ag")
	public String companyRegister_get(){
		
		return "company/compRegister";
	}
	
}
