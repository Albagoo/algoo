package com.algoo.app.license.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LicenseServiceImpl implements LicenseService{
	
	@Autowired
	private LicenseDAO licenseDao;

	@Override
	public int insertLicense(LicenseVO licenseVo) {
		return licenseDao.insertLicense(licenseVo);
	}

}
