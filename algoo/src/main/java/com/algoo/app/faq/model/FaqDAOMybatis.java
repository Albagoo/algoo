package com.algoo.app.faq.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.algoo.app.common.SearchVO;
import com.algoo.app.freeboard.model.FreeboardVO;

@Repository
public class FaqDAOMybatis extends SqlSessionDaoSupport implements FaqDAO{
	private String namespace="com.mybatis.mapper.oracle.faq";
	
	@Override
	public int WriteFaq(FaqVO faqVo) {
		return getSqlSession().insert(namespace+".insertFaq", faqVo);
	}

	@Override
	public List<FaqVO> selectAllFaq(SearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectAllFaq", searchVo);
	}

	@Override
	public int selectTotalCount(SearchVO searchVo) {
		return getSqlSession().selectOne(namespace+".selectTotalCount", searchVo);
	}

	@Override
	public FaqVO selectByNo(int faqNo) {
		return getSqlSession().selectOne(namespace+".selectByNo", faqNo);
	}

	@Override
	public int updateFaq(FaqVO faqVo) {
		return getSqlSession().update(namespace+".editFaq", faqVo);
	}

	@Override
	public int deleteFaq(int faqNo) {
		return getSqlSession().delete(namespace+".deleteFaq", faqNo);
	}

	@Override
	public List<FaqVO> selectUserFaq(SearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectUserFaq", searchVo);
	}

	@Override
	public List<FaqVO> searchCategory(ListFaqVO searchVo) {
		return getSqlSession().selectList(namespace+".searchCategory", searchVo);
	}

	@Override
	public FaqVO prevContent(int faqNo) {
		return getSqlSession().selectOne(namespace+".prevContent", faqNo);
	}

	@Override
	public FaqVO nextContent(int faqNo) {
		return getSqlSession().selectOne(namespace+".nextContent", faqNo);
	}
}
