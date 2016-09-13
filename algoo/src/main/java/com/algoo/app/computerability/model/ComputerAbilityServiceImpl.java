package com.algoo.app.computerability.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ComputerAbilityServiceImpl implements ComputerAbilityService{
	@Autowired
	private ComputerAbilityDAO computerAbilityDao;

	@Override
	public int insertComputerAbility(ComputerAbilityVO computerAbilityVo) {
		return computerAbilityDao.insertComputerAbility(computerAbilityVo);
	}
	
	
	
}
