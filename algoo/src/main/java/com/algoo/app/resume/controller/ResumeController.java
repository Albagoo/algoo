package com.algoo.app.resume.controller;

import java.io.File;
import java.util.HashMap;
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

import com.algoo.app.career.model.CareerVO;
import com.algoo.app.common.FileUploadWebUtil;
import com.algoo.app.common.PaginationInfo;
import com.algoo.app.computerability.model.ComputerAbilityVO;
import com.algoo.app.hope.model.HopeVO;
import com.algoo.app.language.model.LanguageVO;
import com.algoo.app.license.model.LicenseVO;
import com.algoo.app.member.model.MemberService;
import com.algoo.app.member.model.MemberVO;
import com.algoo.app.personalInfo.model.PersonalInfoVO;
import com.algoo.app.resume.model.ResumeListVO;
import com.algoo.app.resume.model.ResumeSearchVO;
import com.algoo.app.resume.model.ResumeService;
import com.algoo.app.resume.model.ResumeVO;

@Controller
@RequestMapping("/resume")
public class ResumeController {
	private static final Logger logger
		= LoggerFactory.getLogger(ResumeController.class);
	
	@Autowired
	private ResumeService resumeService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private FileUploadWebUtil fileUtil;
	
	@RequestMapping(value="/write.ag", method=RequestMethod.GET)
	public String resumeWrite_get(
			HttpSession session,
			Model model){
		String userid = (String)session.getAttribute("userid");
		
		MemberVO memberVo = memberService.selectMemberByUserid(userid);
		
		logger.info("resumeWrite_get()핸들러 진입");
		model.addAttribute("memberVo", memberVo);
		
		return "resume/write";
	}
	
	@RequestMapping(value="/imageUp.ag")
	public void imageUp_get(){
	}
	
	@RequestMapping(value="/imageUp2.ag")
	@ResponseBody
	public int imageUp_post(
			@ModelAttribute MemberVO memberVo,
			HttpServletRequest request){
		logger.info("imageUp_post() 메서드 진입");
		
		List<Map<String, Object>> fileList 
			= fileUtil.FileUpload(request, FileUploadWebUtil.IMAGE_UPLOAD);
		logger.info("업로드 파일 fileList.size() = {}"
				, fileList.size());
		
		if(memberVo.getPhoto() != null
					&& !memberVo.getPhoto().isEmpty()){
			//기존 파일이 존재하면, 기존 파일 삭제
			String upPath = fileUtil.getUploadPath(request, FileUploadWebUtil.IMAGE_UPLOAD);
			String oldFileName = memberVo.getPhoto();
			File oldFile = new File(upPath, oldFileName);
			if(oldFile.exists()){
				boolean bool = oldFile.delete();
				logger.info("기존 파일 삭제 여부 = {}", bool);
			}
		}
		
		//업로드된 파일명 구해오기
		String fileName = "";
		long fileSize = 0;
		for(Map<String, Object> mymap : fileList){
			fileName = (String)mymap.get("fileName");
			fileSize = (Long)mymap.get("fileSize");
		}
		memberVo.setPhoto(fileName);
		logger.info("memberVo = {}", memberVo);
		
		int cnt = memberService.updatePhoto(memberVo);
		logger.info("사진 등록 결과 cnt ={}", cnt);
		
		return cnt;
		
		
	}
	
