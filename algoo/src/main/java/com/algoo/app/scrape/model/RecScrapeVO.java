package com.algoo.app.scrape.model;

import java.sql.Date;

public class RecScrapeVO {

	private int scrapeCode;
	private String compName;
	private String userid;
	private String recTitle;
	private String workArea;
	private Date regdate;
	private String deadline;
	private int recCode;
	
	
	public int getScrapeCode() {
		return scrapeCode;
	}
	public void setScrapeCode(int scrapeCode) {
		this.scrapeCode = scrapeCode;
	}
	public String getCompName() {
		return compName;
	}
	public void setCompName(String compName) {
		this.compName = compName;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getRecTitle() {
		return recTitle;
	}
	public void setRecTitle(String recTitle) {
		this.recTitle = recTitle;
	}
	public String getWorkArea() {
		return workArea;
	}
	public void setWorkArea(String workArea) {
		this.workArea = workArea;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getDeadline() {
		return deadline;
	}
	public void setDeadline(String deadline) {
		this.deadline = deadline;
	}
	public int getRecCode() {
		return recCode;
	}
	public void setRecCode(int recCode) {
		this.recCode = recCode;
	}
	@Override
	public String toString() {
		return "ScrapeVO [scrapeCode=" + scrapeCode + ", compName=" + compName + ", userid=" + userid + ", recTitle="
				+ recTitle + ", workArea=" + workArea + ", regdate=" + regdate + ", deadline=" + deadline + ", recCode="
				+ recCode + "]";
	}
	
	
	
}
