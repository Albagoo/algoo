package com.algoo.app.commem.model;

public interface CommemDAO {
	public int insertCompMember(CommemVO commemVo);
	public String loginCheck(CommemVO commemVo);
	public int checkUserid(String userid);
}
