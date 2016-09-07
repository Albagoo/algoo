package com.algoo.app.faq.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.algoo.app.common.PaginationInfo;
import com.algoo.app.common.SearchVO;
import com.algoo.app.faq.model.FaqService;
import com.algoo.app.faq.model.FaqVO;

@Controller
@RequestMapping("/faq")
public class FaqController {
	private static final Logger logger
	=LoggerFactory.getLogger(FaqController.class);
	
	@Autowired
	private FaqService faqService;
		
	@RequestMapping(value="/faqWrite.ag", method=RequestMethod.GET)
	public String write_get(){
		logger.info("FAQ 쓰기 화면 보여주기");
				
		return "faq/faqWrite";
	}
	
	@RequestMapping(value="/faqWrite.ag", method=RequestMethod.POST)
	public String write_post(@ModelAttribute FaqVO faqVo){
		logger.info("FAQ 쓰기 처리, 파라미터 faqVo = {}", faqVo);
		
		int cnt = faqService.WriteFaq(faqVo);
		logger.info("글쓰기 결과 cnt = {}", cnt);
	
		return "redirect:/faq/faqList.ag";
	}
	
	@RequestMapping("/faqList.ag")
	public String listFaq(@ModelAttribute SearchVO searchVo, Model model){
		logger.info("FAQ 목록 조회, 파라미터 searchVo = {}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setRecordCountPerPage(20);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setBlockSize(pagingInfo.getBlockSize());
		searchVo.setRecordCountPerPage(pagingInfo.getRecordCountPerPage());
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
				
		List<FaqVO> alist = faqService.selectAllFaq(searchVo);
		logger.info("FAQ 목록 조회 결과 alist.size()={}", alist.size());
		
		int totalRecord=faqService.selectTotalCount(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
				
		model.addAttribute("alist", alist);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "faq/faqList";
	}
	
	@RequestMapping("/faqDetail.ag")
	public String detail(@RequestParam(defaultValue="0") int faqNo, Model model){
		logger.info("FAQ 답변보기, 파라미터 faqNo = {}", faqNo);
		
		if(faqNo==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/faq/faqList.ag");
			
			return "common/message";
		}
		
		FaqVO faqVo=faqService.selectByNo(faqNo);
		logger.info("FAQ 답변보기 결과, faqVo={}", faqVo);
		
		model.addAttribute("faqVo", faqVo);
		
		return "faq/faqDetail";
	}
	
	@RequestMapping("/updateCount.ag")
	public String updateCount(@RequestParam(defaultValue="0") int faqNo, Model model){
		logger.info("FAQ 조회수 증가, 파라미터 faqNo = {}", faqNo);
		
		if(faqNo==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/faq/faqList.ag");
			
			return "common/message";
		}
		
		int cnt=faqService.updateReadCount(faqNo);
		logger.info("FAQ 조회수 증가 결과, cnt = {}", cnt);

		return "redirect:/faq/faqDetail.ag?faqNo="+faqNo;
	}
	
	@RequestMapping(value="/faqEdit.ag", method=RequestMethod.GET)
	public String edit_get(@RequestParam(defaultValue="0") int faqNo, Model model){
		logger.info("FAQ 수정화면 보여주기, 파라미터 faqNo = {}", faqNo);
	
		if(faqNo==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/faq/faqList.ag");
			
			return "common/message";
		}
				
		FaqVO faqVo = faqService.selectByNo(faqNo);
		logger.info("FAQ 조회 결과, faqVo = {}", faqVo);
		
		model.addAttribute("faqVo", faqVo);
		return "faq/faqEdit";
	}
	
	@RequestMapping(value="/faqEdit.ag", method=RequestMethod.POST)
	public String edit_post(@ModelAttribute FaqVO faqVo, Model model){
		logger.info("FAQ 수정, 파라미터 faqVo = {}", faqVo);
		
		String msg="", url="/faq/faqEdit.ag?faqNo="+faqVo.getFaqNo();
		int cnt=faqService.updateFaq(faqVo);

		if(cnt>0){
			msg="FAQ 수정 성공";
			logger.info("FAQ 수정 결과, cnt = {}", cnt);
				
			url="/faq/faqDetail.ag?faqNo="+faqVo.getFaqNo();
		}else{
			msg="글 수정 실패";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/faqDelete.ag", method=RequestMethod.GET)
	public String delete_get(@RequestParam(defaultValue="0") int faqNo, Model model){
		logger.info("FAQ 삭제 화면 보여주기, 파라미터 faqNo = {}", faqNo);
		
		if(faqNo==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/faq/faqList.ag");
			
			return "common/message";
		}
		
		return "faq/faqDelete";
	}
	
	@RequestMapping(value="/faqDelete.ag", method=RequestMethod.POST)
	public String delete_post(@RequestParam(defaultValue="0") int faqNo, Model model){
		logger.info("FAQ 삭제 , 파라미터 faqNo = {}", faqNo);
		
		int cnt=faqService.deleteFaq(faqNo);
		logger.info("글삭제 결과, cnt = {}", cnt);
			
		return "redirect:/faq/faqList.ag";
	}
	
	@RequestMapping(value="/faqUserList.ag")
	public String userList(@ModelAttribute SearchVO searchVo, Model model){
		logger.info("FAQ UserList 조회, 파라미터 searchVo = {}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setRecordCountPerPage(20);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setBlockSize(pagingInfo.getBlockSize());
		searchVo.setRecordCountPerPage(pagingInfo.getRecordCountPerPage());
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
				
		List<FaqVO> ulist = faqService.selectUserFaq(searchVo);
		logger.info("FAQ UserList 조회 결과 ulist.size()={}", ulist.size());
		
		int totalRecord=faqService.selectTotalCount(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
				
		model.addAttribute("ulist", ulist);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "faq/faqUserList";
	}
}