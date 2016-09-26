package com.algoo.app.scrape.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class RecScrapeDAOMybatis extends SqlSessionDaoSupport 
implements RecScrapeDAO{

	private String namespace="com.mybatis.mapper.oracle.scrape";

		@Override
	public List<RecScrapeVO> selectRecScrape(RecScrapeSearchVO vo) {
		return getSqlSession().selectList(namespace
				+".selectRecScrape",vo);
	}

	@Override
	public int selectRecScrapeCount(RecScrapeSearchVO vo) {
		return getSqlSession().selectOne(namespace
				+".selectRecScrapeCount",vo);
	}

	@Override
	public int insertRecScrape(RecScrapeVO vo) {
		return getSqlSession().insert(namespace
				+".insertRecScrape",vo);
	}
	
	
}
