package com.algoo.app.member.controller;

import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
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
import com.algoo.app.common.FileUploadWebUtil;
import com.algoo.app.email.EmailSender;
import com.algoo.app.member.model.MemberService;
import com.algoo.app.member.model.MemberVO;



@Controller
@RequestMapping("/member")
public class MemberController {
	private static final Logger logger=LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private FileUploadWebUtil fileUtil;
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CommemService commemService;
	
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
		int result = memberService.selectAllUserid(userid);
		return result;
	}
	
	@RequestMapping("/ajaxCheckNickName.ag")
	@ResponseBody
	public int ajaxCheckNickName(@RequestParam String nickName){
		int result = memberService.selectAllNickName(nickName);
		return result;
	}
	
	@RequestMapping("/ajaxCheckEmail.ag")
	@ResponseBody
	public int ajaxCheckEmail(@RequestParam(required=false) String email){
		int result=0; 
		if(email!=null){
			result = memberService.selectAllEmail(email);
		}
		return result;
	}
	
	/*@RequestMapping(value="/memberEdit.ag", method=RequestMethod.GET)
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
		매퍼xml(member.xml) 
		=> DAO 인터페이스 => DAO구현체(DAOMybatis) 
		=> Service 인터페이스 => Service구현체(ServiceImpl)
		
		
		MemberVO memberVo
			= memberService.selectMemberByUserid(userid);
		logger.info("회원정보 조회 결과, memberVo={}",memberVo);
		
		//3.
		model.addAttribute("memberVo", memberVo);
		
		return "member/memberEdit";		
	}*/
	
	@RequestMapping("/memberInfoEdit.ag")
	public String memberEdit_post(@ModelAttribute MemberVO memberVo,
		HttpSession session, Model model){
		
		String userid = (String)session.getAttribute("userid");
		memberVo.setUserid(userid);
		logger.info("회원정보 수정, 파라미터 memberVo={}", 
				memberVo);
		
		if(userid==null || userid.isEmpty()){
			return "login/checkLogin";
		}
		
		int result = memberService.updateMember(memberVo);
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
	public String memberWithdraw(
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
	@RequestMapping("/memInfo.ag")
	public String memInfo(HttpSession session,
			Model model){
		String userid = (String)session.getAttribute("userid");
		MemberVO memberVo = memberService.selectMemberByUserid(userid);
		CommemVO commemVo = commemService.selectMemberByUserid(userid);
		
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("commemVo", commemVo);
		logger.info("회원정보 읽어오기 memberVo={},",memberVo);
		
		return "member_comp/memberInfo";
	}

	@RequestMapping("/findMember.ag")
	public void findMember(){
		
	}
	
	@RequestMapping("/findIdDb.ag")
	@ResponseBody
	public String findMember_id(
			@ModelAttribute MemberVO memberVo,
			@ModelAttribute CommemVO commemVo,
			@RequestParam(required=false) String type_id){
		logger.info("아이디 찾기 파라미터 memberVo = {}", memberVo);
		String userid = "";
		
		if(type_id.equals("personal")){
			userid = memberService.selectId(memberVo);
		}else if(type_id.equals("company")){
			userid = commemService.selectId(commemVo);
		}
		
		return userid;
	}
	
	@RequestMapping("/findPwd.ag")
	public String findMember_pwd(
			@ModelAttribute MemberVO memberVo,
			@ModelAttribute CommemVO commemVo,
			@RequestParam(required=false) String email3,
			@RequestParam(required=false) String type_pwd,
			Model model){
		logger.info("비밀번호 찾기 파라미터 memberVo = {}", memberVo);
		String msg = "", url = "/member/findMember.ag";
		
		String tempPwd = ""+(char)(Math.random()*26+'A')+(int)(Math.random()*10)
				+(char)(Math.random()*26+'A')+(int)(Math.random()*10)
				+(char)(Math.random()*26+'A')+(int)(Math.random()*10)
				+(char)(Math.random()*26+'A')+(int)(Math.random()*10);
		logger.info(tempPwd);
		
		if(type_pwd.equals("personal")){
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
			
			int cnt = memberService.selectCount(memberVo);
			
			if(cnt == 1){
				memberVo.setPassword(tempPwd);
				
				int result = memberService.updatePwd(memberVo);
				
				if(result > 0){
					msg = "이메일로 임시 비밀번호가 발송되었습니다!"
						+ "임시 비밀번호로 로그인 하신 후 비밀번호 변경 부탁드립니다!";
					String subject = "[알구] 임시 비밀번호 발송 메일입니다";
					String content = "비밀 번호는 1개월 단위로 변경을 권장합니다"
							+ "\n임시 비밀번호 : " + tempPwd;
					
					String sender = "admin@algoo.com";
					String receiver = email1+"@"+email2;
					
					try {
						emailSender.sendEmail(subject, content,
								receiver, sender);
						logger.info("이메일 발송 성공!!");
					} catch (MessagingException e) {
						logger.info("이메일 발송 실패!!");
						e.printStackTrace();
					}
				}else{
					msg = "비밀번호 변경 실패!";
				}
			}else{
				msg = "입력하신 정보와 일치하는 가입 정보가 없습니다!!";
			}
			
			
		}else if(type_pwd.equals("company")){
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
			
			
			
			int cnt = commemService.selectCount(commemVo);
			
			
			if(cnt == 1){
				commemVo.setPassword(tempPwd);
				
				int result = commemService.updatePwd(commemVo);
				
				if(result > 0){
					msg = "이메일로 임시 비밀번호가 발송되었습니다!"
						+ "임시 비밀번호로 로그인 하신 후 비밀번호 변경 부탁드립니다!";
					String subject = "[알구] 임시 비밀번호 발송 메일입니다";
					String content = "비밀 번호는 1개월 단위로 변경을 권장합니다"
							+ "\n임시 비밀번호 : " + tempPwd;
					
					String sender = "admin@algoo.com";
					String receiver = email1+"@"+email2;
					
					try {
						emailSender.sendEmail(subject, content,
								receiver, sender);
						logger.info("이메일 발송 성공!!");
					} catch (MessagingException e) {
						logger.info("이메일 발송 실패!!");
						e.printStackTrace();
					}
				}else{
					msg = "비밀번호 변경 실패!";
				}
			}else{
				msg = "입력하신 정보와 일치하는 가입 정보가 없습니다!!";
			}
			
		}
		
		logger.info("msg = {}, url = {}", msg, url);
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}