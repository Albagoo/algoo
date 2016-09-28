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

import com.algoo.app.admin.model.AdminMemberService;
import com.algoo.app.faq.model.FaqListVO;
import com.algoo.app.faq.model.FaqService;
import com.algoo.app.faq.model.FaqVO;
import com.algoo.app.freeboard.model.FreeboardListVO;
import com.algoo.app.freeboard.model.FreeboardService;
import com.algoo.app.freeboard.model.FreeboardVO;
import com.algoo.app.mainpage.model.MainPageService;
import com.algoo.app.mainpage.model.MainSearchVO;
import com.algoo.app.notice.model.NoticeListVO;
import com.algoo.app.notice.model.NoticeService;
import com.algoo.app.notice.model.NoticeVO;
import com.algoo.app.rec.model.RecListVO;
import com.algoo.app.rec.model.RecService;
import com.algoo.app.rec.model.RecVO;
import com.algoo.app.resume.model.ResumeService;

@Controller
@RequestMapping("/admin")
public class AdminRecController {
	
	private static final Logger logger
		= LoggerFactory.getLogger(AdminRecController.class);
	
	@Autowired
	private RecService recService;
	
	@Autowired
	private ResumeService resumeService;
	@Autowired
	private MainPageService mpService;
	
	
	@RequestMapping("/adminRec.ag")
	public String adminBoardList(Model model,
			@ModelAttribute MainSearchVO searchVo,
			@RequestParam(defaultValue="0") String nco){
		
		
		logger.info("관리자 채용정보 리스트");
		searchVo.setMainGrade("슈퍼");
		List<RecVO> nlist = mpService.searchByGrade(searchVo);
		logger.info("슈퍼 공고 조회 결과 nlist.size()={}", nlist.size());
		
		searchVo.setMainGrade("그랜드");
		logger.info("그랜드 공고 검색 결과, searchVo={}", searchVo);
		List<RecVO> flist = mpService.searchByGrade(searchVo);
		logger.info("그랜드 공고 조회결과 flist = {}", flist.size());
		
		searchVo.setMainGrade("스페셜");
		List<RecVO> tlist = mpService.searchByGrade(searchVo);
		logger.info("스페셜 공고 검색 결과 tlist = {}", tlist);
		
		searchVo.setMainGrade("스피드");
		List<RecVO> slist = mpService.searchByGrade(searchVo);
		logger.info("스피드 공고 검색 결과 tlist = {}", slist);
		
		model.addAttribute("nlist", nlist);
		model.addAttribute("flist", flist);
		model.addAttribute("tlist", tlist);
		model.addAttribute("slist", slist);
		
		return "admin/adminRec";
		
	}
	@RequestMapping("/recAdminDelete.ag")
	public String delete(
			@ModelAttribute RecVO recVo,
			Model model){
		
		int recCode=recVo.getRecCode();
		int res=recService.deleteByRecCode(recCode);
		String msg="",url="";
		if(res>0){
			msg="삭제성공";
			url="/admin/adminRec.ag";
		}else{
			msg="삭제실패";
			url="/admin/adminRec.ag";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/selectRecDelete.ag")
	public String selectrecDelete(
			@ModelAttribute RecVO recVo,
			@ModelAttribute RecListVO recListVo,
			Model model){
		//선택한 상품 삭제
		//1.
		logger.info("선택한 Rec 삭제, 파라미터 recVo = {}", recVo);
		
		 List<RecVO> fList =null;
		if(recListVo.getRec1List().size()!=0){fList= recListVo.getRec1List();}
		if(recListVo.getRec2List().size()!=0){fList= recListVo.getRec1List();}
		if(recListVo.getRec3List().size()!=0){fList= recListVo.getRec1List();}
		if(recListVo.getRec4List().size()!=0){fList= recListVo.getRec1List();}
		
		logger.info("fList.size() = {}", fList.size());
		
		//2.
		int cnt=recService.selectDelete(fList);
		logger.info("선택한 Rec 삭제 처리 결과, cnt = {}", cnt);
		
		String msg="", url="/admin/adminRec.ag";
		
		if(cnt>0){
			for(int i=0;i<fList.size();i++){
				RecVO RecVo=fList.get(i);
				
				int recCode=RecVo.getRecCode();

				logger.info("i = {}, mainNo = {}", i, recCode);
			}//for
			msg="선택한 Rec 삭제 성공";
		}else{
			msg="선택한 Rec 삭제 실패";
		}//if
		
		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	/*
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
	
	@RequestMapping("/selectFreeDelete.ag")
	public String selectFreeDelete(@ModelAttribute FreeboardListVO tListVo, Model model){
		//1.
		logger.info("관리자 선택한 Freeboard 삭제, 파라미터 tListVo = {}", tListVo);
		List<FreeboardVO> tList = tListVo.getFreeList();
		
		logger.info("tList.size() = {}", tList.size());
		
		//2.
		int cnt=freeService.selectDelete(tList);
		logger.info("선택한 Freeboard 삭제 처리 결과, cnt = {}", cnt);
		
		String msg="", url="/admin/adminBoard.ag";
		
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
	}*/
}