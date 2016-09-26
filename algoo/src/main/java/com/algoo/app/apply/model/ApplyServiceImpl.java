package com.algoo.app.apply.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ApplyServiceImpl implements ApplyService{

	@Autowired
	private ApplyDAO applyDao;
	
	@Override
	public int insertApply(ApplyVO applyVo) {
		return applyDao.insertApply(applyVo);
	}

	@Override
	public List<ApplyViewVO> selectMemberCode(String memberCode) {
		return applyDao.selectMemberCode(memberCode);
	}

	@Override
	public List<ApplyViewVO> selectCompMemberCode(String compMemberCode) {
		return applyDao.selectCompMemberCode(compMemberCode);
	}

	@Override
	public int updateReadCheck(ApplyViewVO applyViewVo) {
		return applyDao.updateReadCheck(applyViewVo);
	}

}
