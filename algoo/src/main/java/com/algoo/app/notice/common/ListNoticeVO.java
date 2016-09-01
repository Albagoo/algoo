package com.algoo.app.notice.common;

public class ListNoticeVO extends SearchVO {
	private int mainNo;
	private String category;
	private String title;
	private String writer;
	
	public ListNoticeVO() {
		super();
	}

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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	@Override
	public String toString() {
		return "SearchNoticeVO [mainNo=" + mainNo + ", category=" + category + ", title=" + title + ", writer=" + writer
				+ ", toString()=" + super.toString() + "]";
	}
}