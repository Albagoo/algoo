package com.algoo.app.service.model;

import java.sql.Date;

public class ServiceVO {
	
	public String serviceCode ;//  VARCHAR2(30 BYTE)               NOT NULL,
	public String grade      ;//   VARCHAR2(50 BYTE),
	public String days       ;//   VARCHAR2(50 BYTE),
	public Date deadline   ;//   DATE
	public String getServiceCode() {
		return serviceCode;
	}
	public void setServiceCode(String serviceCode) {
		this.serviceCode = serviceCode;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getDays() {
		return days;
	}
	public void setDays(String days) {
		this.days = days;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	@Override
	public String toString() {
		return "ServiceVO [serviceCode=" + serviceCode + ", grade=" + grade + ", days=" + days + ", deadline="
				+ deadline + "]";
	}
	
	
}
