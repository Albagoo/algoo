package com.algoo.app.resume.model;

import java.sql.Timestamp;

public class ResumeListVO {
	private String gender;
	private String username;
	private String photo;
	private String birth;
	private String title;
	private String period;
	private String category;
	private String licenseName;
	private String area;
	private Timestamp regdate;
	private int hisCode;
	private String type;
	
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public int getHisCode() {
		return hisCode;
	}
	public void setHisCode(int hisCode) {
		this.hisCode = hisCode;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getLicenseName() {
		return licenseName;
	}
	public void setLicenseName(String licenseName) {
		this.licenseName = licenseName;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "ResumeListVO [gender=" + gender + ", username=" + username + ", photo=" + photo + ", birth=" + birth
				+ ", title=" + title + ", period=" + period + ", category=" + category + ", licenseName=" + licenseName
				+ ", area=" + area + ", regdate=" + regdate + ", hisCode=" + hisCode + ", type=" + type + "]";
	}
}
