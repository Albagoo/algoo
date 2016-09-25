package com.algoo.app.scrape.model;

import com.algoo.app.common.SearchVO;

public class RecScrapeSearchVO extends SearchVO{

	
	private String userid;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	@Override
	public String toString() {
		return "RecScrapeSearchVO [userid=" + userid + ", toString()=" + super.toString() + "]";
	}
	
	
	
}
