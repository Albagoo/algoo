package com.algoo.app.admin.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.algoo.app.admin.model.AdminMemberService;
import com.algoo.app.admin.model.Utility;
import com.algoo.app.common.PaginationInfo;
import com.algoo.app.common.SearchVO;
import com.algoo.app.member.model.MemberVO;


@Controller
public class AdminMemberController {
	private final static Logger logger 
	  = LoggerFactory.getLogger(AdminMemberController.class);
	
	@Autowired
	private AdminMemberService amService;
	
	@RequestMapping("/admin/adminMember.ag")
	public String adminMem(@ModelAttribute SearchVO searchVo,
						Model model){
		//1.
		logger.info("회원관리 조회 페이지, 파라미터 SearchVo={}",searchVo);
		
		int RCPP =searchVo.getRecordCountPerPage();
		if(RCPP<0){
			RCPP=Utility.RECORD_COUNT_PER_PAGE;
		}
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(RCPP);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setBlockSize(Utility.BLOCK_SIZE);
		searchVo.setRecordCountPerPage(RCPP);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		//2.
		
		List<MemberVO> alist = new ArrayList<MemberVO>();
		
		
			alist= amService.selectMemberList(searchVo);
		logger.info("회원 관리 목록 조회 결과, alist.size={}",alist.size());
	
		
		
		int totalRecord
		=amService.selectMemberCount(searchVo);
		
		
		pagingInfo.setTotalRecord(totalRecord);
		
		//3.
		model.addAttribute("alist", alist);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "admin/adminMember";
	}
}
