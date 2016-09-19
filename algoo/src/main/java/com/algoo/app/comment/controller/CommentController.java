package com.algoo.app.comment.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.algoo.app.comment.model.CommentService;
import com.algoo.app.comment.model.CommentVO;

@Controller
public class CommentController {
	private static final Logger logger
	=LoggerFactory.getLogger(CommentController.class);
	
	@Autowired
	private CommentService cmtService;
	
	@RequestMapping("/comment/write.ag")
	public String writeComment(@ModelAttribute CommentVO cmtVo){
		logger.info("댓글 쓰기, 파라미터 cmtVo = {}", cmtVo);
		
		int cnt=cmtService.insertComment(cmtVo);
		logger.info("댓글 쓰기 결과 cnt = {}", cnt);
		
		return "redirect:/freeboard/detail.ag?freeNo="+cmtVo.getFreeNo();
	}
	
	@RequestMapping("/comment/list.do")
	public String ListComment(@RequestParam(defaultValue="0") int freeNo, Model model){
		logger.info("댓글 리스트, 파라미터 freeNo = {}", freeNo);
		
		List<CommentVO> clist=cmtService.selectComment(freeNo);
		logger.info("댓글 리스트 조회 결과 clist.size() = {}", clist.size());
		
		model.addAttribute("clist", clist);
		
		return "commnet/list";
	}
}