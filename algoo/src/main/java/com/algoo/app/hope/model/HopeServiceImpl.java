package com.algoo.app.hope.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HopeServiceImpl implements HopeService{
	@Autowired
	private HopeDAO hopeDao;
	
	@Override
	public int insertHope(HopeVO hopeVo) {
		return hopeDao.insertHope(hopeVo);
	}

	@Override
	public HopeVO selectHope(int hopeCode) {
		return hopeDao.selectHope(hopeCode);
	}

}
