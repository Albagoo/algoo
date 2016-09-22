package com.algoo.app.rec.controller;

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
import com.algoo.app.common.SearchVO;
import com.algoo.app.company.model.CompanyService;
import com.algoo.app.mainpage.model.MainPageService;
import com.algoo.app.mainpage.model.MainSearchVO;
import com.algoo.app.rec.model.RecSeachVO;
import com.algoo.app.rec.model.RecService;
import com.algoo.app.rec.model.RecVO;
import com.algoo.app.service.model.ServiceService;

@Controller
public class MainRecController {
	public static final Logger logger
	=LoggerFactory.getLogger(RecController.class);

	@Autowired
	private RecService recService;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private ServiceService serviceService;
	@Autowired
	private MainPageService mpService;
	
	@RequestMapping("/superList.ag")
	public String superList(
			@ModelAttribute MainSearchVO searchVo,
			Model model){
		
		searchVo.setMainGrade("슈퍼");
		
		//1
		logger.info("슈퍼 공고 검색 결과, searchVo={}", searchVo);
		
		//2
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setRecordCountPerPage(25);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setBlockSize(pagingInfo.getBlockSize());
		searchVo.setRecordCountPerPage(pagingInfo.getRecordCountPerPage());
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("파라미터 ={}",searchVo);		
		List<RecVO> alist = mpService.searchByGrade(searchVo);
		logger.info("슈퍼 공고 조회 결과 alist.size()={}", alist.size());
		
		int totalRecord=mpService.selectTotalCount(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		//3				
		model.addAttribute("alist", alist);
		model.addAttribute("pagingInfo", pagingInfo);
		return "mainOther/superEmp";
	}
	
	@RequestMapping("/grandList.ag")
	public String grandList(
			@ModelAttribute MainSearchVO searchVo,
			Model model){
		
		searchVo.setMainGrade("그랜드");
		
		//1
		logger.info("그랜드 공고 검색 결과, searchVo={}", searchVo);
		
		//2
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setRecordCountPerPage(25);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setBlockSize(pagingInfo.getBlockSize());
		searchVo.setRecordCountPerPage(pagingInfo.getRecordCountPerPage());
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("파라미터 ={}",searchVo);		
		List<RecVO> alist = mpService.searchByGrade(searchVo);
		logger.info("그랜드 공고 조회 결과 alist.size()={}", alist.size());
		
		int totalRecord=mpService.selectTotalCount(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		//3				
		model.addAttribute("alist", alist);
		model.addAttribute("pagingInfo", pagingInfo);
		return "mainOther/grandEmp";
	}
	
	@RequestMapping("/specialList.ag")
	public String specialList(
			@ModelAttribute MainSearchVO searchVo,
			Model model){
		
		searchVo.setMainGrade("스페셜");
		
		//1
		logger.info("스페셜 공고 검색 결과, searchVo={}", searchVo);
		
		//2
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setRecordCountPerPage(25);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setBlockSize(pagingInfo.getBlockSize());
		searchVo.setRecordCountPerPage(pagingInfo.getRecordCountPerPage());
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("파라미터 ={}",searchVo);		
		List<RecVO> alist = mpService.searchByGrade(searchVo);
		logger.info("스페셜 공고 조회 결과 alist.size()={}", alist.size());
		
		int totalRecord=mpService.selectTotalCount(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		//3				
		model.addAttribute("alist", alist);
		model.addAttribute("pagingInfo", pagingInfo);
		return "mainOther/specialEmp";
	}
	
	@RequestMapping("/speedList.ag")
	public String speedList(
			@ModelAttribute MainSearchVO searchVo,
			Model model){
		
		searchVo.setMainGrade("스피드");
		
		//1
		logger.info("스피드 공고 검색 결과, searchVo={}", searchVo);
		
		//2
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setRecordCountPerPage(25);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setBlockSize(pagingInfo.getBlockSize());
		searchVo.setRecordCountPerPage(pagingInfo.getRecordCountPerPage());
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("파라미터 ={}",searchVo);		
		List<RecVO> alist = mpService.searchByGrade(searchVo);
		logger.info("스피드 공고 조회 결과 alist.size()={}", alist.size());
		
		int totalRecord=mpService.selectTotalCount(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		
		//3				
		model.addAttribute("alist", alist);
		model.addAttribute("pagingInfo", pagingInfo);
		return "mainOther/speedEmp";
	}
}