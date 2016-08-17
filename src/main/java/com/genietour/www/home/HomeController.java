package com.genietour.www.home;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

/**
 * Handles requests for the application home page.
 */
@SessionAttributes("user")
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/")
	public String home(Locale locale, Model model, SessionStatus status) {
		logger.info("Welcome to genietour! The client locale is {}.", locale);
		status.setComplete();
		return "global/main.tiles";
	}
	
	
	@RequestMapping(value="/", method=RequestMethod.POST)
	public String home() {
		logger.info("/ POST");		
		return "global/main";
	}
}
