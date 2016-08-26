package com.algoo.app.notice.model;

import java.sql.Timestamp;

public class NoticeVO {
	private int mainNo;
	private String title;
	private String content;
	private String writer;
	private int readCount;
	private Timestamp regdate;
	private int authcode;
	
	public NoticeVO() {
		super();
	}
	public NoticeVO(int mainNo, String title, String content, String writer, int readCount, Timestamp regdate,
			int authcode) {
		super();
		this.mainNo = mainNo;
		this.title = title;
		this.content = content;
		this.writer = writer;
		this.readCount = readCount;
		this.regdate = regdate;
		this.authcode = authcode;
	}
	public int getMainNo() {
		return mainNo;
	}
	public void setMainNo(int mainNo) {
		this.mainNo = mainNo;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getAuthcode() {
		return authcode;
	}
	public void setAuthcode(int authcode) {
		this.authcode = authcode;
	}
	
	@Override
	public String toString() {
		return "NoticeVO [mainNo=" + mainNo + ", title=" + title + ", content=" + content + ", writer=" + writer
				+ ", readCount=" + readCount + ", regdate=" + regdate + ", authcode=" + authcode + "]";
	}
}
