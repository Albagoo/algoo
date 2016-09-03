package com.algoo.app.company.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.algoo.app.company.model.CompanyService;

@Controller
public class CompanyController {

	@Autowired
	private CompanyService companyService;
	
	public String companySelectAll(){
		
		
		return null;
	}
	
}
