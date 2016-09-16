package com.algoo.app.company.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
@Repository
public class CompanyDAOMybatis extends SqlSessionDaoSupport
implements CompanyDAO{

	private String namespace="com.mybatis.mapper.oracle.company";
	
	@Override
	public List<CompanyVO> selectAllCompany() {
		return getSqlSession().selectList(namespace
				+".selectAllCompany");
	}

	@Override
	public CompanyVO selectCompanyByCode(int compCode) {
		return getSqlSession().selectOne(namespace+
				".selectCompanyByCode",compCode);
	}

	@Override
	public int insertCompany(CompanyVO companyVo) {
		return getSqlSession().insert(namespace+".insertCompany", companyVo);
	}

	
}
