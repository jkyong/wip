package com.partdb.wip.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class CommonController {

	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("START");
		return "index";
	}
	
	@RequestMapping(value = "/{group}/{page}", method = RequestMethod.GET)
	public String baseinfo(
			@PathVariable("group") String group, 
			@PathVariable("page") String page) {
		return group + "/" + page;
	}		
	
	@RequestMapping(value = "/modal/{group}/{page}", method = RequestMethod.GET)
	public String modal(
			@PathVariable("group") String group, 
			@PathVariable("page") String page) {
		return "modal" + "/" + group + "/" + page;
	}
	
	@RequestMapping(value = "/grid/{group}/{page}", method = RequestMethod.GET)
	public String grid(
			@PathVariable("group") String group, 
			@PathVariable("page") String page) {
		return "grid" + "/" + group + "/" + page;
	}	
}
