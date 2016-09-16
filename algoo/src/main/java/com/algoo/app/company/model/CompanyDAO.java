package com.algoo.app.company.model;

import java.util.List;

public interface CompanyDAO {

	public List<CompanyVO> selectAllCompany();
	public CompanyVO selectCompanyByCode(int compCode);
	public int insertCompany(CompanyVO companyVo);
	public int updateCompany(CompanyVO companyVo);
}
