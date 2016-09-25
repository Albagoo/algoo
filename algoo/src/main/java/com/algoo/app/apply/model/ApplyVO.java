package com.algoo.app.apply.model;

import java.sql.Timestamp;

public class ApplyVO {
	private int applyCode;
	private Timestamp days;
	private String readCheck;
	private String memo;
	private String memberCode;
	private int recCode;
	
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
	public String getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}
	public int getRecCode() {
		return recCode;
	}
	public void setRecCode(int recCode) {
		this.recCode = recCode;
	}
	
	@Override
	public String toString() {
		return "ApplyVO [applyCode=" + applyCode + ", days=" + days + ", readCheck=" + readCheck + ", memo=" + memo
				+ ", memberCode=" + memberCode + ", recCode=" + recCode + "]";
	}
	
	
}
