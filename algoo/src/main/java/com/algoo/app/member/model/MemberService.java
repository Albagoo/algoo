package com.algoo.app.member.model;


public interface MemberService {
	
	//아이디 중복 확인 시 사용하는 상수
	//해당 아이디가 존재하는지 여부
	public static final int EXIST_ID=1; //해당아이디가 존재
	public static final int NONE_EXIST_ID=2;
	//=> 해당 아이디가 존재하지 않음
	
	//로그인 처리시 사용하는 상수
	public static final int LOGIN_OK=1;//로그인 성공
	public static final int PWD_DISAGREE=2; //비밀번호 불일치
	public static final int ID_NONE=3;//해당아이디가 없는 경우
	
	//권한코드
	public static final String ADMIN_AUTH_CODE="ADMIN"; 
	public static final String USER_AUTH_CODE="USER"; 
	
	public int insertMember(MemberVO vo);
	public int checkUserid(String userid);
	public int loginCheck(MemberVO memberVo);
	public MemberVO selectMemberByUserid(String userid);
	public int updateMember(MemberVO vo);
	public int withdrawMember(String userid);
	public int updatePhoto(MemberVO memberVo);
	public MemberVO selectMemberByCode(String memberCode);
	public String selectId(MemberVO memberVo);
	public int selectCount(MemberVO memberVo);
	public int updatePwd(MemberVO memberVo);
}
