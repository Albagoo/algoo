package com.algoo.app.commem.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CommemDAOMybatis extends SqlSessionDaoSupport
	implements CommemDAO{
	
	private String namespace="com.mybatis.mapper.oracle.commem";

	@Override
	public int insertCompMember(CommemVO commemVo) {
		return getSqlSession().insert(namespace+".insertCompMember", commemVo);
	}

	@Override
	public String loginCheck(CommemVO commemVo) {
		return getSqlSession().selectOne(namespace+".selectPwd", commemVo);
	}

	@Override
	public int checkUserid(String userid) {
		return getSqlSession().selectOne(namespace+".selectCountUserid", userid);
	}
}
