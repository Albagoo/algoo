package com.algoo.app.apply.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import com.algoo.app.apply.model.ApplyService;
import com.algoo.app.apply.model.ApplyVO;
import com.algoo.app.apply.model.ApplyViewVO;
import com.algoo.app.member.model.MemberService;
import com.algoo.app.member.model.MemberVO;
import com.algoo.app.resume.model.ResumeService;
import com.algoo.app.resume.model.ResumeVO;

@Controller
@RequestMapping("/apply")
public class ApplyController {
	private static final Logger logger
		= LoggerFactory.getLogger(ApplyController.class);
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ApplyService applyService;
	
	@Autowired
	private ResumeService resumeService;
	
	@RequestMapping(value="/apply.ag", method=RequestMethod.GET)
	public String apply_get(
			@RequestParam String userid,
			Model model){
		MemberVO memberVo = memberService.selectMemberByUserid(userid);
		
		List<ResumeVO> alist = resumeService.selectResumeByMemberCode(memberVo.getMemberCode());
		
		model.addAttribute("alist", alist);
		
		return "apply/apply";
	}
	
	@RequestMapping(value="/apply.ag", method=RequestMethod.POST)
	@ResponseBody
	public int apply_post(
			@ModelAttribute ApplyVO applyVo){
		
		logger.info("applyVo = {}, userid = {}", applyVo);
		
		int cnt = applyService.insertApply(applyVo);
		
		return cnt;
	}
	
	@RequestMapping("/applyList.ag")
	public String applyList(
			HttpSession session,
			Model model){
		String userid = (String)session.getAttribute("userid");
		
		MemberVO memberVo = memberService.selectMemberByUserid(userid);
		
		List<ApplyViewVO> alist = applyService.selectMemberCode(memberVo.getMemberCode());
		
		model.addAttribute("alist", alist);
		
		return "apply/applyList";
	}
}
