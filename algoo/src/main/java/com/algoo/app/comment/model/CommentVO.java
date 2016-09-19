package com.algoo.app.comment.model;

import java.sql.Timestamp;

import com.algoo.app.freeboard.model.FreeboardVO;

public class CommentVO extends FreeboardVO{
	private int commentNo;
	private String content;
	private Timestamp regdate;
	private int groupNo;
	private int sortNo;
	private int step;
	private String delYn;
	private String nickName;
	private int freeNo;
	
	public int getFreeNo() {
		return freeNo;
	}
	public void setFreeNo(int freeNo) {
		this.freeNo = freeNo;
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
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
	public String getDelYn() {
		return delYn;
	}
	public void setDelYn(String delYn) {
		this.delYn = delYn;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
	@Override
	public String toString() {
		return "CommentVO [commentNo=" + commentNo + ", content=" + content + ", regdate=" + regdate + ", groupNo="
				+ groupNo + ", sortNo=" + sortNo + ", step=" + step + ", delYn=" + delYn + ", nickName=" + nickName
				+ ", freeNo=" + freeNo + "]";
	}
	
}