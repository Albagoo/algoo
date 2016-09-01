package com.algoo.app.rec.model;

import com.algoo.app.company.model.CompanyVO;
import com.algoo.app.service.model.ServiceVO;

public interface RecDAO {
	public RecVO selectRecByCode(String recCode);
	public CompanyVO selectCompanyByCode(String compCode);
	public ServiceVO selectServiceByCode(String serviceCode);
}
