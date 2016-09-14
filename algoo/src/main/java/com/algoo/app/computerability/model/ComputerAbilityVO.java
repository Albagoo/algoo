package com.algoo.app.computerability.model;

public class ComputerAbilityVO {
	private int comAbilityCode; /* 구분코드 */
	private String word; /* 워드 */
	private String powerPoint; /* 파워포인트 */
	private String excel; /* 엑셀 */
	private String internet; /* 인터넷 */
	private String itDesignAbility; /* 디자인 */
	private String ComputerAbilityB;
	
	public String getComputerAbilityB() {
		return ComputerAbilityB;
	}
	public void setComputerAbilityB(String computerAbilityB) {
		ComputerAbilityB = computerAbilityB;
	}
	public int getComAbilityCode() {
		return comAbilityCode;
	}
	public void setComAbilityCode(int comAbilityCode) {
		this.comAbilityCode = comAbilityCode;
	}
	public String getWord() {
		return word;
	}
	public void setWord(String word) {
		this.word = word;
	}
	public String getPowerPoint() {
		return powerPoint;
	}
	public void setPowerPoint(String powerPoint) {
		this.powerPoint = powerPoint;
	}
	public String getExcel() {
		return excel;
	}
	public void setExcel(String excel) {
		this.excel = excel;
	}
	public String getInternet() {
		return internet;
	}
	public void setInternet(String internet) {
		this.internet = internet;
	}
	public String getItDesignAbility() {
		return itDesignAbility;
	}
	public void setItDesignAbility(String itDesignAbility) {
		this.itDesignAbility = itDesignAbility;
	}
	
	@Override
	public String toString() {
		return "ComputerAbilityVO [comAbilityCode=" + comAbilityCode + ", word=" + word + ", powerPoint=" + powerPoint
				+ ", excel=" + excel + ", internet=" + internet + ", itDesignAbility=" + itDesignAbility
				+ ", ComputerAbilityB=" + ComputerAbilityB + "]";
	}
	
	
}
