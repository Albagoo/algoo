package com.algoo.app.mainpage.model;

import com.algoo.app.common.SearchVO;

public class MainSearchVO extends SearchVO {
	private String MainGrade;

	public String getMainGrade() {
		return MainGrade;
	}

	public void setMainGrade(String mainGrade) {
		MainGrade = mainGrade;
	}
	
	@Override
	public String toString() {
		return "MainSearchVO [MainGrade=" + MainGrade + ", toString()="
				+ super.toString() + "]";
	}
}