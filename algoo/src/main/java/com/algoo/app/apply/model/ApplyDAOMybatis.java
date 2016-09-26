package com.algoo.app.apply.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class ApplyDAOMybatis extends SqlSessionDaoSupport
	implements ApplyDAO{
	private String namespace = "com.mybatis.mapper.oracle.apply";
	
	@Override
	public int insertApply(ApplyVO applyVo) {
		return getSqlSession().insert(namespace+".insertApply", applyVo);
	}

	@Override
	public List<ApplyViewVO> selectMemberCode(String memberCode) {
		return getSqlSession().selectList(namespace+".selectMemberCode", memberCode);
	}
	
	
}
