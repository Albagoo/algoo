package com.algoo.app.scrape.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.algoo.app.scrape.model.RecScrapeService;
import com.algoo.app.scrape.model.RecScrapeVO;

@Controller
@RequestMapping("/recScrape")
public class RecScrapeController {

	@Autowired
	private RecScrapeService rsService;
	
	Logger logger
	=LoggerFactory.getLogger(RecScrapeController.class);
	
	@RequestMapping(value="/addScrape.ag")
	public String Scrapeadd(
			@ModelAttribute RecScrapeVO recScrapeVo,
			HttpSession session,
			Model model){
		String userid = (String) session.getAttribute("userid");

		recScrapeVo.setUserid(userid);
		
		
		rsService.insertRecScrape(recScrapeVo);
		
		/*List<RecScrapeVO> alist = rsService.selectRecScrape(recScrapeVo);*/
		
		return null;
		
		
	}
}
