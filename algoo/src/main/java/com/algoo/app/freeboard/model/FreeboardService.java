package com.algoo.app.freeboard.model;

import java.util.List;

import com.algoo.app.common.SearchVO;

public interface FreeboardService {
	public int insertFreeboard(FreeboardVO freeVo);
	public List<FreeboardVO> selectAllFreeboard(SearchVO searchVo);
	public int selectTotalCount(SearchVO searchVo);
	public int updateReadCount(int freeNo);
	public FreeboardVO selectFreeboardByNo(int freeNo);
	public int editFreeboard(FreeboardVO freeVo);
	public int deleteFreeboard(int freeNo);
}
