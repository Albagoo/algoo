package com.algoo.app.notice.model;

import java.sql.Timestamp;

public class NoticeVO {
	private int mainNo;
	private String category;
	private String title;
	private String content;
	private Timestamp regdate;

	public int getMainNo() {
		return mainNo;
	}

	public void setMainNo(int mainNo) {
		this.mainNo = mainNo;
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
		return "NoticeVO [mainNo=" + mainNo + ", category=" + category + ", title=" + title 
				+ ", content=" + content + "]";
	}
}