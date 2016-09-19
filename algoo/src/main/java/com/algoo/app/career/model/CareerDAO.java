package com.algoo.app.career.model;

public interface CareerDAO {
	public int insertCareer(CareerVO careerVo);
	public CareerVO selectCareer(int careerCode);
}
