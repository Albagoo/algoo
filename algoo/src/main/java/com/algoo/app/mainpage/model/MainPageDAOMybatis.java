package com.algoo.app.mainpage.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.algoo.app.rec.model.RecVO;

@Repository
public class MainPageDAOMybatis extends SqlSessionDaoSupport
implements MainPageDAO{
	
	private String namespace = "com.mybatis.mapper.oracle.mainpage";

	@Override
	public List<RecVO> searchByGrade(MainSearchVO vo) {
		return getSqlSession().selectList(namespace+".searchByGrade",
				vo);
	}

	@Override
	public int selectTotalCount(MainSearchVO vo) {
		return getSqlSession().selectOne(namespace+".selectTotalCount",
				vo);
	}
}