package com.pino.ys.controller;



import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pino.ys.dto.insertDto;
import com.pino.ys.dto.setDto;
import com.pino.ys.service.InsaServiceImpl;

@Controller
public class RegistController {
	
	@Autowired
	private InsaServiceImpl insaServiceImpl;
	
	@RequestMapping(value = "/regist")
	public ModelAndView Step01() {
	 	ArrayList<setDto> list  =  insaServiceImpl.setService();
		ModelAndView mov = new ModelAndView();
		mov.addObject("list", list);
		mov.setViewName("regist");
		return mov;
	}
	
	@RequestMapping(value="/regist/idCheck")
	@ResponseBody
	public int idCheck(String input) {
		int cnt = insaServiceImpl.idCheck(input);
		return cnt;
	}
	@RequestMapping(value = "/regist/input")
	public String input(insertDto dto) {
		insaServiceImpl.input(dto);
		return "redirect:/regist";
	}
	
	
}
