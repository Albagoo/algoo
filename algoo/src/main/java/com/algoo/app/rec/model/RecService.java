package com.algoo.app.rec.model;

import com.algoo.app.company.model.CompanyVO;
import com.algoo.app.service.model.ServiceVO;

public interface RecService{
	public RecVO selectRecByCode(int recCode);
	public CompanyVO selectCompanyByCode(int i);
	public ServiceVO selectServiceByCode(int i);
	public int intsertRec(RecVO vo);
}
