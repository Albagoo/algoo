package com.algoo.app.language.model;

public class LanguageVO {
	private int languageCode; /* 구분코드 */
	private String language; /* 외국어 */
	private String languageStudy; /* 어학연수 */
	private String languageCommand; /* 구사능력 */
	private String officialTest; /* 공인시험 */
	
	public int getLanguageCode() {
		return languageCode;
	}
	public void setLanguageCode(int languageCode) {
		this.languageCode = languageCode;
	}
	public String getLanguage() {
		return language;
	}
	public void setLanguage(String language) {
		this.language = language;
	}
	public String getLanguageStudy() {
		return languageStudy;
	}
	public void setLanguageStudy(String languageStudy) {
		this.languageStudy = languageStudy;
	}
	public String getLanguageCommand() {
		return languageCommand;
	}
	public void setLanguageCommand(String languageCommand) {
		this.languageCommand = languageCommand;
	}
	public String getOfficialTest() {
		return officialTest;
	}
	public void setOfficialTest(String officialTest) {
		this.officialTest = officialTest;
	}
	
	@Override
	public String toString() {
		return "LanguageVO [languageCode=" + languageCode + ", language=" + language + ", languageStudy="
				+ languageStudy + ", languageCommand=" + languageCommand + ", officialTest=" + officialTest + "]";
	}
	
	
	
	
}
