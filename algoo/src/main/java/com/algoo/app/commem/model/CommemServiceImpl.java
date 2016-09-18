package com.algoo.app.commem.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.algoo.app.company.model.CompanyDAO;
import com.algoo.app.member.model.MemberVO;

@Service
public class CommemServiceImpl implements CommemService {
	
	@Autowired
	private CommemDAO commemDao;
	
	@Override
	public int insertCompMember(CommemVO commemVo) {
		return commemDao.insertCompMember(commemVo);
	}
	@Override
	public int checkUserid(String userid) {
		//아이디 중복확인
		int result=0;
		int count = commemDao.checkUserid(userid);
		if(count>0){ //해당 아이디가 이미 존재하는 경우
			result=EXIST_ID;
		}else{ //해당 아이디가 없는 경우
			result=NONE_EXIST_ID;
		}
		
		return result;
	}

	@Override
	public int loginCheck(CommemVO commemVo) {
		String dbPwd = commemDao.loginCheck(commemVo);
		int result=0;
		
		if(dbPwd==null || dbPwd.isEmpty()){
			//해당 아이디가 없는 경우
			result=ID_NONE;
		}else{
			if(dbPwd.equals(commemVo.getPassword())){
				//비밀번호도 일치 => 로그인 성공
				result=LOGIN_OK;
			}else{
				//비밀번호가 일치하지 않는 경우
				result=PWD_DISAGREE;
			}
		}
		return result;
	}
	@Override
	public CommemVO selectMemberByUserid(String userid) {
		return commemDao.selectMemberByUserid(userid);
	}
	@Override
	public int updateCompCode(CommemVO commemVo) {
		return commemDao.updateCompCode(commemVo);
	}
	@Override
	public int updateCompMember(CommemVO commemVo) {
		return commemDao.updateCompMember(commemVo);
	}

}
