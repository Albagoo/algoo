package com.algoo.app.resume.model;

import java.util.List;

public interface ResumeDAO {
	public int insertResume(ResumeVO resumeVo);
/*	public List<ResumeVO> selectResume(ResumeSearchVO resumeSearchVo);*/
	public List<ResumeListVO> selectResume(ResumeSearchVO resumeSearchVo);
	public ResumeVO selectResumeByCode(int hisCode);
	public List<ResumeListVO> selectResumeCount(ResumeSearchVO resumeSearchVo);
	public List<ResumeVO> selectResumeByMemberCode(String memberCode);
}
