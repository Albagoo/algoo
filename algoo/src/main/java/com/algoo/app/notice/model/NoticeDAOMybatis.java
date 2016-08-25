package com.algoo.app.notice.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;

public class NoticeDAOMybatis extends SqlSessionDaoSupport 
implements NoticeDAO{
	
	private String namespace="config.mybatis.mapper.oracle.notice";
	
	public int insertNotice(NoticeVO vo){
		//공지 등록
		return getSqlSession().insert(namespace
				+".insertNotice", vo);
	}
}