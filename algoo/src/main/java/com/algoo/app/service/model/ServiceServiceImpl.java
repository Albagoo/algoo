package com.algoo.app.service.model;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class ServiceServiceImpl implements ServiceService {

	@Autowired
	private ServiceDAO ServiceDao;

	@Override
	public int insertSevice(Map<String, Object> map) {
		return ServiceDao.insertSevice(map);
	}

	@Override
	public int selectByNew() {
		return ServiceDao.selectByNew();
	}

	
	
	
}
