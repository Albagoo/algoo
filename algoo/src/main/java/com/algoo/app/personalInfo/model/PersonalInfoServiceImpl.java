package com.algoo.app.personalInfo.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PersonalInfoServiceImpl implements PersonalInfoService{
	@Autowired
	private PersonalInfoDAO personalInfoDao;

	@Override
	public int insertPersonalInfo(PersonalInfoVO personalInfoVo) {
		return personalInfoDao.insertPersonalInfo(personalInfoVo);
	}
	
	
}
