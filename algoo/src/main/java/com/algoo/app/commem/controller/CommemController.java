package com.algoo.app.commem.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.algoo.app.commem.model.CommemService;
import com.algoo.app.commem.model.CommemVO;
import com.algoo.app.member.model.MemberService;
import com.algoo.app.member.model.MemberVO;

@Controller
@RequestMapping("/member_comp")
public class CommemController {
	private static final Logger logger
		= LoggerFactory.getLogger(CommemController.class);
	
	@Autowired
	private CommemService commemService;
	
	//회원가입화면 창띄우기
	@RequestMapping("/register.ag")
	public String showRegister(){
		
		return "member_comp/register";
	}
	
	//기업회원 - insert
	@RequestMapping("/memberAdd.ag")
	public String memberAdd(@ModelAttribute CommemVO commemVo,
			@RequestParam(required=false) String email3){
		
		logger.info("기업회원 처리 파라미터 commemVo={},email3={}"
				,commemVo,email3);
		
		String fax2=commemVo.getFax2();
		String fax3=commemVo.getFax3();
		if(fax2==null || fax2.isEmpty() ||fax3==null ||fax3.isEmpty()){
			commemVo.setFax1("");
			commemVo.setFax2("");
			commemVo.setFax3("");
		}
		
		String phone2=commemVo.getPhone2();
		String phone3=commemVo.getPhone3();
		
		if(phone2==null || phone2.isEmpty() ||phone3==null ||phone3.isEmpty()){
			commemVo.setPhone1("");
			commemVo.setPhone2("");
			commemVo.setPhone3("");
		}
		
		String email1 = commemVo.getEmail1();
		String email2 = commemVo.getEmail2();
		if(email1==null || email1.isEmpty()){
			commemVo.setEmail1("");
			commemVo.setEmail2("");
		}else{
			if(email2.equals("etc")){
				if(email3!=null && !email3.isEmpty()){
					commemVo.setEmail2(email3);
				}else{
					commemVo.setEmail1("");
					commemVo.setEmail2("");
				}
			}
		}
		
		int result = commemService.insertCompMember(commemVo);
		logger.info("기업회원가입 처리, result={}",result);
		
		return "redirect:/index.ag";
	}
	
	@RequestMapping("/ajaxCheckUserid.ag")
	@ResponseBody
	public int ajaxCheckId(@RequestParam String userid){
		logger.info("ajax-아이디 중복확인, 파라미터 userid={}", userid);
		
		int result=commemService.checkUserid(userid);
		logger.info("ajax 아이디 중복 확인 결과, result={}",result);
		
		//해당 아이디가 존재하면 1, 존재하지 않으면 2를 리턴
		return result;
	}
	@RequestMapping("/commemInfo.ag")
	public String memInfo(HttpSession session,
			Model model){
		String userid = (String)session.getAttribute("userid");
		CommemVO commemVo = commemService.selectMemberByUserid(userid);
		
		model.addAttribute("commemVo", commemVo);
		logger.info("회원정보 읽어오기 commemVo={},",commemVo);
		
		return "member_comp/memberInfo";
	}
	@RequestMapping("/commemInfoEdit.ag")
	public String memberEdit_post(@ModelAttribute CommemVO commemVo,
			@RequestParam(required=false) String email3,
		HttpSession session, Model model){
		
		String userid = (String)session.getAttribute("userid");
		commemVo.setUserid(userid);
		logger.info("회원정보 수정, 파라미터 memberVo={}", 
				commemVo);
		
		if(userid==null || userid.isEmpty()){
			return "login/checkLogin";
		}
		
		String fax2=commemVo.getFax2();
		String fax3=commemVo.getFax3();
		if(fax2==null || fax2.isEmpty() ||fax3==null ||fax3.isEmpty()){
			commemVo.setFax1("");
			commemVo.setFax2("");
			commemVo.setFax3("");
		}
		
		String phone2=commemVo.getPhone2();
		String phone3=commemVo.getPhone3();
		
		if(phone2==null || phone2.isEmpty() ||phone3==null ||phone3.isEmpty()){
			commemVo.setPhone1("");
			commemVo.setPhone2("");
			commemVo.setPhone3("");
		}
		
		String email1 = commemVo.getEmail1();
		String email2 = commemVo.getEmail2();
		if(email1==null || email1.isEmpty()){
			commemVo.setEmail1("");
			commemVo.setEmail2("");
		}else{
			if(email2.equals("etc")){
				if(email3!=null && !email3.isEmpty()){
					commemVo.setEmail2(email3);
				}else{
					commemVo.setEmail1("");
					commemVo.setEmail2("");
				}
			}
		}
		
		int result = commemService.updateCompMember(commemVo);
		logger.info("회원정보 수정 결과, result={}",result);
		
		String msg="", url="/login/mypageType.ag";
		if(result>0){
			msg="회원정보를 수정하였습니다";
		}else{
			msg="수정을 실패하였습니다";
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	@RequestMapping("/memberWithdraw.ag")
	public String withDraw(){
		return "member_comp/memberWithdraw";
	}
	@RequestMapping("/commemWithdraw.ag")
	public String memberWithdraw(
		@ModelAttribute CommemVO commemVo,
		HttpSession session, Model model){
		
		//1.
		String userid= (String)session.getAttribute("userid");
		commemVo.setUserid(userid);
		
		logger.info("회원탈퇴 처리, 파라미터 memVo={}",commemVo);
		
		//2.
		int result = commemService.loginCheck(commemVo);
		String msg="", url="/member/memberOut.ag";
		if(result==MemberService.LOGIN_OK){
			int cnt = commemService.withdrawCommem(userid);
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
