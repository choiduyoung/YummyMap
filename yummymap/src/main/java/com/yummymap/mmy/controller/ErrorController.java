package com.yummymap.mmy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/errors")
public class ErrorController {

	@RequestMapping("/error404")
	public String error404() {
		return "error/404error";
	}
	
	@RequestMapping("/error500")
	public String error500() {
		return "error/500error";
	}
}
