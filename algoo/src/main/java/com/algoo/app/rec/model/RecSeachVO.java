package com.algoo.app.rec.model;

import java.util.Arrays;
import java.util.Map;

import com.algoo.app.common.SearchVO;

public class RecSeachVO extends SearchVO {

	//지역명 검색에 사용
	private String areas;//근무지역
	private String area1;
	private String area2;
	private String area3;
	private String area4;
	private String area5;
	
	private String jobs;//직종
	private String job1;
	private String job2;
	private String job3;
	private String job4;
	private String job5;
	
	private String[] workTerm;//근무기간
	private String workDays;//근무요일
	private String payType;//급여방식
	private int pay;//급여
	private String[] recruitType;//고용형태 
	private String[] welfare;//복지
	private String educateLv;//학력
	private String[] preference;//우대조건
	
	public String getWorkDays() {
		return workDays;
	}

	public void setWorkDays(String workDays) {
		this.workDays = workDays;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	public String[] getRecruitType() {
		return recruitType;
	}

	public void setRecruitType(String[] recruitType) {
		this.recruitType = recruitType;
	}

	public String[] getWelfare() {
		return welfare;
	}

	public void setWelfare(String[] welfare) {
		this.welfare = welfare;
	}

	public String getEducateLv() {
		return educateLv;
	}

	public void setEducateLv(String educateLv) {
		this.educateLv = educateLv;
	}

	public String[] getPreference() {
		return preference;
	}

	public void setPreference(String[] preference) {
		this.preference = preference;
	}

	private Map<String,Object> map;
	
	
	
	public Map<String, Object> getMap() {
		return map;
	}

	public void setMap(Map<String, Object> map) {
		this.map = map;
	}

	public String[] getWorkTerm() {
		return workTerm;
	}

	public void setWorkTerm(String[] workTerm) {
		this.workTerm = workTerm;
	}

	public String getJobs() {
		return jobs;
	}

	public void setJobs(String jobs) {
		this.jobs = jobs;
	}

	public String getJob1() {
		return job1;
	}

	public void setJob1(String job1) {
		this.job1 = job1;
	}

	public String getJob2() {
		return job2;
	}

	public void setJob2(String job2) {
		this.job2 = job2;
	}

	public String getJob3() {
		return job3;
	}

	public void setJob3(String job3) {
		this.job3 = job3;
	}

	public String getJob4() {
		return job4;
	}

	public void setJob4(String job4) {
		this.job4 = job4;
	}

	public String getJob5() {
		return job5;
	}

	public void setJob5(String job5) {
		this.job5 = job5;
	}

	public String getAreas() {
		return areas;
	}

	public void setAreas(String areas) {
		this.areas = areas;
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

	public String getArea3() {
		return area3;
	}

	public void setArea3(String area3) {
		this.area3 = area3;
	}

	public String getArea4() {
		return area4;
	}

	public void setArea4(String area4) {
		this.area4 = area4;
	}

	public String getArea5() {
		return area5;
	}

	public void setArea5(String area5) {
		this.area5 = area5;
	}

	@Override
	public String toString() {
		return "RecSeachVO [areas=" + areas + ", area1=" + area1 + ", area2=" + area2 + ", area3=" + area3 + ", area4="
				+ area4 + ", area5=" + area5 + ", jobs=" + jobs + ", job1=" + job1 + ", job2=" + job2 + ", job3=" + job3
				+ ", job4=" + job4 + ", job5=" + job5 + ", workTerm=" + Arrays.toString(workTerm) + ", workDays="
				+ workDays + ", payType=" + payType + ", pay=" + pay + ", recruitType=" + Arrays.toString(recruitType)
				+ ", welfare=" + Arrays.toString(welfare) + ", educateLv=" + educateLv + ", preference="
				+ Arrays.toString(preference) + ", map=" + map + ", toString()=" + super.toString() + "]";
	}

}
