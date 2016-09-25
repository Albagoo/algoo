package com.algoo.app.admin.model;

import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.algoo.app.common.SearchVO;
import com.algoo.app.member.model.MemberVO;


@Repository
public class AdminMemberDAOMybatis extends SqlSessionDaoSupport 
	implements AdminMemberDAO{
	private String namespace="com.mybatis.mapper.oracle.adminMember";
	
	@Override
	public List<MemberVO> selectMemberList(SearchVO searchVo) {
		return getSqlSession().selectList(namespace+".selectMemberList",searchVo);
	}

	@Override
	public int selectMemberCount(SearchVO searchVo) {
		return getSqlSession().selectOne(namespace+".selectMemberCount",searchVo);
	}

	@Override
	public int deleteMem(String userid) {
		return getSqlSession().update(namespace+".deleteMem",userid);
	}

	@Override
	public int updateMem(MemberVO memberVo) {
		return getSqlSession().update(namespace+".updateMem",memberVo);
	}

	@Override
	public int checkUserid(String userid) {
		return getSqlSession().selectOne(namespace+".selectAdminCount", userid);
	}

	@Override
	public String loginCheck(AdminMemberVO adminMemberVo) {
		return getSqlSession().selectOne(namespace+".selectPwd", adminMemberVo);
	}

	@Override
	public AdminMemberVO selectAdminByUserid(String userid) {
		return getSqlSession().selectOne(namespace+".selectAdminByUserid",userid);
	}

	@Override
	public List<MemberVO> selectAll() {
		return getSqlSession().selectList(namespace+".selectAll");
	}


}
