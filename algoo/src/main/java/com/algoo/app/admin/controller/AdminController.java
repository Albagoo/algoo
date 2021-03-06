package com.algoo.app.admin.controller;

import java.util.List;

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

import com.algoo.app.admin.model.AdminMemberService;
import com.algoo.app.admin.model.AdminMemberVO;
import com.algoo.app.common.MonthVO;
import com.algoo.app.faq.model.FaqListVO;
import com.algoo.app.faq.model.FaqService;
import com.algoo.app.faq.model.FaqVO;
import com.algoo.app.freeboard.model.FreeboardListVO;
import com.algoo.app.freeboard.model.FreeboardService;
import com.algoo.app.freeboard.model.FreeboardVO;
import com.algoo.app.notice.model.NoticeListVO;
import com.algoo.app.notice.model.NoticeService;
import com.algoo.app.notice.model.NoticeVO;
import com.algoo.app.rec.model.RecService;
import com.algoo.app.resume.model.ResumeService;

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
	
	@Autowired
	private AdminMemberService adminMemberService;
	
	@Autowired
	private RecService recService;
	
	@Autowired
	private ResumeService resumeService;
	
	@RequestMapping("/adminCharts.ag")
	public String adminCharts(Model model){
		MonthVO monthVo = recService.selectCountRec();
		model.addAttribute("rec", monthVo);
		
		MonthVO monthVo2 = resumeService.selectCountResume();
		model.addAttribute("resume", monthVo2);
		
		return "admin/adminCharts";
	}
	
	@RequestMapping("/adminIndex.ag")
	public String adminIndex(Model model){
		logger.info("관리자 홈페이지 보여주기");
		
		
		
		return "admin/adminIndex";
	}
	
	/*로그인,로그아웃*/
	@RequestMapping(value="/login/adminLogin.ag", method=RequestMethod.GET)
	public String adminLogin_get(){
		logger.info("관리자 로그인 페이지 보여주기");
		
		return "admin/login/adminLogin";
	}
	@RequestMapping(value="/login/adminLogin.ag", method=RequestMethod.POST)
	public String adminLogin_post(@RequestParam(required=false) String userid,
			@RequestParam(required=false) String password,
			HttpSession session,
			Model model){
		
		logger.info("로그인 처리 파라미터, userid={}, password={}",userid,password);
		AdminMemberVO adminMemberVo = new AdminMemberVO();
		adminMemberVo.setUserid(userid);
		adminMemberVo.setPassword(password);
		logger.info("로그인 정보 adminMemberVo={}",adminMemberVo);
		int result
			= adminMemberService.loginCheck(adminMemberVo);
		
		String msg="", url="";
		if(result==adminMemberService.LOGIN_OK){
			adminMemberVo = adminMemberService.selectAdminByUserid(userid);
			session.setAttribute("adminUserid", userid);
			session.setAttribute("adminUserName", adminMemberVo.getName());
			session.setAttribute("adminNickName", adminMemberVo.getNickName());
			session.setAttribute("adminAuthCode", "3"); //3 관리자
			
			msg = adminMemberVo.getName()+"님 관리자로 로그인되었습니다";
			url = "/admin/adminIndex.ag";
		}else{
			if(result==adminMemberService.ID_NONE){
				msg = "존재하지 않는 아이디입니다";
				url = "/admin/login/adminLogin.ag";
			}else if(result==adminMemberService.PWD_DISAGREE){
				msg = "비밀번호가 일치하지 않습니다";
				url = "/admin/login/adminLogin.ag";
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	@RequestMapping("/login/adminLogout.ag")
	public String adminLogout(HttpSession session, Model model){
		logger.info("로그아웃 처리");
		session.removeAttribute("adminUserid");
		session.removeAttribute("adminUserName");
		session.removeAttribute("adminNickName");
		session.removeAttribute("adminAuthCode");
		//3.
		model.addAttribute("msg", "로그아웃되었습니다");
		model.addAttribute("url", "/admin/login/adminLogin.ag");
		
		return "common/message";
	}
	@RequestMapping("/menu/memberManagement.ag")
	public String memberManagement(){
		logger.info("관리자 회원관리 페이지 보여주기");
		
		return "admin/menu/memberManagement";
	}
	@RequestMapping("/menu/recManagement.ag")
	public String recManagement(){
		logger.info("관리자 채용공고관리 페이지 보여주기");
		
		return "admin/menu/recManagement";
	}
	
	@RequestMapping("/menu/boardManagement.ag")
	public String boardManagement(){
		logger.info("관리자 게시판관리 페이지 보여주기");
		
		return "admin/menu/boardManagement";
	}
	
	
	@RequestMapping("/adminBoard.ag")
	public String adminBoardList(Model model, @RequestParam(defaultValue="0") String nco){
		logger.info("관리자페이지 게시판 리스트");
		
		List<NoticeVO> nlist=noticeService.selectAll();
		logger.info("관리자페이지 공지사항 리스트 nlist = {}", nlist);
		
		List<FaqVO> flist=faqService.selectAll();
		logger.info("관리자페이지 FAQ 리스트 flist = {}", flist);
		
		List<FreeboardVO> tlist=freeService.selectAdmFreeboard();
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
	}
}