package com.algoo.app.resume.model;

import com.algoo.app.career.model.CareerVO;
import com.algoo.app.computerability.model.ComputerAbilityVO;
import com.algoo.app.hope.model.HopeVO;
import com.algoo.app.language.model.LanguageVO;
import com.algoo.app.license.model.LicenseVO;
import com.algoo.app.personalInfo.model.PersonalInfoVO;

public interface ResumeService {
	public int insertResume(ResumeVO resumeVo, HopeVO hopeVo, CareerVO careerVo
			, LanguageVO languageVo, LicenseVO licenseVo, ComputerAbilityVO computerAbilityVo
			, PersonalInfoVO personalInfoVo);	
}