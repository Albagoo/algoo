package com.algoo.app.language.model;

public interface LanguageService {
	public int insertLanguage(LanguageVO languageVo);
	public LanguageVO selectLanguage(int languageCode);
}
