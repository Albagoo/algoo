package com.algoo.app.faq.model;

import java.util.List;

import com.algoo.app.common.SearchVO;
import com.algoo.app.freeboard.model.FreeboardVO;

public interface FaqDAO {
	public int WriteFaq(FaqVO faqVo);
	public List<FaqVO> selectAllFaq(SearchVO searchVo);
	public int selectTotalCount(SearchVO searchVo);
	public List<FaqVO> searchCategory(ListFaqVO searchVo); //카테고리 검색용
	public FaqVO selectByNo(int faqNo);
	public int updateFaq(FaqVO faqVo);
	public int deleteFaq(int faqNo);
	public List<FaqVO> selectUserFaq(SearchVO searchVo);
	public FaqVO prevContent(int faqNo);
	public FaqVO nextContent(int faqNo);
}
