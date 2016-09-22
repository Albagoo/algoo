package com.algoo.app.faq.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.algoo.app.common.SearchVO;
import com.algoo.app.freeboard.model.FreeboardVO;
import com.algoo.app.notice.model.NoticeVO;

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

	@Override
	public List<FaqVO> selectUserFaq(SearchVO searchVo) {
		return faqDao.selectUserFaq(searchVo);
	}

	@Override
	public List<FaqVO> searchCategory(ListFaqVO searchVo) {
		return faqDao.searchCategory(searchVo);
	}

	@Override
	public FaqVO prevContent(int faqNo) {
		return faqDao.prevContent(faqNo);
	}

	@Override
	public FaqVO nextContent(int faqNo) {
		return faqDao.nextContent(faqNo);
	}

	@Override
	public List<FaqVO> selectAll() {
		return faqDao.selectAll();
	}

	@Override
	public int selectDelete(List<FaqVO> faqList) {
		int cnt=0;
		try{
			for(FaqVO vo : faqList){
				int faqNo=vo.getFaqNo();
				if(faqNo!=0){
					cnt=faqDao.deleteFaq(faqNo);
				}
			}//for
		}catch(RuntimeException e){
			e.printStackTrace();
			cnt=-1;
		}
		
		return cnt;
	}
	
}
