package com.algoo.app.license.model;

public interface LicenseService {
	public int insertLicense(LicenseVO licenseVo);
	public LicenseVO selectLicense(int licenseCode);
}
