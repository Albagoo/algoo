package com.algoo.app.company.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	private CompanyDAO CompanyDao;

	@Override
	public List<CompanyVO> selectAllCompany() {
		return CompanyDao.selectAllCompany();
	}

	@Override
	public CompanyVO selectCompanyByCode(int compCode) {
		return CompanyDao.selectCompanyByCode(compCode);
	}
	
}
