package com.algoo.app.license.model;

public class LicenseVO {
	private int licenseCode; /* 구분코드 */
	private String licenseName; /* 자격증 */
	private String collicensePlace; /* 발행처 */
	private String licenseB;
	
	public int getLicenseCode() {
		return licenseCode;
	}
	public String getLicenseB() {
		return licenseB;
	}
	public void setLicenseB(String licenseB) {
		this.licenseB = licenseB;
	}
	public void setLicenseCode(int licenseCode) {
		this.licenseCode = licenseCode;
	}
	public String getLicenseName() {
		return licenseName;
	}
	public void setLicenseName(String licenseName) {
		this.licenseName = licenseName;
	}
	public String getCollicensePlace() {
		return collicensePlace;
	}
	public void setCollicensePlace(String collicensePlace) {
		this.collicensePlace = collicensePlace;
	}
	
	@Override
	public String toString() {
		return "LicenseVO [licenseCode=" + licenseCode + ", licenseName=" + licenseName + ", collicensePlace="
				+ collicensePlace + ", licenseB=" + licenseB + "]";
	}
	
	
}
