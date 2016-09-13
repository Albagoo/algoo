package com.algoo.app.computerability.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class ComputerAbilityDAOMybatis extends SqlSessionDaoSupport
	implements ComputerAbilityDAO{
	private String namespace = "com.mybatis.mapper.oracle.computerability";
	
	@Override
	public int insertComputerAbility(ComputerAbilityVO computerAbilityVo) {
		return getSqlSession().insert(namespace+".insertComputerAbility", computerAbilityVo);
	}
	
}
