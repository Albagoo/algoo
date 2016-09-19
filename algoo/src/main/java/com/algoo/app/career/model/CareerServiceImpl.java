package com.algoo.app.career.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CareerServiceImpl implements CareerService{
	@Autowired
	private CareerDAO careerDao;

	@Override
	public int insertCareer(CareerVO careerVo) {
		return careerDao.insertCareer(careerVo);
	}

	@Override
	public CareerVO selectCareer(int careerCode) {
		return careerDao.selectCareer(careerCode);
	}
	
}
