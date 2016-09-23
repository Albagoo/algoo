package com.algoo.app.resume.model;

import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Map;

import com.algoo.app.common.SearchVO;

public class ResumeSearchVO extends SearchVO {

	private String gender;
	private String username;
	private String photo;
	private String birth;
	private String title;
	private String period;
	private String[] categorys;
	private String licenseName;
	private String area1;
	private String area2;
	private Timestamp regdate;
	private int hisCode;
	private Map<String, Object> map;
	

	
	
	public Map<String, Object> getMap() {
		return map;
	}

	public void setMap(Map<String, Object> map) {
		this.map = map;
	}

	public String getGender() {
		return gender;
	}

	public String[] getCategorys() {
		return categorys;
	}

	public void setCategorys(String[] categorys) {
		this.categorys = categorys;
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

	public String getLicenseName() {
		return licenseName;
	}

	public void setLicenseName(String licenseName) {
		this.licenseName = licenseName;
	}

	public String getArea1() {
		return area1;
	}

	public void setArea1(String area1) {
		this.area1 = area1;
	}

	public String getArea2() {
		return area2;
	}

	public void setArea2(String area2) {
		this.area2 = area2;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}

	public int getHisCode() {
		return hisCode;
	}

	public void setHisCode(int hisCode) {
		this.hisCode = hisCode;
	}

	@Override
	public String toString() {
		return "ResumeSearchVO [gender=" + gender + ", username=" + username + ", photo=" + photo + ", birth=" + birth
				+ ", title=" + title + ", period=" + period + ", categorys=" + Arrays.toString(categorys)
				+ ", licenseName=" + licenseName + ", area1=" + area1 + ", area2=" + area2 + ", regdate=" + regdate
				+ ", hisCode=" + hisCode + ", map=" + map + ", toString()=" + super.toString() + "]";
	}

}
