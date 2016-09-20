package com.algoo.app.language.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class LanguageDAOMybatis extends SqlSessionDaoSupport
	implements LanguageDAO{
	private String namespace = "com.mybatis.mapper.oracle.language";
	
	@Override
	public int insertLanguage(LanguageVO languageVo) {
		return getSqlSession().insert(namespace+".insertLanguage", 
				languageVo);
	}

	@Override
	public LanguageVO selectLanguage(int languageCode) {
		return getSqlSession().selectOne(namespace+".selectLanguage", 
				languageCode);
	}

}
