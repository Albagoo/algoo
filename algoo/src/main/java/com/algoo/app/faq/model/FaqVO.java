package com.algoo.app.faq.model;

import java.sql.Timestamp;

public class FaqVO {
	private String faqNo;
	private String category;
	private String title;
	private String content;
	private Timestamp regdate;
	private String adminCode;
	
	public String getFaqNo() {
		return faqNo;
	}
	public void setFaq_no(String faqNo) {
		this.faqNo = faqNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getAdminCode() {
		return adminCode;
	}
	public void setAdminCode(String adminCode) {
		this.adminCode = adminCode;
	}
	
	@Override
	public String toString() {
		return "FaqVO [faqNo=" + faqNo + ", category=" + category + ", title=" + title + ", content=" + content
				+ ", regdate=" + regdate + ", adminCode=" + adminCode + "]";
	}
}
