package com.algoo.app.resume.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class ResumeDAOMybatis extends SqlSessionDaoSupport
	implements ResumeDAO{
	private String namespace = "com.mybatis.mapper.oracle.resume";
	
	@Override
	public int insertResume(ResumeVO resumeVo) {
		return getSqlSession().insert(namespace+".insertResume", resumeVo);
	}

}
