package com.algoo.app.faq.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class FaqDAOMybatis extends SqlSessionDaoSupport implements FaqDAO{
	private String namespace="com.mybatis.mapper.oracle.faq";
	
	@Override
	public int WriteFaq(FaqVO faqVo) {
		return getSqlSession().insert(namespace+".insertFaq", faqVo);
	}

}
