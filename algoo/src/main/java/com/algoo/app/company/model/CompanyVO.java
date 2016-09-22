package com.algoo.app.company.model;

public class CompanyVO {
	private int compCode;//    VARCHAR2(30 BYTE)                NOT NULL,
	private String compName   ;//      VARCHAR2(50 BYTE),
	private String ceo;//
	private String compNum     ;//     VARCHAR2(255 BYTE),
	private String zipcode;//
	private String address;//
	private String addressDetail;//
	private String imageURL1;//
	private String imageURL2;//
	private String imageURL3;//
	private String imageURL4;//
	private String deptName;// VARCHAR2(50), /* 담당자명 */
	private String phone1;// VARCHAR2(50), /* 전화번호1 */
	private String phone2;// VARCHAR2(50), /* 전화번호2 */
	private String phone3;// VARCHAR2(50), /* 전화번호3 */
	private String hp1      ;//    NUMBER,
	private String hp2       ;//   number,
	private String hp3       ;//   number,
	private String fax1     ;//    VARCHAR2(30 BYTE),
	private String fax2     ;//    VARCHAR2(30 BYTE),
	private String fax3     ;//    VARCHAR2(30 BYTE),
	private String email1;// VARCHAR2(40), /* 이메일1 */
	private String email2;// VARCHAR2(40), /* 이메일2 */
	private String compSort    ;//sort는 예약어랑 겹치므로 변경     VARCHAR2(255 BYTE),
	private String content  ;//    varchar2(255 byte),
	private String homepage  ;//   VARCHAR2(255 BYTE),
	private String review    ;//   VARCHAR2(50 BYTE),
	private String type     ;//    VARCHAR2(50 BYTE),
	private String cosdac   ;//    VARCHAR2(50 BYTE),
	public int getCompCode() {
		return compCode;
	}
	public void setCompCode(int compCode) {
		this.compCode = compCode;
	}
	public String getCompName() {
		return compName;
	}
	public void setCompName(String compName) {
		this.compName = compName;
	}
	public String getCeo() {
		return ceo;
	}
	public void setCeo(String ceo) {
		this.ceo = ceo;
	}
	public String getCompNum() {
		return compNum;
	}
	public void setCompNum(String compNum) {
		this.compNum = compNum;
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
	public String getImageURL1() {
		return imageURL1;
	}
	public void setImageURL1(String imageURL1) {
		this.imageURL1 = imageURL1;
	}
	public String getImageURL2() {
		return imageURL2;
	}
	public void setImageURL2(String imageURL2) {
		this.imageURL2 = imageURL2;
	}
	public String getImageURL3() {
		return imageURL3;
	}
	public void setImageURL3(String imageURL3) {
		this.imageURL3 = imageURL3;
	}
	public String getImageURL4() {
		return imageURL4;
	}
	public void setImageURL4(String imageURL4) {
		this.imageURL4 = imageURL4;
	}
	public String getDeptName() {
		return deptName;
	}
	public void setDeptName(String deptName) {
		this.deptName = deptName;
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
	public String getCompSort() {
		return compSort;
	}
	public void setCompSort(String compSort) {
		this.compSort = compSort;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	@Override
	public String toString() {
		return "CompanyVO [compCode=" + compCode + ", compName=" + compName + ", ceo=" + ceo + ", compNum=" + compNum
				+ ", zipcode=" + zipcode + ", address=" + address + ", addressDetail=" + addressDetail + ", imageURL1="
				+ imageURL1 + ", imageURL2=" + imageURL2 + ", imageURL3=" + imageURL3 + ", imageURL4=" + imageURL4
				+ ", deptName=" + deptName + ", phone1=" + phone1 + ", phone2=" + phone2 + ", phone3=" + phone3
				+ ", hp1=" + hp1 + ", hp2=" + hp2 + ", hp3=" + hp3 + ", fax1=" + fax1 + ", fax2=" + fax2 + ", fax3="
				+ fax3 + ", email1=" + email1 + ", email2=" + email2 + ", compSort=" + compSort + ", content=" + content
				+ ", homepage=" + homepage + ", review=" + review + ", type=" + type + ", cosdac=" + cosdac + "]";
	}
	
	
}
