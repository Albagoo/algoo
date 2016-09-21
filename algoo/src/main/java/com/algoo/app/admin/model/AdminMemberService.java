package com.algoo.app.admin.model;

import java.util.List;
import java.util.Map;

import com.algoo.app.common.SearchVO;
import com.algoo.app.member.model.MemberVO;


public interface AdminMemberService {
	public List<MemberVO> selectMemberList(SearchVO searchVo);
	public int selectMemberCount(SearchVO searchVo);
}
