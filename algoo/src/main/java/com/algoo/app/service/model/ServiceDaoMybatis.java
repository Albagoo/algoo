package com.algoo.app.service.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;
@Repository
public class ServiceDaoMybatis extends SqlSessionDaoSupport
implements ServiceDAO{

	private String namespace = "com.mybatis.mapper.oracle.service";
	
/*	@Override
	public int insertSevice(ServiceVO vo) {
		return getSqlSession().insert(namespace+
				".insertSevice", vo);
	}
*/
	@Override
	public int selectByNew() {
		return getSqlSession().selectOne(namespace+
				".selectByNew");
	}

}
