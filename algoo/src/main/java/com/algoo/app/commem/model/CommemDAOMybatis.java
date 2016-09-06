package com.algoo.app.commem.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CommemDAOMybatis extends SqlSessionDaoSupport
	implements CommemDAO{
	
	private String namespace="com.mybatis.mapper.oracle.commem";
}
