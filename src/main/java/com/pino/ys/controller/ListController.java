package com.pino.ys.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pino.ys.dao.InsaDao;
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
	
	@RequestMapping(value = "/listView", method = RequestMethod.POST)
	public ModelAndView listView(boardDto bDto, HttpSession session) {
		ModelAndView mov = new ModelAndView();

		//페이징처리
		int total = insaServiceImpl.countBoard(bDto);
		int nowPage = bDto.getNowPage(); 
		int cntPerPage = bDto.getCntPerPage();
		
		
		if (nowPage==0 && cntPerPage==0) {
			nowPage = 1;
			cntPerPage = 5;
		} else if (nowPage==0) {
			nowPage = 1;
		} else if (cntPerPage == 0) { 
			cntPerPage = 5;
		}
		
		bDto.pagingSet(total, nowPage, cntPerPage);
		ArrayList<insertDto> contents =  insaServiceImpl.selectInsa(bDto);
		mov.addObject("paging", bDto);
		mov.addObject("list", insaServiceImpl.setService());
		mov.addObject("contents" , contents);
		mov.setViewName("list");		
		session.setAttribute("bDto", bDto);
		return mov;	
	}
	
	
	@RequestMapping(method = RequestMethod.GET, value = "/listViewPaging")
	public ModelAndView listViewPaging(HttpSession session, int nowPage, int cntPerPage) {
		//페이징처리
		
		if (nowPage==0 && cntPerPage==0) {
			nowPage = 1;
			cntPerPage = 5;
		} else if (nowPage==0) {
			nowPage = 1;
		} else if (cntPerPage == 0) { 
			cntPerPage = 5;
		}
		
		ModelAndView mov = new ModelAndView();
		boardDto bDto = (boardDto)session.getAttribute("bDto");
		int total = insaServiceImpl.countBoard(bDto);
			
		bDto.pagingSet(total, nowPage, cntPerPage);
		ArrayList<insertDto> contents =  insaServiceImpl.selectInsa(bDto);
		mov.addObject("paging", bDto);
		mov.addObject("list", insaServiceImpl.setService());
		mov.addObject("contents" , contents);
		mov.setViewName("list");		
		
		return mov;	
	}
	
	
	
	@RequestMapping(value="/delete")
	@ResponseBody
	public int delete(String delArr) {
		String[] deleteArr = delArr.split(",");
		ArrayList<String> delList = new ArrayList<String>();
		for(String s : deleteArr) {
			delList.add(s.trim());
		}
		int del = insaServiceImpl.deleteUser(delList);
		
		return del;
		
	}
	
	@RequestMapping(value="/selectOne")
	public ModelAndView selectOne(String sabun) {
		insertDto selectOne = insaServiceImpl.selectOne(sabun);
		
		String emailArr[] = selectOne.getEmail().split("@");
		
		//이멜도메인
		selectOne.setEmail("@"+emailArr[1]);
		//이메일아이디
		ModelAndView mov = new ModelAndView();
		mov.addObject("email1", emailArr[0]);
		mov.setViewName("modify");
		mov.addObject("list", insaServiceImpl.setService());
		mov.addObject("One", selectOne);
		return mov;
	}
	
	@RequestMapping("/modify")
	public ModelAndView modify(insertDto dto, String email1) {
		ModelAndView mov = new ModelAndView();
		dto.setEmail(email1+dto.getEmail());//이메일 합쳐주기
		insaServiceImpl.update(dto);
		dto = insaServiceImpl.selectOne(dto.getSabun());
		String emailArr[] = dto.getEmail().split("@");
		dto.setEmail("@"+emailArr[1]);
		mov.setViewName("modify");
		mov.addObject("One", dto);
		mov.addObject("email1", emailArr[0]);
		mov.addObject("list", insaServiceImpl.setService());
	
		return mov;
	}
	
}
