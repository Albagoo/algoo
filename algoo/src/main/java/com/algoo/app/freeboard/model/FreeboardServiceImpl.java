package com.algoo.app.freeboard.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FreeboardServiceImpl implements FreeboardService{
	
	@Autowired
	private FreeboardDAO freeDao;

	@Override
	public int insertFreeboard(FreeboardVO freeVo) {
		return freeDao.insertFreeboard(freeVo);
	}
}
