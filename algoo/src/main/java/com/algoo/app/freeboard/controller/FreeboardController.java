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
		logger.info("글목록 조회, 파라미터 searchVo={}", searchVo);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setRecordCountPerPage(20);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setBlockSize(pagingInfo.getBlockSize());
		searchVo.setRecordCountPerPage(pagingInfo.getRecordCountPerPage());
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
				
		List<FreeboardVO> alist = freeService.selectAllFreeboard(searchVo);
		logger.info("글목록 조회 결과 alist.size()={}", alist.size());
		
		int totalRecord=freeService.selectTotalCount(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
				
		model.addAttribute("freeList", alist);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "freeboard/list";
	}
}
