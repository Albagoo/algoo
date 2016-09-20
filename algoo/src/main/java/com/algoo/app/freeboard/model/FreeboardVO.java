package com.algoo.app.freeboard.model;

import java.sql.Timestamp;

public class FreeboardVO {
	private int freeNo;
	private String title;
	private String content;
	private int readCount;
	private int groupNo;
	private int sortNo;
	private int step;
	private Timestamp regdate;
	private String delYn;
	private String userid;
	private String nickName;
	
	//24시간 이내 글
	private int newImgTerm;

	//댓글 개수
	private int count;
	
	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getFreeNo() {
		return freeNo;
	}

	public void setFreeNo(int freeNo) {
		this.freeNo = freeNo;
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

	public int getReadCount() {
		return readCount;
	}

	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	public int getGroupNo() {
		return groupNo;
	}

	public void setGroupNo(int groupNo) {
		this.groupNo = groupNo;
	}

	public int getSortNo() {
		return sortNo;
	}

	public void setSortNo(int sortNo) {
		this.sortNo = sortNo;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public int getNewImgTerm() {
		return newImgTerm;
	}

	public void setNewImgTerm(int newImgTerm) {
		this.newImgTerm = newImgTerm;
	}

	@Override
	public String toString() {
		return "FreeboardVO [freeNo=" + freeNo + ", title=" + title + ", content=" + content + ", readCount="
				+ readCount + ", groupNo=" + groupNo + ", sortNo=" + sortNo + ", step=" + step + ", regdate=" + regdate
				+ ", delYn=" + delYn + ", userid=" + userid + ", nickName=" + nickName + ", newImgTerm=" + newImgTerm
				+ ", count=" + count + "]";
	}
}