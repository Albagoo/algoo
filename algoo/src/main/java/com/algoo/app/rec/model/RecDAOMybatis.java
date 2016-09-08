package com.algoo.app.rec.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.algoo.app.company.model.CompanyVO;
import com.algoo.app.service.model.ServiceVO;


@Repository
public class RecDAOMybatis extends SqlSessionDaoSupport
implements RecDAO{

	private String namespace="com.mybatis.mapper.oracle.rec";
	
	@Override
	public RecVO selectRecByCode(int recCode) {
		return getSqlSession().selectOne(namespace+
				".selectRecByCode", recCode);
	}

	@Override
	public CompanyVO selectCompanyByCode(int compCode) {
		return getSqlSession().selectOne(namespace+
				".selectCompanyByCode", compCode);
	}

	@Override
	public ServiceVO selectServiceByCode(int serviceCode) {
		return getSqlSession().selectOne(namespace+
				".selectServiceByCode",serviceCode);
	}

	@Override
	public int intsertRec(RecVO vo) {
		return getSqlSession().insert(namespace+
				".insertRec",vo);
	}

	@Override
	public int selectTotalCount(RecSeachVO vo) {
		return getSqlSession().selectOne(namespace+
				".selectTotalCount", vo);
	}

	@Override
	public List<RecVO> selectAllRec(RecSeachVO vo) {
		return getSqlSession().selectList(namespace+
				".selectAllRec", vo);
	}


}
