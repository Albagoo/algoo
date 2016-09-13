package com.algoo.app.resume.model;

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
		
		cnt = careerService.insertCareer(careerVo);
		
		if(cnt > 0){
			resumeVo.setCareerCode(careerVo.getCareerCode());
		}
		
		cnt = languageService.insertLanguage(languageVo);
		
		if(cnt > 0){
			resumeVo.setLanguageCode(languageVo.getLanguageCode());
		}
		
		cnt = licenseService.insertLicense(licenseVo);
		
		if(cnt > 0){
			resumeVo.setLicenseCode(licenseVo.getLicenseCode());
		}
		
		cnt = computerAbilityService.insertComputerAbility(computerAbilityVo);
		
		if(cnt > 0){
			resumeVo.setComAbilityCode(computerAbilityVo.getComAbilityCode());
		}
		
		cnt = personalInfoService.insertPersonalInfo(personalInfoVo);
		
		if(cnt > 0){
			resumeVo.setPersonalInfoCode(personalInfoVo.getPersonalInfoCode());
		}
		
		return resumeDao.insertResume(resumeVo);
	}

}
