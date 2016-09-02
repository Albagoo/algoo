package com.algoo.app.rec.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.algoo.app.company.model.CompanyVO;
import com.algoo.app.rec.model.RecService;
import com.algoo.app.rec.model.RecVO;
import com.algoo.app.service.model.ServiceVO;

@Controller
@RequestMapping("/rec")
public class RecController {

	public static final Logger logger
		=LoggerFactory.getLogger(RecController.class);
	
	@Autowired
	private RecService recService;
	
	@RequestMapping("/recDetail.ag")
	public String recDetail(@RequestParam int recCode,
			Model model){
		//채용화면 보여주기
		//1
		logger.info("채용 화면 보여주기 recCode={}",recCode);
		//2
		RecVO recVo
		=recService.selectRecByCode(recCode);
		logger.info("상세보기조회결과 recCode={}",recVo);
		//회사정보 불러오기
		CompanyVO compVo
		=recService.selectCompanyByCode(recVo.getCompCode());
		logger.info("compVo={}",compVo);
		//서비스정보 불러오기
		ServiceVO serviceVo
		=recService.selectServiceByCode(recVo.getServiceCode());
		logger.info("serviceVo",serviceVo);
		
		//3
		model.addAttribute("recVo", recVo);
		model.addAttribute("compVo", compVo);
		model.addAttribute("serviceVo", serviceVo);
		return "rec/recDetail";
	}
	
	@RequestMapping(value="/recWrite.ag",
			method=RequestMethod.GET)
	public String recWrite_get(){
		//채용공고 입력창 보여주기
		//1
		logger.info("채용공고 입력창 보여주기");
		//2
		//3
		return "rec/recWrite";
	}
	
	@RequestMapping(value="/recWrite.ag",
			method=RequestMethod.POST)
	public String recWrite_post(){
		//채용공고 입력 하 보여주기
		//1
		logger.info("채용공고 입력창 보여주기");
		//2
		//3
		return "rec/recWrite";		
	}
	
}
