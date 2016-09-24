package com.algoo.app.resume.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.algoo.app.career.model.CareerService;
import com.algoo.app.career.model.CareerVO;
import com.algoo.app.computerability.model.ComputerAbilityService;
import com.algoo.app.computerability.model.ComputerAbilityVO;
import com.algoo.app.hope.model.HopeService;
import com.algoo.app.hope.model.HopeVO;
import com.algoo.app.language.model.LanguageService;
import com.algoo.app.language.model.LanguageVO;
import com.algoo.app.license.model.LicenseService;
import com.algoo.app.license.model.LicenseVO;
import com.algoo.app.personalInfo.model.PersonalInfoService;
import com.algoo.app.personalInfo.model.PersonalInfoVO;

@Service
public class ResumeServiceImpl implements ResumeService{
	private static final Logger logger
		= LoggerFactory.getLogger(ResumeServiceImpl.class);
	
	@Autowired
	private ResumeDAO resumeDao;
	@Autowired
	private HopeService hopeService;
	@Autowired
	private CareerService careerService;
	@Autowired
	private LanguageService languageService;
	@Autowired
	private LicenseService licenseService;
	@Autowired
	private ComputerAbilityService computerAbilityService;
	@Autowired
	private PersonalInfoService personalInfoService;
	
	@Override
	@Transactional
	public int insertResume(ResumeVO resumeVo, HopeVO hopeVo, CareerVO careerVo
			, LanguageVO languageVo, LicenseVO licenseVo, ComputerAbilityVO computerAbilityVo
			, PersonalInfoVO personalInfoVo) {
		
		
		int cnt = hopeService.insertHope(hopeVo);
		
		if(cnt > 0){
			resumeVo.setHopeCode(hopeVo.getHopeCode());
		}
		
		if(careerVo.getCareerB().equals("Y")){
			cnt = careerService.insertCareer(careerVo);
			if(cnt > 0){
				resumeVo.setCareerCode(careerVo.getCareerCode());
			}
		}
		
		if(languageVo.getLanguageB().equals("Y")){
			cnt = languageService.insertLanguage(languageVo);
			
			if(cnt > 0){
				resumeVo.setLanguageCode(languageVo.getLanguageCode());
			}
		}
		
		if(licenseVo.getLicenseB().equals("Y")){
			cnt = licenseService.insertLicense(licenseVo);
			if(cnt > 0){
				resumeVo.setLicenseCode(licenseVo.getLicenseCode());
			}
		}
		
		
		if(computerAbilityVo.getComputerAbilityB().equals("Y")){
			cnt = computerAbilityService.insertComputerAbility(computerAbilityVo);
			
			if(cnt > 0){
				resumeVo.setComAbilityCode(computerAbilityVo.getComAbilityCode());
			}
		}
		if(personalInfoVo.getPersonalInfoB().equals("Y")){
			cnt = personalInfoService.insertPersonalInfo(personalInfoVo);
			
			if(cnt > 0){
				resumeVo.setPersonalInfoCode(personalInfoVo.getPersonalInfoCode());
			}
		}
		logger.info("resumeVo = {}", resumeVo);
		
		return resumeDao.insertResume(resumeVo);
	}

	/*@Override
	public List<ResumeVO> selectResume(ResumeSearchVO resumeSearchVo) {
		return resumeDao.selectResume(resumeSearchVo);
	}*/
	@Override
	public List<ResumeListVO> selectResume(ResumeSearchVO resumeSearchVo) {
		return resumeDao.selectResume(resumeSearchVo);
	}

	@Override
	public Map<String, Object> selectResumeByCode(int hisCode) {
		Map<String, Object> alist = new HashMap<String, Object>();
		
		ResumeVO resumeVo = resumeDao.selectResumeByCode(hisCode);
		alist.put("resumeVo", resumeVo);
		
		if(resumeVo.getCareerCode() != 0){
			CareerVO careerVo = careerService.selectCareer(resumeVo.getCareerCode());
			alist.put("careerVo", careerVo);
		}
		
		if(resumeVo.getComAbilityCode() != 0){
			ComputerAbilityVO computerAbilityVo 
				= computerAbilityService.selectComputerAbility(resumeVo.getComAbilityCode());
			alist.put("computerAbilityVo", computerAbilityVo);
		}
		
		if(resumeVo.getHopeCode() != 0){
			HopeVO hopeVo = hopeService.selectHope(resumeVo.getHopeCode());
			alist.put("hopeVo", hopeVo);
		}
		
		if(resumeVo.getLanguageCode() != 0){
			LanguageVO languageVo = languageService.selectLanguage(resumeVo.getLanguageCode());
			alist.put("languageVo", languageVo);
		}
		
		if(resumeVo.getLicenseCode() != 0){
			LicenseVO licenseVo = licenseService.selectLicense(resumeVo.getLicenseCode());
			alist.put("licenseVo", licenseVo);
		}
		
		if(resumeVo.getPersonalInfoCode() != 0){
			PersonalInfoVO personalInfoVo = personalInfoService.selectPersonalInfo(resumeVo.getPersonalInfoCode());
			alist.put("personalInfoVo", personalInfoVo);
		}
		
		return alist;
	}

	@Override
	public int selectResumeCount(ResumeSearchVO resumeSearchVo) {
		return resumeDao.selectResumeCount(resumeSearchVo);
	}

}
