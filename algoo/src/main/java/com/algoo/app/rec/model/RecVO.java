package com.algoo.app.rec.model;

import java.sql.Date;
import java.sql.Timestamp;

public class RecVO {
	private int recCode;// NUMBER NOT NULL,
	private String compName;// VARCHAR2(255 BYTE),
	private String title;// VARCHAR2(255 BYTE) NOT NULL,
	private String jobName;/// VARCHAR2(255 BYTE),
	private String jobName2;// VARCHAR2(255 BYTE),
	private String jobName3;// VARCHAR2(255 BYTE),
	private String zipcode;// VARCHAR2(255 BYTE),
	private String address;// VARCHAR2(255 BYTE),
	private String addressDetail;// VARCHAR2(255 BYTE),
	private String subRegion;// VARCHAR2(255 BYTE),
	private String subNum;// VARCHAR2(50 BYTE),
	private String subName;// VARCHAR2(255 BYTE),
	private String subInfo;// VARCHAR2(255 BYTE),
	private String workTerm;// VARCHAR2(255 BYTE),
	private String workDays;// varchar2(50 BYTE),
	private String workTime;// varchar2(50 BYTE),
	private String workTime2;// varchar2(50 BYTE),
	private String workTime3;// varchar2(50 BYTE),
	private String workTime4;// varchar2(50 BYTE),
	private String payType;//
	private int pay;// NUMBER,
	private String recruitType;// VARCHAR2(255 BYTE),
	private String welfare;// VARCHAR2(255 BYTE),
	private String gender;// VARCHAR2(50 BYTE),
	private String age;// VARCHAR2(255 BYTE),
	private String educateLv;// VARCHAR2(255 BYTE),
	private String career;// VARCHAR2(255 BYTE),
	private String preference;// varchar2(255 byte),
	private String recruitMember;// VARCHAR2(255 BYTE),
	private String recruitPerson;// VARCHAR2(255 BYTE),
	private String recruitDeadline;// DATE,
	private String recruitMethod;// VARCHAR2(255 BYTE),
	private String documents;// VARCHAR2(255 BYTE),
	private String detailRecruit;// VARCHAR2(255 BYTE),
	private Date regdate;
	private String maps;// VARCHAR2(255 BYTE),
	private int readcount;// NUMBER,
	private String accuse;// VARCHAR2(50 BYTE),
	private String adminAgree;// VARCHAR2(50 BYTE) DEFAULT 'N',
	private String category;//
	private String imgURL;//
	private String filename;//
	private int filesize;//
	private int compCode;// NUMBER,
	private int serviceCode;// NUMBER

	
	
	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getRecruitDeadline() {
		return recruitDeadline;
	}

