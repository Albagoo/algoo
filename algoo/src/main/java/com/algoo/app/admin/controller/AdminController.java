package com.algoo.app.admin.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.algoo.app.common.PaginationInfo;
import com.algoo.app.common.SearchVO;
import com.algoo.app.faq.model.FaqService;
import com.algoo.app.faq.model.FaqVO;
import com.algoo.app.freeboard.model.FreeboardService;
import com.algoo.app.freeboard.model.FreeboardVO;
import com.algoo.app.notice.model.NoticeService;
import com.algoo.app.notice.model.NoticeVO;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	private static final Logger logger
		= LoggerFactory.getLogger(AdminController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	@Autowired
	private FaqService faqService;
	
	@Autowired
	private FreeboardService freeService;
	
	@RequestMapping("/adminIndex.ag")
	public String adminIndex(){
		logger.info("관리자 홈페이지 보여주기");
		
		return "admin/adminIndex";
	}
	
	@RequestMapping("/adminBoard.ag")
	public String adminBoardList(Model model, @RequestParam(defaultValue="0") int nco){
		logger.info("관리자페이지 게시판 리스트");
		
		List<NoticeVO> nlist=noticeService.selectAll();
		logger.info("관리자페이지 공지사항 리스트 nlist = {}", nlist);
		
		List<FaqVO> flist=faqService.selectAll();
		logger.info("관리자페이지 FAQ 리스트 flist = {}", flist);
		
		List<FreeboardVO> tlist=freeService.selectAll();
		logger.info("관리자페이지 알바톡톡 리스트 tlist = {}", tlist);
		
		model.addAttribute("nlist", nlist);
		model.addAttribute("flist", flist);
		model.addAttribute("tlist", tlist);
		
		return "admin/adminBoard";
		
	}
}