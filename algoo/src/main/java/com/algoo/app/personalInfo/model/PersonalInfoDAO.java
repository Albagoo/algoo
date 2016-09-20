package com.algoo.app.personalInfo.model;

public interface PersonalInfoDAO {
	public int insertPersonalInfo(PersonalInfoVO personalInfoVo);
	public PersonalInfoVO selectPersonalInfo(int personalInfoCode);
}
