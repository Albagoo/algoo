package com.algoo.app.notice.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.log4j.chainsaw.Main;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.algoo.app.notice.model.NoticeService;
import com.algoo.app.notice.model.NoticeVO;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	private static final Logger logger
	=LoggerFactory.getLogger(NoticeController.class);
	
	@Autowired
	private NoticeService noticeService;
	
	@RequestMapping(value="/write.ag", method=RequestMethod.GET)
	public String write_get(){
		//1-1) 공지 등록 화면
		logger.info("공지 등록 화면");
		return "write";
	}
	
	@RequestMapping(value="/write.ag", method=RequestMethod.POST)
	public String write_post(@ModelAttribute NoticeVO noticeVo){
		//1-2) 공지 등록 처리
		//1. parameter loading
		logger.info("공지 등록 처리");
		
		//2. db process
		int cnt = noticeService.insertNotice(noticeVo);
		logger.info("공지 등록 결과, cnt={}", cnt);
		
		//3. result return
		return "redirect:/list.ag";
	}
	
	@RequestMapping("/list.ag")
	public String listNotice(
			@ModelAttribute NoticeVO noticeVo,
			Model model){
		//2) 공지 리스트
		//1. parameter
		logger.info("공지 리스트 조회, 파라미터 noticeVo={}", noticeVo);
		
		//2. db process
		List<NoticeVO> alist = noticeService.selectAll(noticeVo);
		
		//3. result return
		return "list";
	}
	
	@RequestMapping("/detail.ag")
	public String detailNotice(
			@RequestParam(defaultValue="0") int mainNo,
			Model model){
		//3) 공지 상세
		//1. parameter
		logger.info("공지 상세, 파라미터 mainNo={}", mainNo);
		
		//wrong parameter
		
		//2. db process
		NoticeVO noticeVo = noticeService.selectByNo(mainNo);
		
		//3. result return
		model.addAttribute("noticeVo", noticeVo);
		
		return "detail";
	}
	
	@RequestMapping(value="/edit.ag", 
			method=RequestMethod.GET)
	public String noticeEdit_get(@RequestParam(defaultValue="0")
			int mainNo,
			Model model){
		//4-1) 공지 수정 화면
		//1. parameter
		logger.info("공지 수정 화면, 파라미터 mainNo={}", mainNo);
		
		//2. db process
		NoticeVO noticeVo = noticeService.selectByNo(mainNo);
		
		
		//3. result return
		model.addAttribute("noticeVo", noticeVo);
		return "edit";
	}
	
	@RequestMapping(value="/edit.ag", 
			method=RequestMethod.POST)
	public String edit_post(@ModelAttribute NoticeVO noticeVo,
			Model model){
		//4-2) 공지 수정 처리
		//1. parameter
		logger.info("공지 수정 처리, 파라미터 noticeVo={}",
				noticeVo);
		
		//2. db process
		String msg="", url="edit.ag?no="+noticeVo.getMainNo();
		int cnt=noticeService.updateNotice(noticeVo);
		logger.info("공지 수정 결과, cnt={}", cnt);
		
		if(cnt>0){
			msg="공지 수정 성공";
			url="/board/detail.do?no="+noticeVo.getMainNo();
		}else{
			msg="공지 수정 실패";
		}
		
		//3. result return
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "detail";
	}
	
	@RequestMapping(value="/delete.ag",
			method=RequestMethod.POST)
	public String delete_post(
			@RequestParam(defaultValue="0") int mainNo,
			Main main){
		//5) 공지 삭제
		//1. parameter
		logger.info("공지 삭제 파라미터 mainNo={}", mainNo);
		
		//2. db process
		noticeService.deleteNotice(mainNo);
		
		//3. result return
		return "redirect:/list.ag";
	}
}