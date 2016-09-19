package com.algoo.app.career.model;

public interface CareerService {
	public int insertCareer(CareerVO careerVo);
	public CareerVO selectCareer(int careerCode);
}
