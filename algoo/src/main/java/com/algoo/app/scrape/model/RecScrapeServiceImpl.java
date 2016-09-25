package com.algoo.app.scrape.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RecScrapeServiceImpl implements RecScrapeService{
	
	@Autowired
	private RecScrapeDAO recScrapeDao;

	@Override
	public List<RecScrapeVO> selectRecScrape(RecScrapeSearchVO vo) {
		return recScrapeDao.selectRecScrape(vo);
	}

	@Override
	public int selectRecScrapeCount(RecScrapeSearchVO vo) {
		return recScrapeDao.selectRecScrapeCount(vo);
	}


	

}
