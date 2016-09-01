package com.algoo.app.company.model;

public class CompanyVO {
	private String compCode;//    VARCHAR2(30 BYTE)                NOT NULL,
	private String name   ;//      VARCHAR2(50 BYTE),
	private String compSort    ;//sort는 예약어랑 겹치므로 변경     VARCHAR2(255 BYTE),
	private String num     ;//     VARCHAR2(255 BYTE),
	private String content  ;//    varchar2(255 byte),
	private String hp1      ;//    NUMBER,
	private String hp2       ;//   number,
	private String hp3       ;//   number,
	private String image    ;//    VARCHAR2(255 BYTE),
	private String fax1     ;//    VARCHAR2(30 BYTE),
	private String fax2     ;//    VARCHAR2(30 BYTE),
	private String fax3     ;//    VARCHAR2(30 BYTE),
	private String homepage  ;//   VARCHAR2(255 BYTE),
	private String review    ;//   VARCHAR2(50 BYTE),
	private String type     ;//    VARCHAR2(50 BYTE),
	private String cosdac   ;//    VARCHAR2(50 BYTE),
	private String regionCode ;// VARCHAR2(30 BYTE),
	private String compCode2  ;// VARCHAR2(30 BYTE)

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


	public String getCompSort() {
		return compSort;
	}

	public void setCompSort(String compSort) {
		this.compSort = compSort;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
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

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getReview() {
		return review;
	}

	public void setReview(String review) {
		this.review = review;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getCosdac() {
		return cosdac;
	}

	public void setCosdac(String cosdac) {
		this.cosdac = cosdac;
	}

	public String getRegionCode() {
		return regionCode;
	}

	public void setRegionCode(String regionCode) {
		this.regionCode = regionCode;
	}

	public String getCompCode2() {
		return compCode2;
	}

	public void setCompCode2(String compCode2) {
		this.compCode2 = compCode2;
	}

	@Override
	public String toString() {
		return "CompanyVO [compCode=" + compCode + ", name=" + name + ", compSort=" + compSort + ", num=" + num
				+ ", content=" + content + ", hp1=" + hp1 + ", hp2=" + hp2 + ", hp3=" + hp3 + ", image=" + image
				+ ", fax1=" + fax1 + ", fax2=" + fax2 + ", fax3=" + fax3 + ", homepage=" + homepage + ", review="
				+ review + ", type=" + type + ", cosdac=" + cosdac + ", regionCode=" + regionCode + ", compCode2="
				+ compCode2 + "]";
	}
	
	
}
