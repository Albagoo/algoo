/*//package com.algoo.app.notice.controller;
//
//import org.slf4j.Logger;
//import org.slf4j.LoggerFactory;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.ModelAttribute;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//
//import com.algoo.app.notice.model.NoticeService;
//import com.algoo.app.notice.model.NoticeVO;
//
//@Controller
//public class NoticeController {
//	private static final Logger logger
//	=LoggerFactory.getLogger(NoticeController.class);
//	
//	@Autowired
//	private NoticeService noticeService;
//	
//	@RequestMapping(value="/notice/write.ag", method=RequestMethod.GET)
//	public String write_get(){
//		//1-1) 공지 등록 화면
//		logger.info("공지 등록 화면 보여주기");
//		return "notice/write";
//	}
//	
//	@RequestMapping(value="/notice/write.ag", method=RequestMethod.POST)
//	public String write_post(@ModelAttribute NoticeVO noticeVo){
//		//1-2) 공지 등록 처리
//		//1. parameter
//		logger.info("공지 등록 처리");
//		
//		//2. db
//		int cnt = noticeService.insertNotice(noticeVo);
//		logger.info("공지 등록 결과, cnt={}", cnt);
//		
//		//3. result
//		return "notice/list";
//	}
//}*/