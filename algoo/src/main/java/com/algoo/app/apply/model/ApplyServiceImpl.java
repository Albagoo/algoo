package com.algoo.app.apply.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ApplyServiceImpl implements ApplyService{

	@Autowired
	private ApplyDAO applyDao;
	
	@Override
	public int insertApply(ApplyVO applyVo) {
		return applyDao.insertApply(applyVo);
	}

}
