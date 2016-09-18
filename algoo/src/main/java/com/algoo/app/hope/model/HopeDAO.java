package com.algoo.app.hope.model;

public interface HopeDAO {
	public int insertHope(HopeVO hopeVo);
	public HopeVO selectHope(int hopeCode);
}
