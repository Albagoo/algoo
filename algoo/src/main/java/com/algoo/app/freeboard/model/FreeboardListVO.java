package com.algoo.app.freeboard.model;

import java.util.List;

public class FreeboardListVO {
	private List<FreeboardVO> freeList;

	public List<FreeboardVO> getFreeList() {
		return freeList;
	}

	public void setFreeList(List<FreeboardVO> freeList) {
		this.freeList = freeList;
	}

	@Override
	public String toString() {
		return "FreeboardListVO [freeList=" + freeList + "]";
	}
}
