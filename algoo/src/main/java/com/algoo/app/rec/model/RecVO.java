package com.algoo.app.rec.model;

import java.sql.Timestamp;

public class RecVO {
	private String recCode;
	private String title;
	private String compCode;
	private String name;
	private Timestamp regdate;
	private	int recruitMember;
	private String gender;
	private int age;
	private String educateLv;//	학력	문자	VARCHAR2(255)	 	 	 
	private String recruitType;//	고용형태	문자	VARCHAR2(255)	 	 	 
	private String map;//	지도	파일명	VARCHAR2(255)	 	 	 
	private String dedailRecruit;//	상세모집요강	문자	VARCHAR2(255)	 	 	 
	private int readcount;//	조회수	숫자	NUMBER	 	 	 
	private String accuse;//	신고여부	짧은문자	VARCHAR2(50)	 	 	 
	private String admin_agree;//	관리자승인	코드	VARCHAR2(30)	 	 	 
	private String jobname;//	직종명	문자	VARCHAR2(255)	 	 	 
	private String jobname2;//	2차직종명	문자	VARCHAR2(255)	 	 	 
	private String term;//	근무기간	문자	VARCHAR2(255)	 	 	 
	private String days;//	근무요일	짧은문자	VARCHAR2(50)	 	 	 
	private String time;//	근무시간	문자	VARCHAR2(255)	 	 	 
	private String welfare;//	복리후생	문자	VARCHAR2(255)	 	 	 
	private int pay;//	급여	숫자	NUMBER	 	 	 
	private String regionCode;//	근무지역	코드	VARCHAR2(30)	 	 	FK
	private String subwayCode;//	지하철코드	코드	VARCHAR2(30)	 	 	FK
	private String serviceCode;//	서비스코드	코드	VARCHAR2(30)
	public String getRecCode() {
		return recCode;
	}
	public void setRecCode(String recCode) {
		this.recCode = recCode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCompCode() {
		return compCode;
	}
	public void setCompCode(String compCode) {
		this.compCode = compCode;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public int getRecruitMember() {
		return recruitMember;
	}
	public void setRecruitMember(int recruitMember) {
		this.recruitMember = recruitMember;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getEducateLv() {
		return educateLv;
	}
	public void setEducateLv(String educateLv) {
		this.educateLv = educateLv;
	}
	public String getRecruitType() {
		return recruitType;
	}
	public void setRecruitType(String recruitType) {
		this.recruitType = recruitType;
	}
	public String getMap() {
		return map;
	}
	public void setMap(String map) {
		this.map = map;
	}
	public String getDedailRecruit() {
		return dedailRecruit;
	}
	public void setDedailRecruit(String dedailRecruit) {
		this.dedailRecruit = dedailRecruit;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public String getAccuse() {
		return accuse;
	}
	public void setAccuse(String accuse) {
		this.accuse = accuse;
	}
	public String getAdmin_agree() {
		return admin_agree;
	}
	public void setAdmin_agree(String admin_agree) {
		this.admin_agree = admin_agree;
	}
	public String getJobname() {
		return jobname;
	}
	public void setJobname(String jobname) {
		this.jobname = jobname;
	}
	public String getJobname2() {
		return jobname2;
	}
	public void setJobname2(String jobname2) {
		this.jobname2 = jobname2;
	}
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getWelfare() {
		return welfare;
	}
	public void setWelfare(String welfare) {
		this.welfare = welfare;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public String getRegionCode() {
		return regionCode;
	}
	public void setRegionCode(String regionCode) {
		this.regionCode = regionCode;
	}
	public String getSubwayCode() {
		return subwayCode;
	}
	public void setSubwayCode(String subwayCode) {
		this.subwayCode = subwayCode;
	}
	public String getServiceCode() {
		return serviceCode;
	}
	public void setServiceCode(String serviceCode) {
		this.serviceCode = serviceCode;
	}
	@Override
	public String toString() {
		return "RecVO [recCode=" + recCode + ", title=" + title + ", compCode=" + compCode + ", name=" + name
				+ ", regdate=" + regdate + ", recruitMember=" + recruitMember + ", gender=" + gender + ", age=" + age
				+ ", educateLv=" + educateLv + ", recruitType=" + recruitType + ", map=" + map + ", dedailRecruit="
				+ dedailRecruit + ", readcount=" + readcount + ", accuse=" + accuse + ", admin_agree=" + admin_agree
				+ ", jobname=" + jobname + ", jobname2=" + jobname2 + ", term=" + term + ", days=" + days + ", time="
				+ time + ", welfare=" + welfare + ", pay=" + pay + ", regionCode=" + regionCode + ", subwayCode="
				+ subwayCode + ", serviceCode=" + serviceCode + "]";
	}
	
}

