package com.algoo.app.personalInfo.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class PersonalInfoDAOMybatis extends SqlSessionDaoSupport
	implements PersonalInfoDAO{
	private String namespace = "com.mybatis.mapper.oracle.personalinfo";

	@Override
	public int insertPersonalInfo(PersonalInfoVO personalInfoVo) {
		return getSqlSession().insert(namespace+".insertPersonalInfo", personalInfoVo);
	}

	@Override
	public PersonalInfoVO selectPersonalInfo(int personalInfoCode) {
		return getSqlSession().selectOne(namespace+".selectPersonalInfo", personalInfoCode);
	}
	
	
}
