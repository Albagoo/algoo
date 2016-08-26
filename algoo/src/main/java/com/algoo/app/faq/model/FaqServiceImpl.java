package com.algoo.app.faq.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FaqServiceImpl implements FaqService{
	@Autowired
	private FaqDAO faqDao;

	@Override
	public int WriteFaq(FaqVO faqVo) {
		return faqDao.WriteFaq(faqVo);
	}
}
