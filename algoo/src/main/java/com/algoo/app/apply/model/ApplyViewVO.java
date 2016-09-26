package com.algoo.app.apply.model;

import java.sql.Timestamp;

public class ApplyViewVO {
	private Timestamp days;
	private String readCheck;
	private String title;
	private String memberCode;
	private int recCode;
	private int hisCode;
	private String username;
	private String compMemberCode;
	private int applyCode;
	
	
	public int getApplyCode() {
		return applyCode;
	}
	public void setApplyCode(int applyCode) {
		this.applyCode = applyCode;
	}
	public String getCompMemberCode() {
		return compMemberCode;
	}
	public void setCompMemberCode(String compMemberCode) {
		this.compMemberCode = compMemberCode;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getHisCode() {
		return hisCode;
	}
	public void setHisCode(int hisCode) {
		this.hisCode = hisCode;
	}
	public int getRecCode() {
		return recCode;
	}
	public void setRecCode(int recCode) {
		this.recCode = recCode;
	}
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public Timestamp getDays() {
		return days;
	}
	public void setDays(Timestamp days) {
		this.days = days;
	}
	public String getReadCheck() {
		return readCheck;
	}
	public void setReadCheck(String readCheck) {
		this.readCheck = readCheck;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	@Override
	public String toString() {
		return "ApplyViewVO [days=" + days + ", readCheck=" + readCheck + ", title=" + title + ", memberCode="
				+ memberCode + ", recCode=" + recCode + ", hisCode=" + hisCode + ", username=" + username
				+ ", compMemberCode=" + compMemberCode + ", applyCode=" + applyCode + "]";
	}
	
	
}
