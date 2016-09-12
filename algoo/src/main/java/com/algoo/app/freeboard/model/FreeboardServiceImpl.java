package com.algoo.app.freeboard.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.algoo.app.common.SearchVO;

@Service
public class FreeboardServiceImpl implements FreeboardService{
	
	@Autowired
	private FreeboardDAO freeDao;

	@Override
	public int insertFreeboard(FreeboardVO freeVo) {
		return freeDao.insertFreeboard(freeVo);
	}

	@Override
	public List<FreeboardVO> selectAllFreeboard(SearchVO searchVo) {
		return freeDao.selectAllFreeboard(searchVo);
	}

	@Override
	public int selectTotalCount(SearchVO searchVo) {
		return freeDao.selectTotalCount(searchVo);
	}

	@Override
	public int updateReadCount(int freeNo) {
		return freeDao.updateReadCount(freeNo);
	}

	@Override
	public FreeboardVO selectFreeboardByNo(int freeNo) {
		return freeDao.selectFreeboardByNo(freeNo);
	}

	@Override
	public int editFreeboard(FreeboardVO freeVo) {
		return freeDao.editFreeboard(freeVo);
	}

	@Override
	public int deleteFreeboard(int freeNo) {
		return freeDao.deleteFreeboard(freeNo);
	}
}
