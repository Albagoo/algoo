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

import com.algoo.app.faq.model.FaqListVO;
import com.algoo.app.faq.model.FaqService;
import com.algoo.app.faq.model.FaqVO;
import com.algoo.app.freeboard.model.FreeboardService;
import com.algoo.app.freeboard.model.FreeboardVO;
import com.algoo.app.notice.model.NoticeListVO;
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
	public String adminBoardList(Model model, @RequestParam(defaultValue="0") String nco){
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
	
	@RequestMapping("/selectFaqDelete.ag")
	public String selectFaqDelete(@ModelAttribute FaqListVO fListVo, Model model){
		//선택한 상품 삭제
		//1.
		logger.info("선택한 FAQ 삭제, 파라미터 fListVo = {}", fListVo);
		List<FaqVO> fList = fListVo.getFaqList();
		
		logger.info("fList.size() = {}", fList.size());
		
		//2.
		int cnt=faqService.selectDelete(fList);
		logger.info("선택한 FAQ 삭제 처리 결과, cnt = {}", cnt);
		
		String msg="", url="/admin/adminBoard.ag";
		
		if(cnt>0){
			for(int i=0;i<fList.size();i++){
				FaqVO faqVo=fList.get(i);
				
				int faqNo=faqVo.getFaqNo();

				logger.info("i = {}, mainNo = {}", i, faqNo);
			}//for
			msg="선택한 FAQ 삭제 성공";
		}else{
			msg="선택한 FAQ 삭제 실패";
		}//if
		
		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/selectNoticeDelete.ag")
	public String selectNoticeDelete(@ModelAttribute NoticeListVO nListVo, Model model){
		//선택한 상품 삭제
		//1.
		logger.info("선택한 공지사항 삭제, 파라미터 nListVo = {}", nListVo);
		List<NoticeVO> nList = nListVo.getNoticeList();
		
		logger.info("nList.size() = {}", nList.size());
		
		//2.
		int cnt=noticeService.deleteSelectNotice(nList);
		logger.info("선택한 공지사항 삭제 처리 결과, cnt = {}", cnt);
		
		String msg="", url="/admin/adminBoard.ag";
		
		if(cnt>0){
			for(int i=0;i<nList.size();i++){
				NoticeVO noticeVo=nList.get(i);
				
				int mainNo=noticeVo.getMainNo();

				logger.info("i = {}, mainNo = {}", i, mainNo);
			}//for
			msg="선택한 공지사항 삭제 성공";
		}else{
			msg="선택한 공지사항 삭제 실패";
		}//if
		
		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}