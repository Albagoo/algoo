package com.algoo.app.commem.model;

public class CommemVO {
	private String comp_member_code;
	private String userid;
	private String nickName;
	private String password;
	private String userName;
	private String birth;
	private String gender;
	private String phone1;
	private String phone2;
	private String phone3;
	private String hp1;
	private String hp2;
	private String hp3;
	private String fax1;
	private String fax2;
	private String fax3;
	private String email1;
	private String email2;
	private int comp_code;
	
	public CommemVO() {
		super();
	}

	public CommemVO(String comp_member_code, String userid, String nickName, String password, String userName,
			String birth, String gender, String phone1, String phone2, String phone3, String hp1, String hp2,
			String hp3, String fax1, String fax2, String fax3, String email1, String email2, int comp_code) {
		super();
		this.comp_member_code = comp_member_code;
		this.userid = userid;
		this.nickName = nickName;
		this.password = password;
		this.userName = userName;
		this.birth = birth;
		this.gender = gender;
		this.phone1 = phone1;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.hp1 = hp1;
		this.hp2 = hp2;
		this.hp3 = hp3;
		this.fax1 = fax1;
		this.fax2 = fax2;
		this.fax3 = fax3;
		this.email1 = email1;
		this.email2 = email2;
		this.comp_code = comp_code;
	}

	public String getComp_member_code() {
		return comp_member_code;
	}

	public void setComp_member_code(String comp_member_code) {
		this.comp_member_code = comp_member_code;
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

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
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

	public String getFax1() {
		return fax1;
	}

	public void setFax1(String fax1) {
		this.fax1 = fax1;
	}

	public String getFax2() {
		return fax2;
	}

	public void setFax2(String fax2) {
		this.fax2 = fax2;
	}

	public String getFax3() {
		return fax3;
	}

	public void setFax3(String fax3) {
		this.fax3 = fax3;
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

	public int getComp_code() {
		return comp_code;
	}

	public void setComp_code(int comp_code) {
		this.comp_code = comp_code;
	}

	@Override
	public String toString() {
		return "CommemVO [comp_member_code=" + comp_member_code + ", userid=" + userid + ", nickName=" + nickName
				+ ", password=" + password + ", userName=" + userName + ", birth=" + birth + ", gender=" + gender
				+ ", phone1=" + phone1 + ", phone2=" + phone2 + ", phone3=" + phone3 + ", hp1=" + hp1 + ", hp2=" + hp2
				+ ", hp3=" + hp3 + ", fax1=" + fax1 + ", fax2=" + fax2 + ", fax3=" + fax3 + ", email1=" + email1
				+ ", email2=" + email2 + ", comp_code=" + comp_code + "]";
	}
	
	
	

}
