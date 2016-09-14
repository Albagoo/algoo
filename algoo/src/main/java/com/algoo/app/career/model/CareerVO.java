package com.algoo.app.career.model;

public class CareerVO {
	private int careerCode; /* 구분코드 */
	private String company; /* 회사 */
	private String period; /* 근무기간 */
	private String work; /* 담당업무 */
	
	public int getCareerCode() {
		return careerCode;
	}
	public void setCareerCode(int careerCode) {
		this.careerCode = careerCode;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getWork() {
		return work;
	}
	public void setWork(String work) {
		this.work = work;
	}
	
	@Override
	public String toString() {
		return "CareerVO [careerCode=" + careerCode + ", company=" + company + ", period=" + period + ", work=" + work
				+ "]";
	}
	
	
}	
