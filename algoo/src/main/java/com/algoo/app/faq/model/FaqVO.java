package com.algoo.app.faq.model;

import java.sql.Timestamp;

public class FaqVO {
	private int faqNo;
	private String category;
	private String title;
	private String content;
	private Timestamp regdate;
	 
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
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

	@Override
	public String toString() {
		return "FaqVO [faqNo=" + faqNo + ", category=" + category + ", title=" + title + ", content=" + content
				+ ", regdate=" + regdate + "]";
	}
}
