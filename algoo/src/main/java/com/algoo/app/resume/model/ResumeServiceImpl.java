package com.algoo.app.resume.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ResumeServiceImpl implements ResumeService{
	
	@Autowired
	private ResumeDAO resumeDao;
	
	@Override
	public int insertResume(ResumeVO resumeVo) {
		return resumeDao.insertResume(resumeVo);
	}

}
