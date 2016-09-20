package com.algoo.app.license.model;

public interface LicenseDAO {
	public int insertLicense(LicenseVO licenseVo);
	public LicenseVO selectLicense(int licenseCode);
}
