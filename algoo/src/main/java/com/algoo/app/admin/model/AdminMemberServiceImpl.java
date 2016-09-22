package com.algoo.app.admin.model;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.algoo.app.common.SearchVO;
import com.algoo.app.member.model.MemberVO;



@Service
public class AdminMemberServiceImpl implements AdminMemberService{
	@Autowired
	private AdminMemberDAO adminMemberDao;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminMemberServiceImpl.class);


	@Override
	public int selectMemberCount(SearchVO searchVo) {
		return adminMemberDao.selectMemberCount(searchVo);
	}


	@Override
	public List<MemberVO> selectMemberList(SearchVO searchVo) {
		return adminMemberDao.selectMemberList(searchVo);
	}


	@Override
	public int deleteMem(String userid) {
		return adminMemberDao.deleteMem(userid);
	}


	@Override
	public int updateMem(MemberVO memberVo) {
		return adminMemberDao.updateMem(memberVo);
	}
	
	
}
