package com.algoo.app.license.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class LicenseDAOMybatis extends SqlSessionDaoSupport
	implements LicenseDAO{
	private String namespace = "com.mybatis.mapper.oracle.license";

	@Override
	public int insertLicense(LicenseVO licenseVo) {
		return getSqlSession().insert(namespace+".insertLicense", 
				licenseVo);
	}

	@Override
	public LicenseVO selectLicense(int licenseCode) {
		return getSqlSession().selectOne(namespace+".selectLicense", 
				licenseCode);
	}


}
