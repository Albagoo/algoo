package com.algoo.app.commem.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.algoo.app.commem.model.CommemService;
import com.algoo.app.commem.model.CommemVO;

@Controller
@RequestMapping("/member_comp")
public class CommemController {
	private static final Logger logger
		= LoggerFactory.getLogger(CommemController.class);
	
	@Autowired
	private CommemService commemService;
	
	//회원가입화면 창띄우기
	@RequestMapping("/register.ag")
	public String showRegister(){
		
		return "member_comp/register";
	}
	
	//기업회원 - insert
	@RequestMapping("/memberAdd.ag")
	public String memberAdd(@ModelAttribute CommemVO commemVo,
			@RequestParam String email3){
		
		logger.info("기업회원 처리 파라미터 commemVo={},email3={}"
				,commemVo,email3);
		
		String fax2=commemVo.getFax2();
		String fax3=commemVo.getFax3();
		if(fax2==null || fax2.isEmpty() ||fax3==null ||fax3.isEmpty()){
			commemVo.setFax1("");
			commemVo.setFax2("");
			commemVo.setFax3("");
		}
		
		String phone2=commemVo.getPhone2();
		String phone3=commemVo.getPhone3();
		
		if(phone2==null || phone2.isEmpty() ||phone3==null ||phone3.isEmpty()){
			commemVo.setPhone1("");
			commemVo.setPhone2("");
			commemVo.setPhone3("");
		}
		
		String email1 = commemVo.getEmail1();
		String email2 = commemVo.getEmail2();
		if(email1==null || email1.isEmpty()){
			commemVo.setEmail1("");
			commemVo.setEmail2("");
		}else{
			if(email2.equals("etc")){
				if(email3!=null && !email3.isEmpty()){
					commemVo.setEmail2(email3);
				}else{
					commemVo.setEmail1("");
					commemVo.setEmail2("");
				}
			}
		}
		
		int result = commemService.insertCompMember(commemVo);
		logger.info("기업회원가입 처리, result={}",result);
		
		return "/index.ag";
	}
	
}
