package com.algoo.app.personalInfo.model;

public interface PersonalInfoService {
	public int insertPersonalInfo(PersonalInfoVO personalInfoVo);
	public PersonalInfoVO selectPersonalInfo(int personalInfoCode);
}
