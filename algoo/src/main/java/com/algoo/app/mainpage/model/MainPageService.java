package com.algoo.app.mainpage.model;

import java.util.List;

import com.algoo.app.rec.model.RecVO;

public interface MainPageService {
	public List<RecVO> searchByGrade(MainSearchVO vo);
	public int selectTotalCount(MainSearchVO vo);
}