	@RequestMapping(value="/write.ag", method=RequestMethod.POST)
	public String resumeWrite_post(
			@ModelAttribute ResumeVO resumeVo,
			@ModelAttribute HopeVO hopeVo,
			@ModelAttribute CareerVO careerVo,
			@ModelAttribute LanguageVO languageVo,
			@ModelAttribute LicenseVO licenseVo,
			@ModelAttribute ComputerAbilityVO computerAbilityVo,
			@ModelAttribute PersonalInfoVO personalInfoVo,
			Model model){
		logger.info("resumeWrite_post()핸들러 진입, 파라미터 resumeVo = {}"
				, resumeVo);
		logger.info("resumeWrite_post()핸들러 진입, 파라미터 hopeVo = {}"
				, hopeVo);
		logger.info("resumeWrite_post()핸들러 진입, 파라미터 careerVo = {}"
				, careerVo);
		logger.info("resumeWrite_post()핸들러 진입, 파라미터 languageVo = {}"
				, languageVo);
		logger.info("resumeWrite_post()핸들러 진입, 파라미터 licenseVo = {}"
				, licenseVo);
		logger.info("resumeWrite_post()핸들러 진입, 파라미터 computerAbilityVo = {}"
				, computerAbilityVo);
		logger.info("resumeWrite_post()핸들러 진입, 파라미터 personalInfoVo = {}"
				, personalInfoVo);
		
		int cnt = resumeService.insertResume(resumeVo, hopeVo, careerVo, languageVo
					, licenseVo, computerAbilityVo, personalInfoVo);
		
		logger.info("이력서 입력 결과 cnt = {}", cnt , resumeVo);
		
		String msg = "", url = "";
		if(cnt>0){
			msg = "이력서 등록 성공!!";
			url = "/index.ag";
		}else{
			msg = "이력서 등록 실패";
			url = "/resume/write.ag";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/list.ag")
	public String list(
			@RequestParam(value="period_checks", defaultValue="") String period_checks,
			@ModelAttribute ResumeSearchVO resumeSearchVo,
			Model model){
		//경력기간 초기화실패 대비용
		if(period_checks==null){
			period_checks="";
		}
		
		//직종
		if(resumeSearchVo.getTypes()!=null && !resumeSearchVo.getTypes().isEmpty()){
			String[] TypeArr=(resumeSearchVo.getTypes()).split(",");
			int cnt=TypeArr.length;
			resumeSearchVo.setType1(TypeArr[0]);
			if(cnt>=2)resumeSearchVo.setType2(TypeArr[1]);
			if(cnt>=3)resumeSearchVo.setType3(TypeArr[2]);
			if(cnt>=4)resumeSearchVo.setType4(TypeArr[3]);
			if(cnt>=5)resumeSearchVo.setType5(TypeArr[4]);
			logger.info("직종={},갯수={}",resumeSearchVo.getTypes(),cnt);
			logger.info("resumeSearchVo={}",resumeSearchVo);
		}
		
		
		String[] category=resumeSearchVo.getCategorys();
		
		if(category!=null){
			Map<String, Object> map= new HashMap<String, Object>();
			
			map.put("categorys", category);
			resumeSearchVo.setMap(map);
		}
 		
		
		logger.info("resumeSearchVo={}",resumeSearchVo);
		logger.info("period_checks={}",period_checks);
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(10);
		pagingInfo.setCurrentPage(resumeSearchVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(10);
		
		resumeSearchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		resumeSearchVo.setRecordCountPerPage(10);
		/*resumeSearchVo.setBlockSize(pagingInfo.getBlockSize());
		resumeSearchVo.setCurrentPage(pagingInfo.getCurrentPage());*/
		
/*		List<ResumeVO> alist = resumeService.selectResume(resumeSearchVo);*/
		List<ResumeListVO> alist = resumeService.selectResume(resumeSearchVo);
		List<ResumeListVO> tlist = resumeService.selectResumeCount(resumeSearchVo);
		int cnt=0;
		if(tlist!=null){
		for(int i=0;i<tlist.size();i++){
			String peri=tlist.get(i).getPeriod();
			if(peri.indexOf(period_checks)!=-1){
				cnt++;
			};
		}
		}
		logger.info("궁금해서찍어봄={},cnt={}",tlist.size(),cnt);
		int totalRecord = cnt;
		
		pagingInfo.setTotalRecord(totalRecord);
		logger.info("totalRecord={}",totalRecord);
		model.addAttribute("pagingInfo", pagingInfo);
		model.addAttribute("alist", alist);
		model.addAttribute("perioded", period_checks);
		return "resume/list";
	}
	
	@RequestMapping("/detail.ag")
	public String detail(
			@RequestParam(defaultValue="0") int hisCode,
			Model model){
		
		Map<String, Object> alist = resumeService.selectResumeByCode(hisCode);
		
		ResumeVO resumeVo = (ResumeVO)alist.get("resumeVo");
		
		MemberVO memberVo = memberService.selectMemberByCode(resumeVo.getMemberCode());
		
		String detail = resumeVo.getDetail();
		
		String[] detailArr = null;
		int length = 0;
		if(detail != null && !detail.isEmpty()){
			detailArr = detail.split(",");
			
			length = detailArr.length;
		}
		
		logger.info("alist = {}" , alist);
		
		model.addAttribute("resumeVo", resumeVo);
		model.addAttribute("hopeVo", alist.get("hopeVo"));
		model.addAttribute("languageVo", alist.get("languageVo"));
		model.addAttribute("licenseVo", alist.get("licenseVo"));
		model.addAttribute("careerVo", alist.get("careerVo"));
		model.addAttribute("computerAbilityVo", alist.get("computerAbilityVo"));
		model.addAttribute("personalInfoVo", alist.get("personalInfoVo"));
		model.addAttribute("memberVo", memberVo);
		model.addAttribute("length", length);
		
		return "resume/detail";
	}
}
