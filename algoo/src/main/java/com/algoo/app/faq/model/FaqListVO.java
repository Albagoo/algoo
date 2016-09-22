package com.algoo.app.faq.model;

import java.util.List;

public class FaqListVO {
	private List<FaqVO> faqList;

	public List<FaqVO> getFaqList() {
		return faqList;
	}

	public void setFaqList(List<FaqVO> faqList) {
		this.faqList = faqList;
	}

	@Override
	public String toString() {
		return "FaqListVO [faqList=" + faqList + "]";
	}
}