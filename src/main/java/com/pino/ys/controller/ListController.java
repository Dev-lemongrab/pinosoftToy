package com.pino.ys.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pino.ys.dto.boardDto;
import com.pino.ys.dto.insertDto;
import com.pino.ys.service.InsaServiceImpl;

@Controller
public class ListController {
	
	@Autowired
	InsaServiceImpl insaServiceImpl;
	
	@RequestMapping(value = "/list")
	public ModelAndView list() {
		ModelAndView mov = new ModelAndView();
		mov.addObject("list",insaServiceImpl.setService());
		mov.setViewName("list");
		return mov;
	}
	@RequestMapping(value = "/listView")
	public ModelAndView listView(boardDto bDto) {
		ModelAndView mov = new ModelAndView();
		ArrayList<insertDto> contents =  insaServiceImpl.selectInsa(bDto);
		mov.addObject("list", insaServiceImpl.setService());
		mov.addObject("contents" , contents);
		mov.setViewName("list");
		return mov;
		
	}
	
	@RequestMapping(value="/delete")
	@ResponseBody
	public int delete(String delArr) {
		String[] deleteArr = delArr.split(",") ;
		ArrayList<String> delList = new ArrayList<String>();
		for(String s : deleteArr) {
			delList.add(s);
		}
		return insaServiceImpl.deleteUser(delList);
		
	}
	
}
