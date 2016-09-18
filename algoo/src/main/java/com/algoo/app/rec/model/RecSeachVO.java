package com.algoo.app.rec.model;

import com.algoo.app.common.SearchVO;

public class RecSeachVO extends SearchVO {

	private String areas;
	private String area1;
	private String area2;
	private String area3;
	private String area4;
	private String area5;

	
	public String getAreas() {
		return areas;
	}

	public void setAreas(String areas) {
		this.areas = areas;
	}

	public String getArea1() {
		return area1;
	}

	public void setArea1(String area1) {
		this.area1 = area1;
	}

	public String getArea2() {
		return area2;
	}

	public void setArea2(String area2) {
		this.area2 = area2;
	}

	public String getArea3() {
		return area3;
	}

	public void setArea3(String area3) {
		this.area3 = area3;
	}

	public String getArea4() {
		return area4;
	}

	public void setArea4(String area4) {
		this.area4 = area4;
	}

	public String getArea5() {
		return area5;
	}

	public void setArea5(String area5) {
		this.area5 = area5;
	}

	@Override
	public String toString() {
		return "RecSeachVO [areas=" + areas + ", area1=" + area1 + ", area2=" + area2 + ", area3=" + area3 + ", area4="
				+ area4 + ", area5=" + area5 + ", toString()=" + super.toString() + "]";
	}

}
