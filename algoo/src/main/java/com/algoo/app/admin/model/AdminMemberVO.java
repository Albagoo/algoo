package com.algoo.app.admin.model;

import java.sql.Timestamp;

public class AdminMemberVO {
	private String adminCode;
	private String userid;
	private String nickName;
	private String password;
	private String name;
	private String email1;
	private String email2;
	private String hp1;
	private String hp2;
	private String hp3;
	private Timestamp joinDate;
	private Timestamp outDate;
	
	public AdminMemberVO() {
		super();
	}
	public AdminMemberVO(String adminCode, String userid, String nickName, String password, String name,
			String email1, String email2, String hp1, String hp2, String hp3, Timestamp joinDate, Timestamp outDate) {
		super();
		this.adminCode = adminCode;
		this.userid = userid;
		this.nickName = nickName;
		this.password = password;
		this.name = name;
		this.email1 = email1;
		this.email2 = email2;
		this.hp1 = hp1;
		this.hp2 = hp2;
		this.hp3 = hp3;
		this.joinDate = joinDate;
		this.outDate = outDate;
	}
	public String getAdminCode() {
		return adminCode;
	}
	public void setAdminCode(String adminCode) {
		this.adminCode = adminCode;
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
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	public Timestamp getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Timestamp joinDate) {
		this.joinDate = joinDate;
	}
	public Timestamp getOutDate() {
		return outDate;
	}
	public void setOutDate(Timestamp outDate) {
		this.outDate = outDate;
	}
	@Override
	public String toString() {
		return "AdminMemberVO [adminCode=" + adminCode + ", userid=" + userid + ", nickName=" + nickName + ", password="
				+ password + ", name=" + name + ", email1=" + email1 + ", email2=" + email2 + ", hp1=" + hp1 + ", hp2="
				+ hp2 + ", hp3=" + hp3 + ", joinDate=" + joinDate + ", outDate=" + outDate + "]";
	}
	
}
