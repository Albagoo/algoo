package com.algoo.app.apply.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.algoo.app.apply.model.ApplyService;
import com.algoo.app.apply.model.ApplyVO;
import com.algoo.app.member.model.MemberService;
import com.algoo.app.member.model.MemberVO;

@Controller
@RequestMapping("/apply")
public class ApplyController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private ApplyService applyService;
	
	@RequestMapping(value="/apply.ag", method=RequestMethod.GET)
	public void apply_get(){
		
	}
	
	@RequestMapping(value="/apply.ag", method=RequestMethod.POST)
	public int apply_post(
			@ModelAttribute ApplyVO applyVo,
			@RequestParam String userid){
		
		MemberVO memberVo = memberService.selectMemberByUserid(userid);
		
		applyVo.setMemberCode(memberVo.getMemberCode());
		
		int cnt = applyService.insertApply(applyVo);
		
		return cnt;
	}
}
