package com.algoo.app.scrape.model;

import java.util.List;

public interface RecScrapeDAO {
	public List<RecScrapeVO> selectRecScrape(RecScrapeSearchVO vo);
	public int selectRecScrapeCount(RecScrapeSearchVO vo);
}
