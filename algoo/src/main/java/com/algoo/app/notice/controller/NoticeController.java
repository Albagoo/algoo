package com.algoo.app.notice.controller;

import java.util.ArrayList;
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
import com.algoo.app.notice.common.ListNoticeVO;
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
		
		return "notice/write";
	}
	
	@RequestMapping(value="/write.ag", method=RequestMethod.POST)
	public String write_post(@ModelAttribute NoticeVO noticeVo){
		//1-2) 공지 등록 처리
		//1. parameter loading
		logger.info("공지 등록 처리");
		
		//2. db process
		int cnt = noticeService.insertNotice(noticeVo);
		logger.info("공지 등록 결과, cnt={}", cnt);
		
		//3. result save
		return "redirect:list.ag";
	}
	
	@RequestMapping("/list.ag")
	public String listNotice(@ModelAttribute ListNoticeVO searchVo,
			@RequestParam(required=false) String categoryName, Model model){
		//2) 공지 리스트(전체)
		//1. parameter
		logger.info("공지 리스트 조회, 파라미터 noticeVo={}", searchVo);
		logger.info("카테고리 ={}",categoryName);

		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setRecordCountPerPage(20);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setBlockSize(pagingInfo.getBlockSize());
		searchVo.setRecordCountPerPage(pagingInfo.getRecordCountPerPage());
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		PaginationInfo onePage = new PaginationInfo();
		onePage.setBlockSize(1);
		onePage.setRecordCountPerPage(20);
		onePage.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setBlockSize(onePage.getBlockSize());
		searchVo.setRecordCountPerPage(onePage.getRecordCountPerPage());
		searchVo.setFirstRecordIndex(onePage.getFirstRecordIndex());
		
		//2. db process
		List<NoticeVO> alist = new ArrayList<NoticeVO>();
		
		//09-05
		searchVo.setCategory(categoryName);
		
		if(categoryName!=null && !categoryName.isEmpty()){
			alist=noticeService.searchCategory(searchVo);
			logger.info("공지사항 목록 조회 결과, alist.size()={}",
					alist.size());
		}else{
			alist=noticeService.selectByCategory(searchVo);
			logger.info("공지사항 목록 조회 결과, alist.size()={}",
					alist.size());
		}
		//record counting 08-31
		
		int totalRecord
		=noticeService.selectTotalCount(searchVo);
		logger.info("전체 레코드 개수 totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		onePage.setTotalRecord(totalRecord);
		
		model.addAttribute("noticeList", alist);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("onePage", onePage);
		
		logger.info("페이징인포={}",pagingInfo.getCurrentPage());
		
		return "notice/list";
	}
	
	@RequestMapping("/detail.ag")
	public String detailNotice(
			@RequestParam(defaultValue="0") int no,
			Model model){
		//4) 공지 상세
		//1. parameter
		logger.info("공지 상세, 파라미터 no={}", no);
		
		//wrong parameter
		if(no==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/notice/list.ag");
			
			return "common/message";
		}
		
		//2. db process
		NoticeVO noticeVo = noticeService.selectByNo(no);
		logger.info("공지 상세보기 결과 noticeVo={}", noticeVo);
		
		NoticeVO noticePreVo =noticeService.prevContent(no);
		logger.info("이전글 보기 결과 noticeVo = {}", noticePreVo);
		
		NoticeVO noticeNextVo =noticeService.nextContent(no);
		logger.info("다음글 보기 결과 noticeVo = {}", noticeNextVo);
		
		//3. result save
		model.addAttribute("noticeVo", noticeVo);
		model.addAttribute("preNoticeVo", noticePreVo);
		model.addAttribute("nextNoticeVo", noticeNextVo);
		
		return "notice/detail";
	}
	
	@RequestMapping(value="/edit.ag", 
			method=RequestMethod.GET)
	public String noticeEdit_get(@RequestParam(defaultValue="0")
			int no,
			Model model){
		//4-1) 공지 수정 화면
		//1. parameter
		logger.info("공지 수정 화면, 파라미터 no={}", no);
		
		//2. db process
		NoticeVO noticeVo = noticeService.selectByNo(no);
		
		//3. result return
		model.addAttribute("noticeVo", noticeVo);
		
		return "notice/edit";
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
		String msg="", url="/notice/edit.ag?no="+noticeVo.getMainNo();
		int cnt=noticeService.updateNotice(noticeVo);
		logger.info("공지 수정 결과, cnt={}", cnt);
		
		if(cnt>0){
			msg="공지 수정 성공";
			url="/notice/detail.ag?no="+noticeVo.getMainNo();
		}else{
			msg="공지 수정 실패";
		}
		
		//3. result return
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/delete.ag")
	public String deleteNotice(
			@RequestParam(defaultValue="0") int no,
			Model model){
		//5) 공지 삭제
		//1. parameter
		logger.info("공지 삭제 파라미터 no={}", no);
		
		//2. db process
		String msg="", url="";
		int cnt = noticeService.deleteNotice(no);
		if(cnt>0){
			msg="공지 삭제 성공";
			url="/notice/list.ag";
		}else{
			msg="공지 삭제 실패";
		}
		
		//3. result return
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/noticeAdminDelete.ag")
	public String noticeAdminDelete(@RequestParam(defaultValue="0") int no,	Model model){
		logger.info("관리자 공지 삭제 파라미터 no={}", no);
		
		String msg="", url="";
		int cnt = noticeService.deleteNotice(no);
		if(cnt>0){
			msg="공지 삭제 성공";
			url="/admin/adminBoard.ag";
		}else{
			msg="공지 삭제 실패";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/noticeUserList.ag")
	public String UserList(@ModelAttribute ListNoticeVO searchVo,
			@RequestParam(required=false) String categoryName, Model model){
		logger.info("회원 공지사항 리스트 조회, 파라미터 noticeVo={}", searchVo);
		logger.info("카테고리 = {}",categoryName);

		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setRecordCountPerPage(20);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setBlockSize(pagingInfo.getBlockSize());
		searchVo.setRecordCountPerPage(pagingInfo.getRecordCountPerPage());
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		
		PaginationInfo onePage = new PaginationInfo();
		onePage.setBlockSize(1);
		onePage.setRecordCountPerPage(20);
		onePage.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setBlockSize(onePage.getBlockSize());
		searchVo.setRecordCountPerPage(onePage.getRecordCountPerPage());
		searchVo.setFirstRecordIndex(onePage.getFirstRecordIndex());

		List<NoticeVO> alist = new ArrayList<NoticeVO>();
		
		searchVo.setCategory(categoryName);
		
		if(categoryName!=null && !categoryName.isEmpty()){
			alist=noticeService.searchCategory(searchVo);
			logger.info("회원 공지사항 목록 조회 결과, alist.size()={}",
					alist.size());
		}else{
			alist=noticeService.selectByCategory(searchVo);
			logger.info("회원 공지사항 목록 조회 결과, alist.size()={}",
					alist.size());
		}

		int totalRecord=noticeService.selectTotalCount(searchVo);
		logger.info("전체 레코드 개수 totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		onePage.setTotalRecord(totalRecord);
		
		model.addAttribute("noticeList", alist);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("onePage", onePage);
		
		logger.info("회원 pagingInfo={}", pagingInfo.getCurrentPage());
		
		return "notice/noticeUserList";
	}
}