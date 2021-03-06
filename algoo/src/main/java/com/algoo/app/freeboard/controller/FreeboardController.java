package com.algoo.app.freeboard.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.algoo.app.comment.model.CommentService;
import com.algoo.app.common.PaginationInfo;
import com.algoo.app.common.SearchVO;
import com.algoo.app.faq.model.FaqVO;
import com.algoo.app.freeboard.model.FreeboardListVO;
import com.algoo.app.freeboard.model.FreeboardService;
import com.algoo.app.freeboard.model.FreeboardVO;


@Controller
@RequestMapping("/freeboard")
public class FreeboardController {
	private static final Logger logger
	=LoggerFactory.getLogger(FreeboardController.class);
	
	@Autowired
	private FreeboardService freeService;
	
	@Autowired
	private CommentService cmtService;
	
	@RequestMapping(value="/write.ag", method=RequestMethod.GET)
	public String freeWrite_get(){
		logger.info("freeboard 글 쓰기 화면 보여주기");
		
		return "freeboard/write";
	}
	
	@RequestMapping(value="/write.ag", method=RequestMethod.POST)
	public String freeWrite_post(@ModelAttribute FreeboardVO freeVo,
			HttpSession session){

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
		
		PaginationInfo onePage = new PaginationInfo();
		onePage.setBlockSize(1);
		onePage.setRecordCountPerPage(20);
		onePage.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setBlockSize(onePage.getBlockSize());
		searchVo.setRecordCountPerPage(onePage.getRecordCountPerPage());
		searchVo.setFirstRecordIndex(onePage.getFirstRecordIndex());
				
		List<FreeboardVO> alist = freeService.selectAllFreeboard(searchVo);
		logger.info("freeboard 목록 조회 결과 alist.size()={}", alist.size());
		
		int totalRecord=freeService.selectTotalCount(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		onePage.setTotalRecord(totalRecord);
				
		model.addAttribute("freeList", alist);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("onePage", onePage);
		
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
			@RequestParam(defaultValue="0") int freeNo,	Model model){
		logger.info("freeboard 상세보기 파라미터, freeNo = {}", freeNo);
		
		if(freeNo==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/freeboard/list.ag");
			
			return "common/message";
		}
		
		FreeboardVO freeVo = freeService.selectFreeboardByNo(freeNo);
		logger.info("freeboard 상세보기 결과 freeVo = {}", freeVo);
		
		FreeboardVO freePreVo=freeService.prevContent(freeNo);
		logger.info("이전글 보기 결과 freePreVo = {}", freePreVo);
		
		FreeboardVO freeNextVo=freeService.nextContent(freeNo);
		logger.info("다음글 보기 결과 freeNextVo = {}", freeNextVo);
		
		model.addAttribute("freeVo", freeVo);
		model.addAttribute("preFreeVo", freePreVo);
		model.addAttribute("nextFreeVo", freeNextVo);
		
		
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
			msg="게시물 수정 성공";
			logger.info("freeboard 수정 결과, cnt = {}", cnt);
				
			url="/freeboard/detail.ag?freeNo="+freeVo.getFreeNo();
		}else{
			msg="게시물 수정 실패";
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/delete.ag")
	public String delete(@RequestParam(defaultValue="0") int freeNo, Model model){
		logger.info("Freeboard 삭제 , 파라미터 freeNo = {}", freeNo);
		
		FreeboardVO freeVo=freeService.selectFreeboardByNo(freeNo);
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("freeNo", Integer.toString(freeNo));
		map.put("groupNo", freeVo.getGroupNo()+"");
		map.put("step", freeVo.getStep()+"");
		logger.info("글삭제시 파라미터 map = {}", map);
					
		freeService.deleteFreeboard(map);
			
		return "redirect:/freeboard/list.ag";
	}
	
	@RequestMapping("/freeAdminDelete.ag")
	public String freeAdminDelete(@RequestParam(defaultValue="0") int freeNo, Model model){
		logger.info("관리자 Freeboard 삭제 , 파라미터 freeNo = {}", freeNo);
		
		FreeboardVO freeVo=freeService.selectFreeboardByNo(freeNo);
		
		Map<String, String> map=new HashMap<String, String>();
		map.put("freeNo", Integer.toString(freeNo));
		map.put("groupNo", freeVo.getGroupNo()+"");
		map.put("step", freeVo.getStep()+"");
		logger.info("관리자 글삭제 파라미터 map = {}", map);
					
		freeService.deleteFreeboard(map);
			
		return "redirect:/admin/adminBoard.ag";
	}
	
	@RequestMapping(value="/reply.ag", method=RequestMethod.GET)
	public String reply_get(@RequestParam(defaultValue="0") int freeNo, Model model){
		
		//1.
		logger.info("답변달기 화면 보여주기, 파라미터 freeNo = {}", freeNo);
		if(freeNo==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/freeboard/list.ag");
			
			return "common/message";
		}
		
		//2.
		FreeboardVO freeVo=freeService.selectFreeboardByNo(freeNo);
		logger.info("답변달기 화면 조회 결과, freeVo = {}", freeVo);
		
		//3.
		model.addAttribute("freeVo", freeVo);
		
		return "freeboard/reply";
	}
	
	@RequestMapping(value="/reply.ag", method=RequestMethod.POST)
	public String reply_post(@ModelAttribute FreeboardVO freeVo, Model model){
		logger.info("답변달기 처리 파라미터 freeVo = {}", freeVo);
		
		int cnt=freeService.insertReply(freeVo);
		logger.info("답변달기 처리 결과, cnt = {}", cnt);
		
		String msg="", url="";
		
		if(cnt>0){
			url="/freeboard/list.ag";
		}else{
			msg="답변달기 실패";
			url="/freeboard/reply.ag?freeNo="+freeVo.getFreeNo();
		}//if
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("selectDelete.ag")
	public String selectDelete(@ModelAttribute FreeboardListVO tListVo, Model model){
		//1.
		logger.info("관리자 선택한 Freeboard 삭제, 파라미터 tListVo = {}", tListVo);
		List<FreeboardVO> tList = tListVo.getFreeList();
		
		logger.info("tList.size() = {}", tList.size());
		
		//2.
		int cnt=freeService.selectDelete(tList);
		logger.info("선택한 Freeboard 삭제 처리 결과, cnt = {}", cnt);
		
		String msg="", url="/freeboard/list.ag";
		
		if(cnt>0){
			for(int i=0;i<tList.size();i++){
				FreeboardVO freeVo=tList.get(i);
				
				int freeNo=freeVo.getFreeNo();

				logger.info("i = {}, freeNo = {}", i, freeNo);
			}//for
			msg="선택한 Freeboard 삭제 성공";
		}else{
			msg="선택한 Freeboard 삭제 실패";
		}//if
		
		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}