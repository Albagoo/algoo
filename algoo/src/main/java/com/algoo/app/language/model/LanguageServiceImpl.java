package com.algoo.app.language.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LanguageServiceImpl implements LanguageService{
	@Autowired
	private LanguageDAO languageDao;

	@Override
	public int insertLanguage(LanguageVO languageVo) {
		return languageDao.insertLanguage(languageVo);
	}
}
