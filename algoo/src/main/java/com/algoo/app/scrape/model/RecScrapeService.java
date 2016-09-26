package com.algoo.app.scrape.model;

import java.util.List;

public interface RecScrapeService {
	public List<RecScrapeVO> selectRecScrape(RecScrapeSearchVO vo);
	public int selectRecScrapeCount(RecScrapeSearchVO vo);
	public int insertRecScrape(RecScrapeVO vo);
}
