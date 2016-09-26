package com.algoo.app.member.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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

import com.algoo.app.member.model.MemberService;
import com.algoo.app.member.model.MemberVO;


@Controller
@RequestMapping("/member")
public class LoginController {
	private static final Logger logger=LoggerFactory.getLogger(LoginController.class);
	
	@Autowired
	private MemberService memberService;
	@RequestMapping(value="/login.ag", method=RequestMethod.GET)
	public String login_get(){
		//1.
		logger.info("로그인 화면 보여주기");
		
		//2.
		
		//3.
		return "member/login";
	}
	
	@RequestMapping(value="/login.ag", method=RequestMethod.POST)
	public String login_post(@ModelAttribute MemberVO memVo, 
			@RequestParam(required=false) String chkSave, HttpServletRequest request ,
			HttpServletResponse response, Model model){
		//1.
		logger.info("로그인 처리 파라미터, memVo={},",memVo);
		logger.info("chkSave={}",chkSave);
		
		//2.
		int result= memberService.loginCheck(memVo);
		logger.info("로그인 처리 결과, result={}", result);
		
		String msg="", url="/member/login.ag";
		if(result==MemberService.LOGIN_OK){
			//로그인 성공
			//[1] 세션에 저장
			MemberVO memberVo = memberService.selectMemberByUserid(memVo.getUserid());
			HttpSession session = request.getSession();
			session.setAttribute("userid", memVo.getUserid());
			session.setAttribute("userName", memberVo.getUserName());
			
			//[2] 쿠키에 저장
			Cookie ck = new Cookie("ck_userid", memVo.getUserid());
			if(chkSave!=null){
				//아이디 저장을 체크한 경우 => 쿠키에 저장
				ck.setMaxAge(1000*24*60*60);  //쿠키 유효기간 1000일
				response.addCookie(ck);				
			}else{
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			
			msg=memberVo.getUserName()+"님 로그인되었습니다";
			url="/index.ag";
		}else if(result==MemberService.PWD_DISAGREE){
			msg="비밀번호가 일치하지 않습니다";
		}else if(result==MemberService.ID_NONE){
			msg="해당 아이디가 존재하지 않습니다";
		}else{
			msg="로그인 처리 실패";
		}
		
		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/logout.ag")
	public String logout(HttpSession session, Model model){
		//1.
		logger.info("로그아웃 처리");
		
		//2.
		//session.invalidate();
		session.removeAttribute("userid");
		session.removeAttribute("userName");
		session.removeAttribute("nickName");
		session.removeAttribute("authCode");
		//3.
		model.addAttribute("msg", "로그아웃되었습니다");
		model.addAttribute("url", "/index.ag");
		
		return "common/message";
	}
}
