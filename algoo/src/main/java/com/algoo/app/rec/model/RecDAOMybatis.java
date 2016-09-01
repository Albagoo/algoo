package com.algoo.app.rec.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.algoo.app.company.model.CompanyVO;
import com.algoo.app.service.model.ServiceVO;


@Repository
public class RecDAOMybatis extends SqlSessionDaoSupport
implements RecDAO{

	private String namespace="com.mybatis.mapper.oracle.rec";
	
	@Override
	public RecVO selectRecByCode(String recCode) {
		return getSqlSession().selectOne(namespace+
				".selectRecByCode", recCode);
	}

	@Override
	public CompanyVO selectCompanyByCode(String compCode) {
		return getSqlSession().selectOne(namespace+
				".selectCompanyByCode", compCode);
	}

	@Override
	public ServiceVO selectServiceByCode(String serviceCode) {
		return getSqlSession().selectOne(namespace+
				".selectServiceByCode",serviceCode);
	}

}
