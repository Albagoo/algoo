package com.algoo.app.hope.model;

import java.sql.Timestamp;

public class HopeVO {
	private int hopeCode; /* 희망근무코드 */
	private String category; /* 업직종 */
	private String type; /* 근무형태 */
	private Timestamp day; /* 근무일시 */
	private String pay; /* 급여 */
	private String area; /* 근무지 */
	
	public int getHopeCode() {
		return hopeCode;
	}
	public void setHopeCode(int hopeCode) {
		this.hopeCode = hopeCode;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Timestamp getDay() {
		return day;
	}
	public void setDay(Timestamp day) {
		this.day = day;
	}
	public String getPay() {
		return pay;
	}
	public void setPay(String pay) {
		this.pay = pay;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	
	@Override
	public String toString() {
		return "HopeVO [hopeCode=" + hopeCode + ", category=" + category + ", type=" + type + ", day=" + day + ", pay="
				+ pay + ", area=" + area + "]";
	}
	
	

}
