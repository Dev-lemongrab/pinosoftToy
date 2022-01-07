package com.pino.ys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ListController {
	@RequestMapping(value = "/list")
	public String list() {
		return "list";
	}
}
