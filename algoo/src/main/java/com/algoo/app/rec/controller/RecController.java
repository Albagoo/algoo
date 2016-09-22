package com.algoo.app.rec.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.algoo.app.common.PaginationInfo;
import com.algoo.app.company.model.CompanyService;
import com.algoo.app.company.model.CompanyVO;
import com.algoo.app.rec.model.RecSeachVO;
import com.algoo.app.rec.model.RecService;
import com.algoo.app.rec.model.RecVO;
import com.algoo.app.service.model.ServiceService;
import com.algoo.app.service.model.ServiceVO;

@Controller
@RequestMapping("/rec")
public class RecController {

	public static final Logger logger
		=LoggerFactory.getLogger(RecController.class);
	
	@Autowired
	private RecService recService;
	@Autowired
	private CompanyService companyService;
	@Autowired
	private ServiceService serviceService;
	
	
	@RequestMapping("/recDetail.ag")
	public String recDetail(@RequestParam int recCode,
			Model model){
		//채용화면 보여주기
		//1
		logger.info("채용 화면 보여주기 recCode={}",recCode);
		//2
		RecVO recVo
		=recService.selectRecByCode(recCode);
		logger.info("상세보기조회결과 recCode={}",recVo);
		//회사정보 불러오기
		CompanyVO compVo
		=recService.selectCompanyByCode(recVo.getCompCode());
		logger.info("compVo={}",compVo);
		//서비스정보 불러오기
		ServiceVO serviceVo
		=recService.selectServiceByCode(recVo.getServiceCode());
		logger.info("serviceVo",serviceVo);
		
		//3
		model.addAttribute("recVo", recVo);
		model.addAttribute("compVo", compVo);
		model.addAttribute("serviceVo", serviceVo);
		return "rec/recDetail";
	}
	
	@RequestMapping(value="/recWrite.ag",
			method=RequestMethod.GET)
	public String recWrite_get(
			Model model){
		//채용공고 입력창 보여주기
		//1
		logger.info("채용공고 입력창 보여주기");
		//테스트용 회사코드 2
		int compCode=2;
		//2
		CompanyVO compVo
		=companyService.selectCompanyByCode(compCode);
		logger.info("compVo={}",compVo);
		//3
		model.addAttribute("compVo", compVo);
		return "rec/recWrite";
	}
	
	@RequestMapping(value="/recWrite.ag",
			method=RequestMethod.POST)
	public String recWrite_post(
			@ModelAttribute CompanyVO compVo,
			@ModelAttribute RecVO recVo,
			@RequestParam String days,
			@RequestParam String grade,
			Model model
			){
		//채용공고 입력처리하기
		//1
		logger.info("채용공고 처리하기,파라미터"
				+ "recVo={}", recVo);
		logger.info("서비스내용,파라미터"
				+ "days={},grade={}" 
				,days,grade);
		//2
		
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("grade", grade);
		map.put("days", days);
		
		serviceService.insertSevice(map);
		
		int res
		=recService.intsertRec(recVo,map);
		logger.info("채용정보등록결과,resVo={}",res);
		
		//3
		model.addAttribute("compVo", compVo);
		model.addAttribute("recVo", recVo);
		
		
		return "rec/recDetail";		
	}
	
	@RequestMapping("/recList.ag")
	public String recList(
			@ModelAttribute RecSeachVO searchVo,
			Model model){
		//1
		logger.info("채용 정보 보여주기");
		

		
		//근무지
		if(searchVo.getAreas()!=null && !searchVo.getAreas().isEmpty()){
			String[] areaArr=(searchVo.getAreas()).split(",");
			
			int cnt=areaArr.length;
				for (int i = 0; i < areaArr.length; i++) {
					if(areaArr[i].equals("전국전체")){
						areaArr[i]=" ";
					}
				}
				searchVo.setArea1(areaArr[0]);
				if(cnt>=2)searchVo.setArea2(areaArr[1]);
				if(cnt>=3)searchVo.setArea3(areaArr[2]);
				if(cnt>=4)searchVo.setArea4(areaArr[3]);
				if(cnt>=5)searchVo.setArea5(areaArr[4]);
			logger.info("동네={},갯수={}",searchVo.getAreas(),cnt);
		}
		//직종
		if(searchVo.getJobs()!=null && !searchVo.getJobs().isEmpty()){
			String[] JobArr=(searchVo.getJobs()).split(",");
			int cnt=JobArr.length;
			searchVo.setJob1(JobArr[0]);
			if(cnt>=2)searchVo.setJob2(JobArr[1]);
			if(cnt>=3)searchVo.setJob3(JobArr[2]);
			if(cnt>=4)searchVo.setJob4(JobArr[3]);
			if(cnt>=5)searchVo.setJob5(JobArr[4]);
			logger.info("직종={},갯수={}",searchVo.getJobs(),cnt);
			logger.info("searchVo={}",searchVo);
		}
		//근무기간
		String[] workTerms=searchVo.getWorkTerm();
		//근무요일
		//급여
		//고용형태
		String[] recruitTypes=searchVo.getRecruitType();
		//복리후생
		String[] welfares=searchVo.getWelfare();
		//학력조건
		//우대조건
		String[] preferences=searchVo.getPreference();
		//2

		/*List<RecSeachVO> recList=new ArrayList<RecSeachVO>();*/
		
		if(workTerms!=null){
			Map<String,Object> map = new HashMap<String, Object>();
			map.put("workTerm", workTerms);
			map.put("recruitType", recruitTypes);
			map.put("welfare", welfares);
			map.put("preference", preferences);
			searchVo.setMap(map);
		}
		
		
		//페이징 처리
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setRecordCountPerPage(20);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		
		searchVo.setBlockSize(pagingInfo.getBlockSize());
		searchVo.setRecordCountPerPage(pagingInfo.getRecordCountPerPage());
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("파라미터 ={}",searchVo);		
		List<RecVO> alist = recService.selectAllRec(searchVo);
		logger.info("채용정보 목록 조회 결과 alist.size()={}", alist.size());
		//전체갯수구하기
		int totalRecord=recService.selectTotalCount(searchVo);
		pagingInfo.setTotalRecord(totalRecord);
		//3				
		model.addAttribute("alist", alist);
		model.addAttribute("pagingInfo", pagingInfo);
		return "rec/recList";
	}
	
	@RequestMapping("/updateCount.ag")
	public String updateCount(
			@RequestParam(defaultValue="0") int recCode,
			Model model){
		
		logger.info("채용정보 조회수 증가, 파라미터 recCode = {}", recCode);
		
		if(recCode==0){
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/rec/recList.ag");
			
			return "common/message";
		}
		
		int cnt=recService.updateReadCount(recCode);
		logger.info("채용정보 조회수 증가 결과, cnt = {}", cnt);

		return "redirect:/rec/recDetail.ag?recCode="+recCode;
	}
	@RequestMapping("/test.ag")
	public void test(){
		
	}
	
	
	/*@RequestMapping("/getSubwayStation.ag")
	public void getKwrdFndSubwaySttnList(
			HttpServletRequest request,
			HttpServletResponse response,
			Model model){
		
		getKwrdFndSubwaySttnList(subwayStationName)
		
	}*/
}
