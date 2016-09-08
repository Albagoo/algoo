package com.algoo.app.notice.common;

public class SerachNoticeVO extends SearchVO{
	private int category;
	private int mainNo;
	private String categoryName;
	
	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}
	public int getMainNo() {
		return mainNo;
	}
	public void setMainNo(int mainNo) {
		this.mainNo = mainNo;
	}
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	@Override
	public String toString() {
		return "SearchNoticeVO [category=" + category + ", mainNo=" + mainNo + ", categoryName=" + categoryName
				+ ", toString()=" + super.toString() + "]";
	}
}
