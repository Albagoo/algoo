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


	@Override
	public int checkUserid(String userid) {
		int result=0;
		int count = adminMemberDao.checkUserid(userid);
		if(count>0){ //해당 아이디가 이미 존재하는 경우
			result=EXIST_ID;
		}else{ //해당 아이디가 없는 경우
			result=NONE_EXIST_ID;
		}
		return result;
	}


	@Override
	public int loginCheck(AdminMemberVO adminMemberVo) {
		String dbPwd = adminMemberDao.loginCheck(adminMemberVo);
		int result=0;
		
		if(dbPwd==null || dbPwd.isEmpty()){
			result=ID_NONE;
		}else{
			if(dbPwd.equals(adminMemberVo.getPassword())){
				result=LOGIN_OK;
			}else{
				result=PWD_DISAGREE;
			}
		}
		return result;
	}


	@Override
	public AdminMemberVO selectAdminByUserid(String userid) {
		return adminMemberDao.selectAdminByUserid(userid);
	}
	
	
}
