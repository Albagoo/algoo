package com.algoo.app.member.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.algoo.app.common.FileUploadWebUtil;
import com.algoo.app.member.model.MemberService;
import com.algoo.app.member.model.MemberVO;



@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger=LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private FileUploadWebUtil fileUtil;
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/agreement.ag")
	public String agreement(){
		logger.info("약관동의 화면 보여주기");
		
		return "member/agreement";		
	}
	
	@RequestMapping("/register.ag")
	public String register(){
		logger.info("회원 가입 페이지 보여주기");
		
		return "member/register";	
	}
	
	@RequestMapping("/memberAdd.ag")
	public String memberAdd(@ModelAttribute MemberVO memberVo, 
			@RequestParam String email3, @RequestParam String bi1,
			@RequestParam String bi2,@RequestParam String bi3,
			HttpServletRequest request,	Model model){
		//1.
		logger.info("회원가입 처리, 파라미터 memberVo={}", memberVo);
		/*
		//파일 업로드 처리
		int uploadType = FileUploadWebUtil.IMAGE_UPLOAD;
		
		List<Map<String, Object>> fileList
		=fileUtil.FileUpload(request, uploadType);
		logger.info("업로드 파일 fileList.size=()={}",fileList.size());
		
		//업로드된 파일명 구해오기
		String fileName="";
		long fileSize=0;
		for(Map<String, Object> mymap : fileList){
			fileName= (String) mymap.get("fileName");
			fileSize=(Long) mymap.get("fileSize");
			
			memberVo.setPhoto(fileName);
		}*/
		//2.
		//휴대폰번호를 모두 입력하지 않은 경우 - 모두 공백으로 셋팅
		String hp2=memberVo.getHp2();
		String hp3=memberVo.getHp3();
		
		if(hp2==null || hp2.isEmpty() ||hp3==null ||hp3.isEmpty()){
			memberVo.setHp1("");
			memberVo.setHp2("");
			memberVo.setHp3("");
		}
		
		String email1 = memberVo.getEmail1();
		String email2 = memberVo.getEmail2();
		if(email1==null || email1.isEmpty()){
			memberVo.setEmail1("");
			memberVo.setEmail2("");
		}else{
			if(email2.equals("etc")){
				if(email3!=null && !email3.isEmpty()){
					memberVo.setEmail2(email3);
				}else{
					memberVo.setEmail1("");
					memberVo.setEmail2("");
				}
			}
		}
		String birth=bi1+"-"+bi2+"-"+bi3;
		memberVo.setBirth(birth);
				
		logger.info("memberVo.getEmail1={}",memberVo.getEmail1(),memberVo.getEmail2());	
		int cnt= memberService.insertMember(memberVo);
		logger.info("회원가입 결과 cnt={}", cnt);
		//3.
		String msg="",url="";
		if(cnt>0){
			msg="회원가입되었습니다.";
			url="/index.ag";
		}else{
			msg="회원가입 실패"; 
			url="/member/register.ag";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/ajaxCheckUserid.ag")
	@ResponseBody
	public int ajaxCheckId(@RequestParam String userid){
		logger.info("ajax-아이디 중복확인, 파라미터 userid={}",
				userid);
		
		int result = memberService.checkUserid(userid);
		logger.info("ajax 아이디 중복확인 결과, result={}",
				result);
		//해당 아이디가 존재하면 1, 존재하지 않으면 2를 리턴
		
		return result;
	}
	
	@RequestMapping(value="/memberEdit.ag", method=RequestMethod.GET)
	public String memberEdit_get(HttpSession session,Model model){
		//1.
		String userid = (String)session.getAttribute("userid");		
		logger.info("회원수정화면 보여주기, userid={}", userid);
		
		//로그인하지 않고 들어온 경우 -에러 처리
		if(userid==null || userid.isEmpty()){
			model.addAttribute("msg", "먼저 로그인하세요");
			model.addAttribute("url", "/member/login.ag");
			
			return "common/message";
		}
		
		//2.
		/*매퍼xml(member.xml) 
		=> DAO 인터페이스 => DAO구현체(DAOMybatis) 
		=> Service 인터페이스 => Service구현체(ServiceImpl)
		*/
		
		MemberVO memberVo
			= memberService.selectMemberByUserid(userid);
		logger.info("회원정보 조회 결과, memberVo={}",memberVo);
		
		//3.
		model.addAttribute("memberVo", memberVo);
		
		return "member/memberEdit";		
	}
	
	@RequestMapping(value="/memberEdit.ag", method=RequestMethod.POST)
	public String memberEdit_post(@ModelAttribute MemberVO memberVo,
		HttpSession session, Model model){
		//1.
		String userid = (String)session.getAttribute("userid");
		memberVo.setUserid(userid);
		logger.info("회원정보 수정, 파라미터 memberVo={}", 
				memberVo);
		
		//2.
		//비밀번호 체크 성공하면 수정처리
		int result 
		=memberService.loginCheck(memberVo);
		
		String msg="",url="/member/memberEdit.ag";
		if(result==MemberService.LOGIN_OK){
			int cnt = memberService.updateMember(memberVo);
			if(cnt>0){
				msg="회원정보를 수정하였습니다";
			}else{
				msg="회원정보 수정 실패";
			}
		}else if(result==MemberService.PWD_DISAGREE){
			msg="비밀번호가 일치하지 않습니다";
		}else{
			msg="비밀번호 체크 실패";
		}
		
		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/memberOut.ag", 
			method=RequestMethod.GET)
	public String memberout_get(HttpSession session,
			Model model){
		//1.
		String userid= (String)session.getAttribute("userid");
		
		logger.info("회원탈퇴 페이지 보여주기, userid={}", 
				userid);
		
		//2.
		
		//3.
		return "member/memberOut";
	}
	
	@RequestMapping(value="/memberOut.ag", 
			method=RequestMethod.POST)
	public String memberOut_post(
		@ModelAttribute MemberVO memVo,
		HttpSession session, Model model){
		
		//1.
		String userid= (String)session.getAttribute("userid");
		memVo.setUserid(userid);
		
		logger.info("회원탈퇴 처리, 파라미터 memVo={}",memVo);
		
		//2.
		int result = memberService.loginCheck(memVo);
		String msg="", url="/member/memberOut.ag";
		if(result==MemberService.LOGIN_OK){
			int cnt = memberService.withdrawMember(userid);
			logger.info("회원탈퇴 처리 결과, cnt={}", cnt);
			
			if(cnt>0){
				msg="회원탈퇴 처리되었습니다";
				url="/index.ag";
				
				session.invalidate();
			}else{
				msg="회원탈퇴 실패";
			}
		}else if(result==MemberService.PWD_DISAGREE){
			msg="비밀번호가 일치하지 않습니다";
		}else{
			msg="비밀번호 체크 실패";
		}
		
		//3.
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
}