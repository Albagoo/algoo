package com.algoo.app.service.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class ServiceServiceImpl implements ServiceService {

	@Autowired
	private ServiceDAO ServiceDao;

/*	@Override
	public int insertSevice(ServiceVO vo) {
		return ServiceDao.insertSevice(vo);
	}

	@Override
	public ServiceVO selectByNew() {
		return ServiceDao.selectByNew();
	}
	
	*/
}
