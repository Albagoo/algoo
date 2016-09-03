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
	public RecVO selectRecByCode(int recCode) {
		return recDao.selectRecByCode(recCode);
	}

	@Override
	public CompanyVO selectCompanyByCode(int compCode) {
		return recDao.selectCompanyByCode(compCode);
	}

	@Override
	public ServiceVO selectServiceByCode(int serviceCode) {
		return recDao.selectServiceByCode(serviceCode);
	}

	@Override
	public int intsertRec(RecVO vo) {
		return recDao.intsertRec(vo);
	}
}
