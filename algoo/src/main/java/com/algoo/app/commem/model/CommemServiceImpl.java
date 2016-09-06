package com.algoo.app.commem.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommemServiceImpl implements CommemService {
	
	@Autowired
	private CommemDAO commemDao;
}
