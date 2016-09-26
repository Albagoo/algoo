package com.algoo.app.apply.model;

import java.sql.Timestamp;

public class ApplyVO {
	private int applyCode;
	private Timestamp days;
	private String readCheck;
	private String memo;
	private int hisCode;
	private int recCode;
	private String compMemberCode;
	
	public String getCompMemberCode() {
		return compMemberCode;
	}
	public void setCompMemberCode(String compMemberCode) {
		this.compMemberCode = compMemberCode;
	}
	public int getApplyCode() {
		return applyCode;
	}
	public void setApplyCode(int applyCode) {
		this.applyCode = applyCode;
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
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public int getRecCode() {
		return recCode;
	}
	public void setRecCode(int recCode) {
		this.recCode = recCode;
	}
	public int getHisCode() {
		return hisCode;
	}
	public void setHisCode(int hisCode) {
		this.hisCode = hisCode;
	}
	
	@Override
	public String toString() {
		return "ApplyVO [applyCode=" + applyCode + ", days=" + days + ", readCheck=" + readCheck + ", memo=" + memo
				+ ", hisCode=" + hisCode + ", recCode=" + recCode + ", compMemberCode=" + compMemberCode + "]";
	}
	
	
}
