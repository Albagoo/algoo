package com.algoo.app.hope.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class HopeDAOMybatis extends SqlSessionDaoSupport
	implements HopeDAO{
	private String namespace = "com.mybatis.mapper.oracle.hope";
	
	@Override
	public int insertHope(HopeVO hopeVo) {
		return getSqlSession().insert(namespace+".insertHope", 
				hopeVo);
	}
	
	
}
