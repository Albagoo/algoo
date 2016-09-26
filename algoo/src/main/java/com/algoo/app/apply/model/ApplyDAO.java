package com.algoo.app.apply.model;

import java.util.List;

public interface ApplyDAO {
	public int insertApply(ApplyVO applyVo);
	public List<ApplyViewVO> selectMemberCode(String memberCode);
	public List<ApplyViewVO> selectCompMemberCode(String compMemberCode);
	public int updateReadCheck(ApplyViewVO applyViewVo);
}
