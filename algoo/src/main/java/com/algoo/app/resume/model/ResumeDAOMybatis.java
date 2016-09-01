package com.algoo.app.resume.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class ResumeDAOMybatis extends SqlSessionDaoSupport
	implements ResumeDAO{

}
