package com.algoo.app.faq.model;

import java.util.List;

import com.algoo.app.common.SearchVO;

public interface FaqDAO {
	public int WriteFaq(FaqVO faqVo);
	public List<FaqVO> selectAllFaq(SearchVO searchVo);
	public int selectTotalCount(SearchVO searchVo);
	public int updateReadCount(int faqNo);
	public FaqVO selectByNo(int faqNo);
	public int updateFaq(FaqVO faqVo);
	public int deleteFaq(int faqNo);
	public List<FaqVO> selectUserFaq(SearchVO searchVo);
}
