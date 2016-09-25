package com.algoo.app.member.model;


public interface MemberDAO {
	public int insertMember(MemberVO vo);
	public int checkUserid(String userid);
	public String loginCheck(MemberVO memberVo);
	public MemberVO selectMemberByUserid(String userid);
	public int updateMember(MemberVO vo);
	public int withdrawMember(String userid);
	public int updatePhoto(MemberVO memberVo);
	public MemberVO selectMemberByCode(String memberCode);
	public String selectId(MemberVO memberVo);
	public int selectCount(MemberVO memberVo);
	public int updatePwd(MemberVO memberVo);
	public int selectAllUserid(String userid);
	public int selectAllNickName(String userid);
	public int selectAllEmail(String userid);
}
