package com.algoo.app.company.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.algoo.app.commem.model.CommemDAO;

@Service
public class CompanyServiceImpl implements CompanyService {

	@Autowired
	private CompanyDAO CompanyDao;
	
	@Autowired CommemDAO commemDao;
	
	@Override
	public List<CompanyVO> selectAllCompany() {
		return CompanyDao.selectAllCompany();
	}

	@Override
	public CompanyVO selectCompanyByCode(int compCode) {
		return CompanyDao.selectCompanyByCode(compCode);
	}

	@Override
	public int insertCompany(CompanyVO companyVo) {
		return CompanyDao.insertCompany(companyVo);
	}

	@Override
	public CompanyVO selectCompanyByUserid(String userid) {
		int compCode = commemDao.selectCompCode(userid);
		return CompanyDao.selectCompanyByCode(compCode);
	}
	
}
