package com.algoo.app.computerability.model;

public interface ComputerAbilityDAO {
	public int insertComputerAbility(ComputerAbilityVO computerAbilityVo);
	public ComputerAbilityVO selectComputerAbility(int comAbilityCode);
}
