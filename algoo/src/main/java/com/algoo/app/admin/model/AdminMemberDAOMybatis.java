package com.algoo.app.admin.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.algoo.app.common.SearchVO;
import com.algoo.app.member.model.MemberVO;


@Repository
public class AdminMemberDAOMybatis extends SqlSessionDaoSupport implements AdminMemberDAO{
	private String namespace="com.mybatis.mapper.oracle.adminMember";
	
	@Override
	public List<MemberVO> selectMemberList(SearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectMemberList",searchVo);
	}

	@Override
	public int selectMemberCount(SearchVO searchVo) {
		return getSqlSession().selectOne(namespace+".selectMemberCount",searchVo);
	}


}
