package com.algoo.app.member.model;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;



@Repository
public class MemberDAOMybatis extends SqlSessionDaoSupport implements MemberDAO{
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOMybatis.class);
	
	private String namespace="com.mybatis.mapper.oracle.member";
	
	@Override
	public int insertMember(MemberVO vo) {
		return getSqlSession().insert(namespace+".insertMember", vo);
	}

	@Override
	public int checkUserid(String userid) {
		return getSqlSession().selectOne(namespace+".selectCountUserid", userid);
	}
	
	public String loginCheck(MemberVO memberVo){
		//아이디, 비밀번호가 일치하는지 여부 체크
		//로그인시 사용
		return getSqlSession().selectOne(namespace+".selectPwd", memberVo);
	}
	
	public MemberVO selectMemberByUserid(String userid){
		return getSqlSession().selectOne(namespace+".selectMemberByUserid",userid);
	}
	
	public int updateMember(MemberVO vo){
		//회원정보 수정 처리-update
		return getSqlSession().update(namespace+".updateMember",vo);
	}
	
	public int withdrawMember(String userid){
		//회원 탈퇴
		return getSqlSession().delete(namespace+".outMember", userid);
	}

	@Override
	public int updatePhoto(MemberVO memberVo) {
		return getSqlSession().update(namespace+".updatePhoto", memberVo);
	}

	@Override
	public MemberVO selectMemberByCode(String memberCode) {
		return getSqlSession().selectOne(namespace+".selectMemberByCode",
				memberCode);
	}

}