	public void setRecruitDeadline(String recruitDeadline) {
		this.recruitDeadline = recruitDeadline;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getImgURL() {
		return imgURL;
	}

	public void setImgURL(String imgURL) {
		this.imgURL = imgURL;
	}


	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public int getFilesize() {
		return filesize;
	}

	public void setFilesize(int filesize) {
		this.filesize = filesize;
	}

	public int getRecCode() {
		return recCode;
	}

	public void setRecCode(int recCode) {
		this.recCode = recCode;
	}

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getJobName() {
		return jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	public String getJobName2() {
		return jobName2;
	}

	public void setJobName2(String jobName2) {
		this.jobName2 = jobName2;
	}

	public String getJobName3() {
		return jobName3;
	}

	public void setJobName3(String jobName3) {
		this.jobName3 = jobName3;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressDetail() {
		return addressDetail;
	}

	public void setAddressDetail(String addressDetail) {
		this.addressDetail = addressDetail;
	}

	public String getSubRegion() {
		return subRegion;
	}

	public void setSubRegion(String subRegion) {
		this.subRegion = subRegion;
	}

	public String getSubNum() {
		return subNum;
	}

	public void setSubNum(String subNum) {
		this.subNum = subNum;
	}

	public String getSubName() {
		return subName;
	}

	public void setSubName(String subName) {
		this.subName = subName;
	}

	public String getSubInfo() {
		return subInfo;
	}

	public void setSubInfo(String subInfo) {
		this.subInfo = subInfo;
	}

	public String getWorkTerm() {
		return workTerm;
	}

	public void setWorkTerm(String workTerm) {
		this.workTerm = workTerm;
	}

	public String getWorkDays() {
		return workDays;
	}

	public void setWorkDays(String workDays) {
		this.workDays = workDays;
	}

	public String getWorkTime() {
		return workTime;
	}

	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}

	public String getWorkTime2() {
		return workTime2;
	}

	public void setWorkTime2(String workTime2) {
		this.workTime2 = workTime2;
	}

	public String getWorkTime3() {
		return workTime3;
	}

	public void setWorkTime3(String workTime3) {
		this.workTime3 = workTime3;
	}

	public String getWorkTime4() {
		return workTime4;
	}

	public void setWorkTime4(String workTime4) {
		this.workTime4 = workTime4;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public String getRecruitType() {
		return recruitType;
	}

	public void setRecruitType(String recruitType) {
		this.recruitType = recruitType;
	}

	public String getWelfare() {
		return welfare;
	}

	public void setWelfare(String welfare) {
		this.welfare = welfare;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getEducateLv() {
		return educateLv;
	}

	public void setEducateLv(String educateLv) {
		this.educateLv = educateLv;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getPreference() {
		return preference;
	}

	public void setPreference(String preference) {
		this.preference = preference;
	}

	public String getRecruitMember() {
		return recruitMember;
	}

	public void setRecruitMember(String recruitMember) {
		this.recruitMember = recruitMember;
	}

	public String getRecruitPerson() {
		return recruitPerson;
	}

	public void setRecruitPerson(String recruitPerson) {
		this.recruitPerson = recruitPerson;
	}

	public String getRecruitMethod() {
		return recruitMethod;
	}

	public void setRecruitMethod(String recruitMethod) {
		this.recruitMethod = recruitMethod;
	}

	public String getDocuments() {
		return documents;
	}

	public void setDocuments(String documents) {
		this.documents = documents;
	}

	public String getDetailRecruit() {
		return detailRecruit;
	}

	public void setDetailRecruit(String detailRecruit) {
		this.detailRecruit = detailRecruit;
	}


	public String getMaps() {
		return maps;
	}

	public void setMaps(String maps) {
		this.maps = maps;
	}

	public int getReadcount() {
		return readcount;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
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

	public String getAdminAgree() {
		return adminAgree;
	}

	public void setAdminAgree(String adminAgree) {
		this.adminAgree = adminAgree;
	}

	public int getCompCode() {
		return compCode;
	}

	public void setCompCode(int compCode) {
		this.compCode = compCode;
	}

	public int getServiceCode() {
		return serviceCode;
	}

	public void setServiceCode(int serviceCode) {
		this.serviceCode = serviceCode;
	}

	@Override
	public String toString() {
		return "RecVO [recCode=" + recCode + ", compName=" + compName + ", title=" + title + ", jobName=" + jobName
				+ ", jobName2=" + jobName2 + ", jobName3=" + jobName3 + ", zipcode=" + zipcode + ", address=" + address
				+ ", addressDetail=" + addressDetail + ", subRegion=" + subRegion + ", subNum=" + subNum + ", subName="
				+ subName + ", subInfo=" + subInfo + ", workTerm=" + workTerm + ", workDays=" + workDays + ", workTime="
				+ workTime + ", workTime2=" + workTime2 + ", workTime3=" + workTime3 + ", workTime4=" + workTime4
				+ ", payType=" + payType + ", pay=" + pay + ", recruitType=" + recruitType + ", welfare=" + welfare
				+ ", gender=" + gender + ", age=" + age + ", educateLv=" + educateLv + ", career=" + career
				+ ", preference=" + preference + ", recruitMember=" + recruitMember + ", recruitPerson=" + recruitPerson
				+ ", recruitDeadline=" + recruitDeadline + ", recruitMethod=" + recruitMethod + ", documents="
				+ documents + ", detailRecruit=" + detailRecruit + ", regdate=" + regdate + ", maps=" + maps
				+ ", readcount=" + readcount + ", accuse=" + accuse + ", adminAgree=" + adminAgree + ", category="
				+ category + ", imgURL=" + imgURL + ", filename=" + filename + ", filesize=" + filesize + ", compCode="
				+ compCode + ", serviceCode=" + serviceCode + "]";
	}

}
