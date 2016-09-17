package com.algoo.app.resume.model;

import java.util.List;

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

	@Override
	public List<ResumeVO> selectResume() {
		return getSqlSession().selectList(namespace+".selectResume");
	}

}
