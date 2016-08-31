package com.algoo.app.faq.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.algoo.app.common.SearchVO;

@Service
public class FaqServiceImpl implements FaqService{
	@Autowired
	private FaqDAO faqDao;

	@Override
	public int WriteFaq(FaqVO faqVo) {
		return faqDao.WriteFaq(faqVo);
	}

	@Override
	public List<FaqVO> selectAllFaq(SearchVO searchVo) {
		return faqDao.selectAllFaq(searchVo);
	}

	@Override
	public int selectTotalCount(SearchVO searchVo) {
		return faqDao.selectTotalCount(searchVo);
	}

	@Override
	public int updateReadCount(int faqNo) {
		return faqDao.updateReadCount(faqNo);
	}

	@Override
	public FaqVO selectByNo(int faqNo) {
		return faqDao.selectByNo(faqNo);
	}

	@Override
	public int updateFaq(FaqVO faqVo) {
		return faqDao.updateFaq(faqVo);
	}

	@Override
	public int deleteFaq(int faqNo) {
		return faqDao.deleteFaq(faqNo);
	}
}
