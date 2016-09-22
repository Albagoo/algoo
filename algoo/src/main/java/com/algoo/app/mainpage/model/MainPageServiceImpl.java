package com.algoo.app.mainpage.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.algoo.app.rec.model.RecVO;

@Service
public class MainPageServiceImpl implements MainPageService{
	@Autowired
	private MainPageDAO mainpageDao;
	
	@Override
	public List<RecVO> searchByGrade(MainSearchVO vo) {
		return mainpageDao.searchByGrade(vo);
	}

	@Override
	public int selectTotalCount(MainSearchVO vo) {
		return mainpageDao.selectTotalCount(vo);
	}
}