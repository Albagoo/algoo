package com.algoo.app.rec.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.algoo.app.company.model.CompanyVO;
import com.algoo.app.service.model.ServiceVO;

@Service
public class RecServiceImpl implements RecService{

	@Autowired
	private RecDAO recDao;

	@Override
	public RecVO selectRecByCode(String recCode) {
		return recDao.selectRecByCode(recCode);
	}

	@Override
	public CompanyVO selectCompanyByCode(String compCode) {
		return recDao.selectCompanyByCode(compCode);
	}

	@Override
	public ServiceVO selectServiceByCode(String serviceCode) {
		return recDao.selectServiceByCode(serviceCode);
	}
}
