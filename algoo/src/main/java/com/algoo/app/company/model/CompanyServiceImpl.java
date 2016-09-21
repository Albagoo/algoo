package com.algoo.app.company.model;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.algoo.app.commem.model.CommemDAO;

@Service
public class CompanyServiceImpl implements CompanyService {
	private static final Logger logger
		= LoggerFactory.getLogger(CompanyService.class);
	
	@Autowired
	private CompanyDAO CompanyDao;
	
	@Autowired 
	private CommemDAO commemDao;
	
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
		logger.info(""+userid+","+commemDao);
		int compCode = commemDao.selectCompCode(userid);
		logger.info(""+compCode);
		return CompanyDao.selectCompanyByCode(compCode);
	}

	@Override
	public int updateCompany(CompanyVO companyVo) {
		return CompanyDao.updateCompany(companyVo);
	}
	
}
