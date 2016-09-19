package com.algoo.app.comment.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.algoo.app.common.SearchVO;

@Repository
public class CommentDAOMybatis extends SqlSessionDaoSupport implements CommentDAO{

	private String namespace="com.mybatis.mapper.oracle.comment";

	@Override
	public int insertComment(CommentVO cmtVo) {
		return getSqlSession().insert(namespace+"insertComment", cmtVo);
	}

	@Override
	public List<CommentVO> selectComment(int freeNo) {
		return getSqlSession().selectList(namespace+"selectComment", freeNo);
	}
}
