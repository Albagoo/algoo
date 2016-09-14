package com.algoo.app.career.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CareerDAOMybatis extends SqlSessionDaoSupport
	implements CareerDAO{
	private String namespace = "com.mybatis.mapper.oracle.career";
	
	@Override
	public int insertCareer(CareerVO careerVo) {
		return getSqlSession().insert(namespace+".insertCareer", careerVo);
	}

}
