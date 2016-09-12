package com.algoo.app.login.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.algoo.app.commem.model.CommemService;
import com.algoo.app.commem.model.CommemVO;
import com.algoo.app.member.model.MemberService;
import com.algoo.app.member.model.MemberVO;

@Controller
@RequestMapping("/login")
public class LoginController2 {
	private static final Logger logger
	 = LoggerFactory.getLogger(LoginController2.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CommemService commemService;
	
	@RequestMapping(value="/login.ag" , method=RequestMethod.GET)
	public String Login_get(){
		
		return "login/login";
	}
	
	@RequestMapping(value="/login.ag" , method=RequestMethod.POST)
	public String Login_post(
			@RequestParam(required=false) String userid,
			@RequestParam(required=false) String pwd,
			@RequestParam(required=false) String type,
			HttpSession session,
			Model model){
		logger.info("파라미터={}, {}",userid,pwd);
		logger.info("파라미터={}",type);
		
		
		String msg="", url="/index.ag";
		int result=0;
		if(type.equals("personal")){
			//개인회원
			MemberVO memberVo = new MemberVO();
			memberVo.setUserid(userid);
			memberVo.setPassword(pwd);
			
			result = memberService.loginCheck(memberVo);
			
			if(result==memberService.LOGIN_OK){
				session.setAttribute("userid", userid);
				session.setAttribute("authCode", 1); //1이면 개인회원

				msg=userid+"님 환영합니다";
			}else{
				if(result==memberService.ID_NONE){
					msg="존재하지 않는 아이디입니다";
				}else if(result==memberService.PWD_DISAGREE){
					msg="잘못된 비밀번호입니다";
				}
				url="/login/login.ag";
			}
		}else if(type.equals("company")){
			//기업회원
			CommemVO commemVo = new CommemVO();
			commemVo.setUserid(userid);
			commemVo.setPassword(pwd);
			
			result = commemService.loginCheck(commemVo);
			
			if(result==memberService.LOGIN_OK){
				session.setAttribute("userid", userid);
				session.setAttribute("authCode", 2); //2이면 기업회원
				
				msg=userid+"님 환영합니다";
			}else{
				if(result==commemService.ID_NONE){
					msg="존재하지 않는 아이디입니다";
				}else if(result==commemService.PWD_DISAGREE){
					msg="잘못된 비밀번호입니다";
				}
				url="/login/login.ag";
			}
			
		}else{
			//관리자
			msg="관리자"+userid+"님 환영합니다";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
