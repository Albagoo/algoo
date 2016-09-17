package com.algoo.app.resume.model;

import java.util.List;

public interface ResumeDAO {
	public int insertResume(ResumeVO resumeVo);
	public List<ResumeVO> selectResume();
}
