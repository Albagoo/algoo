package com.algoo.app.admin.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

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
	
	@RequestMapping(value = "/memberExcel.ag")
	public String excelTransform(Map<String, Object> ModelMap) throws Exception {
		List<MemberVO> excelList = amService.selectAll();
		
		ModelMap.put("excelList", excelList);
		
		return "excelView";
	}
	
	@RequestMapping(value = "/compExcelUpload.ag")
	public String excelUpload(MultipartHttpServletRequest req){
		
		//엑셀 파일이 xls일때와 xlsx일때 서비스 라우팅
		String excelType = req.getParameter("excelType");
		
		if(excelType.equals("xlsx")){
			amService.xlsxExcelReader(req);
		}else if(excelType.equals("xls")){
			amService.xlsExcelReader(req);
		}
		
		return "admin/adminMember";
	}
	


}
