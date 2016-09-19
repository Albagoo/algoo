package com.algoo.app.language.model;

public interface LanguageDAO {
	public int insertLanguage(LanguageVO languageVo);
	public LanguageVO selectLanguage(int languageCode);
}
