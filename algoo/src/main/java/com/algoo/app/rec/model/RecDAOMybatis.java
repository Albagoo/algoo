package com.algoo.app.rec.model;

import java.util.List;
import java.util.Map;

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

	@Override
	public int updateReadCount(int readCount) {
		return getSqlSession().update(namespace+
				".updateReadCount",readCount);
	}

	@Override
	public int insertSevice(Map<String, Object> map) {
		return getSqlSession().insert(namespace+
				".insertRecSevice"+map);
	}

	@Override
	public List<Map<String, Object>> selectJobName() {
		return getSqlSession().selectList(namespace+
				".selectJobName");
	}

	@Override
	public List<Map<String, Object>> selectJobName2(String jobName) {
		return getSqlSession().selectList(namespace+
				".selectJobName2",jobName);
	}


}
