package com.algoo.app.apply.model;

import java.util.List;

public interface ApplyService {
	public int insertApply(ApplyVO applyVo);
	public List<ApplyViewVO> selectMemberCode(String memberCode);
}
