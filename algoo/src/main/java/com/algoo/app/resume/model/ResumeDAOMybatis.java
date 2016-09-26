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

	/*@Override
	public List<ResumeVO> selectResume(ResumeSearchVO resumeSearchVo) {
		return getSqlSession().selectList(namespace+".selectResume", resumeSearchVo);
	}*/
	@Override
	public List<ResumeListVO> selectResume(ResumeSearchVO resumeSearchVo) {
		return getSqlSession().selectList(namespace+".selectResume", resumeSearchVo);
	}

	@Override
	public ResumeVO selectResumeByCode(int hisCode) {
		return getSqlSession().selectOne(namespace+".selectResumeByCode", hisCode);
	}

	@Override
	public List<ResumeListVO> selectResumeCount(ResumeSearchVO resumeSearchVo) {
		return getSqlSession().selectList(namespace+".selectResumeCount",resumeSearchVo);
	}

	@Override
	public List<ResumeVO> selectResumeByMemberCode(String memberCode) {
		return getSqlSession().selectList(namespace+".selectResumeByMemberCode", memberCode);
	}

}
