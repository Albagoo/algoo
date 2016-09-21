package com.algoo.app.admin.model;

import java.util.List;

import com.algoo.app.common.SearchVO;
import com.algoo.app.member.model.MemberVO;


public interface AdminMemberDAO {
	public List<MemberVO> selectMemberList(SearchVO searchVo);
	public int selectMemberCount(SearchVO searchVo);
	
	
}