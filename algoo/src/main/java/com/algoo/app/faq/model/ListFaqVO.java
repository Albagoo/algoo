package com.algoo.app.faq.model;

import com.algoo.app.common.SearchVO;

//카테고리 검색용 VO
public class ListFaqVO extends SearchVO {
	private int faqNo;
	private String category;
	private String title;
	public int getFaqNo() {
		return faqNo;
	}
	public void setFaqNo(int faqNo) {
		this.faqNo = faqNo;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Override
	public String toString() {
		return "ListFaqVO [faqNo=" + faqNo + ", category=" + category + ", title=" + title + ", toString()="
				+ super.toString() + "]";
	}
}
