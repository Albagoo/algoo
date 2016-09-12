package com.algoo.app.resume.model;

public class ResumeVO {
	private int hisCode; /* 이력서코드 */
	private String title; /* 이력서제목 */
	private int hopeCode; /* 희망근무코드 */
	private String ability; /* 최종학력 */
	private String detail; /* 학력상세 */
	private	String contatctHour; /* 연락가능시간 */
	private int memberCode; /* 개인회원코드 */
	private String award; /* 수상,수료,활동내역 */
	private String content; /* 자기소개서 */
	private int careerCode; /* 경력사항 */
	private int languageCode; /* 외국어능력 */
	private int licenseCode; /* 자격증 */
	private int comAbilityCode; /* 컴퓨터활용능력 */
	private int personalInfoCode; /* 개인부가정보 */
	
	public int getHisCode() {
		return hisCode;
	}
	public void setHisCode(int hisCode) {
		this.hisCode = hisCode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getHopeCode() {
		return hopeCode;
	}
	public void setHopeCode(int hopeCode) {
		this.hopeCode = hopeCode;
	}
	public String getAbility() {
		return ability;
	}
	public void setAbility(String ability) {
		this.ability = ability;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public String getContatctHour() {
		return contatctHour;
	}
	public void setContatctHour(String contatctHour) {
		this.contatctHour = contatctHour;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public String getAward() {
		return award;
	}
	public void setAward(String award) {
		this.award = award;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCareerCode() {
		return careerCode;
	}
	public void setCareerCode(int careerCode) {
		this.careerCode = careerCode;
	}
	public int getLanguageCode() {
		return languageCode;
	}
	public void setLanguageCode(int languageCode) {
		this.languageCode = languageCode;
	}
	public int getLicenseCode() {
		return licenseCode;
	}
	public void setLicenseCode(int licenseCode) {
		this.licenseCode = licenseCode;
	}
	public int getComAbilityCode() {
		return comAbilityCode;
	}
	public void setComAbilityCode(int comAbilityCode) {
		this.comAbilityCode = comAbilityCode;
	}
	public int getPersonalInfoCode() {
		return personalInfoCode;
	}
	public void setPersonalInfoCode(int personalInfoCode) {
		this.personalInfoCode = personalInfoCode;
	}
	
	@Override
	public String toString() {
		return "ResumeVO [hisCode=" + hisCode + ", title=" + title + ", hopeCode=" + hopeCode + ", ability=" + ability
				+ ", detail=" + detail + ", contatctHour=" + contatctHour
				+ ", memberCode=" + memberCode + ", award=" + award + ", content=" + content + ", careerCode="
				+ careerCode + ", languageCode=" + languageCode + ", licenseCode=" + licenseCode + ", comAbilityCode="
				+ comAbilityCode + ", personalInfoCode=" + personalInfoCode + "]";
	}
	
	

}
