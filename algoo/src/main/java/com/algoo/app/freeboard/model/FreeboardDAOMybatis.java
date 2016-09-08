package com.algoo.app.freeboard.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class FreeboardDAOMybatis extends SqlSessionDaoSupport implements FreeboardDAO{
	private String namespace="com.mybatis.mapper.oracle.freeboard";

	@Override
	public int insertFreeboard(FreeboardVO freeVo) {
		return getSqlSession().insert(namespace+".insertFreeboard", freeVo);
	}
}
