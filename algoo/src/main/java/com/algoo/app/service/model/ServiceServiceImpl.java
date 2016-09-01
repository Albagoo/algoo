package com.algoo.app.service.model;

import org.springframework.beans.factory.annotation.Autowired;

public class ServiceServiceImpl implements ServiceService {

	@Autowired
	private ServiceDAO ServiceDao;
	
}
