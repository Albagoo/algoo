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

import com.algoo.app.common.PaginationInfo;
import com.algoo.app.resume.model.ResumeListVO;
import com.algoo.app.resume.model.ResumeSearchVO;
import com.algoo.app.resume.model.ResumeService;

@Controller
@RequestMapping("/admin")
public class AdminResumeController {
	private static final Logger logger
		= LoggerFactory.getLogger(AdminRecController.class);
	
	@Autowired
	private ResumeService resumeService;
	
	@RequestMapping("/menu/resumeManagement.ag")
	public String adminResume_get(
			@ModelAttribute ResumeSearchVO resumeSearchVo,
			@RequestParam(defaultValue="5") int num,
			Model model){
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setCurrentPage(resumeSearchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(num);
		
		resumeSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		resumeSearchVo.setRecordCountPerPage(num);
		
		logger.info("resumeSearchVo = {}", resumeSearchVo);
		
		List<ResumeListVO> alist = resumeService.selectResume(resumeSearchVo);
		List<ResumeListVO> tlist = resumeService.selectResumeCount(resumeSearchVo);
		
		pagingInfo.setTotalRecord(tlist.size());
		
		logger.info("alist.size = {}, totalRecore = {}", alist.size(), tlist.size());
		
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("alist", alist);
		
		return "admin/menu/resumeManagement";
	}
}
