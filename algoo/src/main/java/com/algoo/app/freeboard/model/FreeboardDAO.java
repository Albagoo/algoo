package com.algoo.app.freeboard.model;

import java.util.List;
import java.util.Map;

import com.algoo.app.common.SearchVO;

public interface FreeboardDAO {
	public int insertFreeboard(FreeboardVO freeVo);
	public List<FreeboardVO> selectAllFreeboard(SearchVO searchVo);
	public int selectTotalCount(SearchVO searchVo);
	public int updateReadCount(int freeNo);
	public FreeboardVO selectFreeboardByNo(int freeNo);
	public int editFreeboard(FreeboardVO freeVo);
	/*public int deleteFreeboard(int freeNo);*/
	public void deleteFreeboard(Map<String, String> map);
	public int updateSortNo(FreeboardVO freeVo);
	public int insertReply(FreeboardVO freeVo);
}
