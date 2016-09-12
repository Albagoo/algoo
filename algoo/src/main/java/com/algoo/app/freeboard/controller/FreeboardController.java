package com.algoo.app.freeboard.controller;

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
import com.algoo.app.freeboard.model.FreeboardService;
import com.algoo.app.freeboard.model.FreeboardVO;


@Controller
@RequestMapping("/freeboard")
public class FreeboardController {
	private static final Logger logger
	=LoggerFactory.getLogger(FreeboardController.class);
	
	@Autowired
	private FreeboardService freeService;
	
	@RequestMapping(value="/write.ag", method=RequestMethod.GET)
	public String freeWrite_get(){
		logger.info("freeboard 글 쓰기 화면 보여주기");
		
		return "freeboard/write";
	}
	
	@RequestMapping(value="/write.ag", method=RequestMethod.POST)
	public String freeWrite_post(@ModelAttribute FreeboardVO freeVo){
		logger.info("freeboard 글 쓰기, 파라미터 freeVo = {}", freeVo);
		
		int cnt=freeService.insertFreeboard(freeVo);
		logger.info("freeboard 글 쓰기 결과 cnt = {}", cnt);
		
		return "redirect:/freeboard/list.ag";
	}
	
	@RequestMapping("/list.ag")
	public String listReBoard(@ModelAttribute SearchVO searchVo, Model model){
		logger.info("freeboard 목록 조회, 파라미터 searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setRecordCountPerPage(20);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setBlockSize(pagingInfo.getBlockSize());
		searchVo.setRecordCountPerPage(pagingInfo.getRecordCountPerPage());
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
				
		List<FreeboardVO> alist = freeService.selectAllFreeboard(searchVo);
		logger.info("freeboard 목록 조회 결과 alist.size()={}", alist.size());
		
		int totalRecord=freeService.selectTotalCount(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
				
		model.addAttribute("freeList", alist);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "freeboard/list";
	}
	
	@RequestMapping("/updateCount.ag")
	public String updateCount(
		@RequestParam(defaultValue="0") int freeNo, Model model){
		
		logger.info("freeboard 조회수 증가, 파라미터 freeNo={}", freeNo);
		
		if(freeNo==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/freeboard/list.ag");
			
			return "common/message";
		}
				
		int cnt=freeService.updateReadCount(freeNo);
		logger.info("freeboard 조회수 증가 결과, cnt={}", cnt);
		
		return "redirect:/freeboard/detail.ag?freeNo="+freeNo;
	}
	
	@RequestMapping("/detail.ag")
	public String detail(
			@RequestParam(defaultValue="0") int freeNo,
			Model model){
		logger.info("freeboard 상세보기 파라미터, freeNo = {}", freeNo);
		
		if(freeNo==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/freeboard/list.ag");
			
			return "common/message";
		}
		
		FreeboardVO freeVo = freeService.selectFreeboardByNo(freeNo);
		logger.info("freeboard 상세보기 결과 freeVo = {}", freeVo);
		model.addAttribute("freeVo", freeVo);
		
		return "freeboard/detail";
	}
	
	@RequestMapping(value="/edit.ag", method=RequestMethod.GET)
	public String edit_get(	@RequestParam(defaultValue="0") int freeNo, Model model){
		logger.info("freeboard 수정화면 보여주기 파라미터, freeNo = {}", freeNo);
		
		FreeboardVO freeVo = freeService.selectFreeboardByNo(freeNo);
		model.addAttribute("freeVo", freeVo);
		
		return "freeboard/edit";
	}
	
	@RequestMapping(value="/edit.ag", method=RequestMethod.POST)
	public String edit_post(@ModelAttribute FreeboardVO freeVo, Model model){
		logger.info("freeboard 수정, 파라미터 freeVo = {}", freeVo);
		
		String msg="", url="/freeboard/edit.ag?freeNo="+freeVo.getFreeNo();
		int cnt=freeService.editFreeboard(freeVo);

		if(cnt>0){
			msg="freeboard 수정 성공";
			logger.info("freeboard 수정 결과, cnt = {}", cnt);
				
			url="/freeboard/detail.ag?freeNo="+freeVo.getFreeNo();
		}else{
			msg="freeboard 수정 실패";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/delete.ag")
	public String delete(@RequestParam(defaultValue="0") int freeNo, Model model){
		logger.info("Freeboard 삭제 , 파라미터 freeNo = {}", freeNo);
		
		int cnt=freeService.deleteFreeboard(freeNo);
		logger.info("글삭제 결과, cnt = {}", cnt);
			
		return "redirect:/freeboard/list.ag";
	}
}
