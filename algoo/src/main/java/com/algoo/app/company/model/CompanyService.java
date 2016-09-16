package com.algoo.app.company.model;

import java.util.List;

public interface CompanyService {

	public List<CompanyVO> selectAllCompany();
	public CompanyVO selectCompanyByCode(int compCode);
	public int insertCompany(CompanyVO companyVo);
	public CompanyVO selectCompanyByUserid(String userid);
	public int updateCompany(CompanyVO companyVo);
}
