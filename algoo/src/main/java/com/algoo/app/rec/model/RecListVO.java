package com.algoo.app.rec.model;

import java.util.List;

public class RecListVO {

	public List<RecVO> rec1List;
	public List<RecVO> rec2List;
	public List<RecVO> rec3List;
	public List<RecVO> rec4List;
	
	
	public List<RecVO> getRec1List() {
		return rec1List;
	}
	public void setRec1List(List<RecVO> rec1List) {
		this.rec1List = rec1List;
	}
	public List<RecVO> getRec2List() {
		return rec2List;
	}
	public void setRec2List(List<RecVO> rec2List) {
		this.rec2List = rec2List;
	}
	public List<RecVO> getRec3List() {
		return rec3List;
	}
	public void setRec3List(List<RecVO> rec3List) {
		this.rec3List = rec3List;
	}
	public List<RecVO> getRec4List() {
		return rec4List;
	}
	public void setRec4List(List<RecVO> rec4List) {
		this.rec4List = rec4List;
	}
	@Override
	public String toString() {
		return "RecListVO [rec1List=" + rec1List + ", rec2List=" + rec2List + ", rec3List=" + rec3List + ", rec4List="
				+ rec4List + "]";
	}
	
	
}
