package com.algoo.app.personalInfo.model;

public class PersonalInfoVO {
	private int personalInfoCode; /* 구분코드 */
	private String obstacle; /* 장애여부 */
	private String military; /* 병역사항 */
	private String veterans; /* 국가보훈 */
	private String employment;
	private String personalInfoB;
	
	public String getPersonalInfoB() {
		return personalInfoB;
	}
	public void setPersonalInfoB(String personalInfoB) {
		this.personalInfoB = personalInfoB;
	}
	public int getPersonalInfoCode() {
		return personalInfoCode;
	}
	public void setPersonalInfoCode(int personalInfoCode) {
		this.personalInfoCode = personalInfoCode;
	}
	public String getObstacle() {
		return obstacle;
	}
	public void setObstacle(String obstacle) {
		this.obstacle = obstacle;
	}
	public String getMilitary() {
		return military;
	}
	public void setMilitary(String military) {
		this.military = military;
	}
	public String getVeterans() {
		return veterans;
	}
	public void setVeterans(String veterans) {
		this.veterans = veterans;
	}
	public String getEmployment() {
		return employment;
	}
	public void setEmployment(String employment) {
		this.employment = employment;
	}
	
	@Override
	public String toString() {
		return "PersonalInfoVO [personalInfoCode=" + personalInfoCode + ", obstacle=" + obstacle + ", military="
				+ military + ", veterans=" + veterans + ", employment=" + employment + ", personalInfoB="
				+ personalInfoB + "]";
	}
	
	
	
	
}
