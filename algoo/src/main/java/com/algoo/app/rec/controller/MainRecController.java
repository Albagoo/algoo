package com.algoo.app.rec.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.algoo.app.common.PaginationInfo;
import com.algoo.app.company.model.CompanyService;
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

	@RequestMapping("/specialList.ag")
	public String specialList(
			@ModelAttribute RecSeachVO searchVo,
			Model model){
		//1
		logger.info("채용 정보 보여주기");
		
		if(searchVo.getAreas()!=null && !searchVo.getAreas().isEmpty()){
			String[] areaArr=(searchVo.getAreas()).split(",");
			
			int cnt=areaArr.length;
			
				searchVo.setArea1(areaArr[0]);
				if(cnt>=2)searchVo.setArea2(areaArr[1]);
				if(cnt>=3)searchVo.setArea3(areaArr[2]);
				if(cnt>=4)searchVo.setArea4(areaArr[3]);
				if(cnt>=5)searchVo.setArea5(areaArr[4]);
			
			logger.info("동네={},갯수={}",searchVo.getAreas(),cnt);
			logger.info("area1={},area2={}",searchVo.getArea1(),searchVo.getArea2());
			logger.info("area3={},area4={}",searchVo.getArea3(),searchVo.getArea4());
			
		}
		//2

		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setRecordCountPerPage(25);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setBlockSize(pagingInfo.getBlockSize());
		searchVo.setRecordCountPerPage(pagingInfo.getRecordCountPerPage());
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("파라미터 ={}",searchVo);		
		List<RecVO> alist = recService.selectAllRec(searchVo);
		logger.info("FAQ 목록 조회 결과 alist.size()={}", alist.size());
		
		int totalRecord=recService.selectTotalCount(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		//3				
		model.addAttribute("alist", alist);
		model.addAttribute("pagingInfo", pagingInfo);
		return "mainOther/mainEmp";
	}
	
	@RequestMapping("/speedList.ag")
	public String speedList(
			@ModelAttribute RecSeachVO searchVo,
			Model model){
		//1
		logger.info("채용 정보 보여주기");
		
		if(searchVo.getAreas()!=null && !searchVo.getAreas().isEmpty()){
			String[] areaArr=(searchVo.getAreas()).split(",");
			
			int cnt=areaArr.length;
			
				searchVo.setArea1(areaArr[0]);
				if(cnt>=2)searchVo.setArea2(areaArr[1]);
				if(cnt>=3)searchVo.setArea3(areaArr[2]);
				if(cnt>=4)searchVo.setArea4(areaArr[3]);
				if(cnt>=5)searchVo.setArea5(areaArr[4]);
			
			logger.info("동네={},갯수={}",searchVo.getAreas(),cnt);
			logger.info("area1={},area2={}",searchVo.getArea1(),searchVo.getArea2());
			logger.info("area3={},area4={}",searchVo.getArea3(),searchVo.getArea4());
			
		}
		//2

		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setRecordCountPerPage(8);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setBlockSize(pagingInfo.getBlockSize());
		searchVo.setRecordCountPerPage(pagingInfo.getRecordCountPerPage());
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("파라미터 ={}",searchVo);		
		List<RecVO> alist = recService.selectAllRec(searchVo);
		logger.info("FAQ 목록 조회 결과 alist.size()={}", alist.size());
		
		int totalRecord=recService.selectTotalCount(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		//3				
		model.addAttribute("alist", alist);
		model.addAttribute("pagingInfo", pagingInfo);
		return "mainOther/speedEmp";
	}
}