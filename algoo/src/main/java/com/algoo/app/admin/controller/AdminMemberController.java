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
import org.springframework.web.bind.annotation.RequestParam;

import com.algoo.app.admin.model.AdminMemberService;
import com.algoo.app.admin.model.Utility;
import com.algoo.app.common.PaginationInfo;
import com.algoo.app.common.SearchVO;
import com.algoo.app.member.model.MemberVO;


@Controller
@RequestMapping("/admin")
public class AdminMemberController {
	private final static Logger logger 
	  = LoggerFactory.getLogger(AdminMemberController.class);
	
	@Autowired
	private AdminMemberService amService;
	
	@RequestMapping("/adminMember.ag")
	public String adminMem(@ModelAttribute SearchVO searchVo,
		@RequestParam(required=false) String userid,
		@RequestParam(required=false) String eidth,		
		Model model){
		//1.
		logger.info("회원관리 조회 페이지, 파라미터 SearchVo={}",searchVo);
		
		int RCPP =searchVo.getRecordCountPerPage();
		if(RCPP<1){
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
		
		String user=userid;
		
		//3.
		model.addAttribute("alist", alist);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("user", user);
		model.addAttribute("ei", eidth);
		return "admin/adminMember";
	}
	
	@RequestMapping("/adminMemberDelete.ag")
	public String adminMemberDelete(@RequestParam String userid,
			Model model){
		//1
		logger.info("회원삭제 파라미터 userid={}",userid);
				
		//2.
		String msg="", url="/admin/adminMember.ag";
		int cnt=amService.deleteMem(userid);
		
		if(cnt>0){
			msg="회원 삭제 완료";
			logger.info("userid삭제 결과 cnt={}",cnt);
		}else{
			msg="회원 삭제 실패";
		}
		
		//3. 
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/adminMemEdit.ag")
	public String adminMemEdit( 
			@ModelAttribute MemberVO memberVo, 
			@RequestParam String bi1, @RequestParam String bi2,
			@RequestParam String bi3,
			Model model){
		//http://localhost:9090/algoo/admin/adminMemEdit.ag?userid=giran6666
		//1. 
		logger.info("회원 삭제 파라미터memberVo={}", memberVo);
		
		//2.
		String msg="", url="/admin/adminMember.ag";
		
		String birth=bi1+"-"+bi2+"-"+bi3;
		memberVo.setBirth(birth);
		
		int cnt=amService.updateMem(memberVo);
		
		if(cnt>0){
			msg="회원 정보 수정 되었습니다";
			logger.info("memberVo={}",memberVo);
		}else{
			msg="회원 정보 수정 실패";
		}
		
		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
