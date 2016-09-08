package com.algoo.app.member.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDao;

	@Override
	public int insertMember(MemberVO vo) {
		return memberDao.insertMember(vo);
	}

	public int checkUserid(String userid) {
		//아이디 중복확인
		int result=0;
		int count = memberDao.checkUserid(userid);
		if(count>0){ //해당 아이디가 이미 존재하는 경우
			result=EXIST_ID;
		}else{ //해당 아이디가 없는 경우
			result=NONE_EXIST_ID;
		}
		
		return result;
	}
	
	public int loginCheck(MemberVO memberVo){
		String dbPwd = memberDao.loginCheck(memberVo);
		int result=0;
		
		if(dbPwd==null || dbPwd.isEmpty()){
			//해당 아이디가 없는 경우
			result=ID_NONE;
		}else{
			if(dbPwd.equals(memberVo.getPasssword())){
				//비밀번호도 일치 => 로그인 성공
				result=LOGIN_OK;
			}else{
				//비밀번호가 일치하지 않는 경우
				result=PWD_DISAGREE;
			}
		}
		
		return result;
	}
	
	public MemberVO selectMemberByUserid(String userid){
		return memberDao.selectMemberByUserid(userid);
	}
	
	public int updateMember(MemberVO vo) {
		return memberDao.updateMember(vo);
	}
	
	public int withdrawMember(String userid){
		return memberDao.withdrawMember(userid);
	}

	@Override
	public int deleteMember(String userid) {
		return memberDao.deleteMember(userid);
	}
	
}
