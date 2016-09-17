package com.algoo.app.resume.controller;

import java.io.File;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.algoo.app.career.model.CareerVO;
import com.algoo.app.common.FileUploadWebUtil;
import com.algoo.app.computerability.model.ComputerAbilityVO;
import com.algoo.app.hope.model.HopeVO;
import com.algoo.app.language.model.LanguageVO;
import com.algoo.app.license.model.LicenseVO;
import com.algoo.app.member.model.MemberService;
import com.algoo.app.member.model.MemberVO;
import com.algoo.app.personalInfo.model.PersonalInfoVO;
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
		logger.info("메서드 들어왔당!!");
		
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
			@ModelAttribute PersonalInfoVO personalInfoVo){
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
		
		return "redirect:/resume/list.ag";
	}
	
	@RequestMapping("/list.ag")
	public String list(Model model){
		
		List<ResumeVO> alist = resumeService.selectResume();
		
		model.addAttribute("alist", alist);
		
		return "resume/list";
	}
}
