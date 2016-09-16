package com.algoo.app.company.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.algoo.app.commem.model.CommemService;
import com.algoo.app.commem.model.CommemVO;
import com.algoo.app.company.model.CompanyService;
import com.algoo.app.company.model.CompanyVO;

@Controller
@RequestMapping("/company")
public class CompanyController {
	private static final Logger logger
	= LoggerFactory.getLogger(CompanyController.class);
	
	@Autowired
	private CompanyService companyService;
	
	@Autowired
	private CommemService commemService;
	
	@RequestMapping(value="/compRegister.ag", method=RequestMethod.GET)
	public String companyRegister_get(HttpSession session,Model model){
		
		String userid=(String)session.getAttribute("userid");
		CompanyVO companyVo = companyService.selectCompanyByUserid(userid);
		
		model.addAttribute("companyVo", companyVo);
		
		return "company/compRegister";
	}
	
	@RequestMapping(value="/compRegister.ag", method=RequestMethod.POST)
	public String companyRegister_post(@ModelAttribute CompanyVO companyVo,
			@RequestParam(required=false) String email3, HttpSession session){
		
		logger.info("회사등록 파라미터 companyVo={}", companyVo);
		
		String hp2=companyVo.getHp2();
		String hp3=companyVo.getHp3();
		if(hp2==null || hp2.isEmpty() ||hp3==null ||hp3.isEmpty()){
			companyVo.setFax1("");
			companyVo.setFax2("");
			companyVo.setFax3("");
		}
		
		String fax2=companyVo.getFax2();
		String fax3=companyVo.getFax3();
		if(fax2==null || fax2.isEmpty() ||fax3==null ||fax3.isEmpty()){
			companyVo.setFax1("");
			companyVo.setFax2("");
			companyVo.setFax3("");
		}
		
		String phone2=companyVo.getPhone2();
		String phone3=companyVo.getPhone3();
		
		if(phone2==null || phone2.isEmpty() ||phone3==null ||phone3.isEmpty()){
			companyVo.setPhone1("");
			companyVo.setPhone2("");
			companyVo.setPhone3("");
		}
		
		String email1 = companyVo.getEmail1();
		String email2 = companyVo.getEmail2();
		
		if(email1==null || email1.isEmpty()){
			companyVo.setEmail1("");
			companyVo.setEmail2("");
		}else{
			if(email2.equals("etc")){
				if(email3!=null && !email3.isEmpty()){
					companyVo.setEmail2(email3);
				}else{
					companyVo.setEmail1("");
					companyVo.setEmail2("");
				}
			}
		}
		int result = companyService.insertCompany(companyVo);
		logger.info("회사등록 처리결과, companyVo={}, result={}", companyVo , result);
		
		String userid=(String)session.getAttribute("userid");
		CommemVO commemVo 
			= commemService.selectMemberByUserid(userid);
		
		commemVo.setCompCode(companyVo.getCompCode());
		
		result=commemService.updateCompCode(commemVo);
		logger.info("기업회원 코드업데이트 처리 result={}", result);
		
		return "redirect:/company/compRegister.ag";
	}
	
}
