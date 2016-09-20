package com.algoo.app.comment.model;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class CommentDAOMybatis extends SqlSessionDaoSupport implements CommentDAO{

	private String namespace="com.mybatis.mapper.oracle.comment";

	@Override
	public int insertComment(CommentVO cmtVo) {
		return getSqlSession().insert(namespace+".insertComment", cmtVo);
	}

	@Override
	public List<CommentVO> selectComment(int freeNo) {
		return getSqlSession().selectList(namespace+".selectAllCmt", freeNo);
	}
	
	@Override
	public int updateSortNo(CommentVO vo) {
		return getSqlSession().update(namespace+".updateSortNo", vo);
	}

	@Override
	public int insertReply(CommentVO vo) {
		//groupNo는 그대로, sortNo, step은 1증가 시킨다
		vo.setSortNo(vo.getSortNo()+1);
		vo.setStep(vo.getStep()+1);
		return getSqlSession().insert(namespace+".insertReply", vo);
	}

	@Override
	public void deleteComment(Map<String, String> map) {
		getSqlSession().delete(namespace+".deleteComment", map);
	}

	@Override
	public CommentVO selectCommentByNo(int cmtNo) {
		return getSqlSession().selectOne(namespace+".selectCommentByNo", cmtNo);
	}
}
