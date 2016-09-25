package com.algoo.app.scrape.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.algoo.app.scrape.model.RecScrapeService;

@Controller
public class RecScrapeController {

	@Autowired
	private RecScrapeService rsService;
	
	Logger logger
	=LoggerFactory.getLogger(RecScrapeController.class);
	
	
}
