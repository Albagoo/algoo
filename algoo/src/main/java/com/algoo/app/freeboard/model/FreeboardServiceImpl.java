package com.algoo.app.freeboard.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.algoo.app.common.SearchVO;
import com.algoo.app.faq.model.FaqVO;

@Service
public class FreeboardServiceImpl implements FreeboardService{
	private static final Logger logger
	=LoggerFactory.getLogger(FreeboardServiceImpl.class);
	
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
	public void deleteFreeboard(Map<String, String> map) {
		freeDao.deleteFreeboard(map);
	}

	@Override
	@Transactional
	public int insertReply(FreeboardVO freeVo) {
		int cnt=freeDao.updateSortNo(freeVo);
		logger.info("sortNo 증가 처리 결과 cnt = {}", cnt);
		
		cnt=freeDao.insertReply(freeVo);
		logger.info("답변처리 결과 cnt = {}", cnt);
		
		return cnt;
	}

	@Override
	public FreeboardVO prevContent(int freeNo) {
		return freeDao.prevContent(freeNo);
	}

	@Override
	public FreeboardVO nextContent(int freeNo) {
		return freeDao.nextContent(freeNo);
	}

	@Override
	public List<FreeboardVO> selectAll() {
		return freeDao.selectAll();
	}

	@Override
	public int selectDelete(List<FreeboardVO> fList) {
		int cnt=0;
		try{
			for(FreeboardVO vo : fList){
				int freeNo=vo.getFreeNo();
				if(freeNo!=0){  
					Map<String, String> map = new HashMap<String, String>();
					map.put("freeNo", Integer.toString(freeNo));
					map.put("groupNo", vo.getGroupNo()+"");
					map.put("step", vo.getStep()+"");
					
					freeDao.deleteFreeboard(map);
					
					cnt=1;
					
				}
			}//for
		}catch(RuntimeException e){
			e.printStackTrace();
			cnt=-1;
		}
		
		return cnt;
		
	}
}