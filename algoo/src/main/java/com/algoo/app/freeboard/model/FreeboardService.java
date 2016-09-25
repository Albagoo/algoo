package com.algoo.app.freeboard.model;

import java.util.List;
import java.util.Map;

import com.algoo.app.common.SearchVO;

public interface FreeboardService {
	public int insertFreeboard(FreeboardVO freeVo);
	public List<FreeboardVO> selectAllFreeboard(SearchVO searchVo);
	public int selectTotalCount(SearchVO searchVo);
	public int updateReadCount(int freeNo);
	public FreeboardVO selectFreeboardByNo(int freeNo);
	public int editFreeboard(FreeboardVO freeVo);
	/*public int deleteFreeboard(int freeNo);*/
	public void deleteFreeboard(Map<String, String> map);
	public int insertReply(FreeboardVO freeVo);
	public FreeboardVO prevContent(int freeNo);
	public FreeboardVO nextContent(int freeNo);
	public List<FreeboardVO> selectAll();
	public int selectDelete(List<FreeboardVO> fList);
}
