package com.pino.ys.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
		
		
		if (nowPage==0 ||cntPerPage==0) {
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
	
	public void deleteImageAll(String s, HttpServletRequest req) {
		insertDto imgDto = insaServiceImpl.selectImg(s.trim());
		String root = req.getSession().getServletContext().getRealPath("/"); 
		String path = root+"\\upload\\";
		if(imgDto!=null) {	
			File file;
			file= new File(path+imgDto.getCarrier());
			if(file.exists()) {file.delete();}
		
		
			file= new File(path+imgDto.getCmp_reg_image());
			if(file.exists()) {file.delete();}
	
		
			file= new File(path+imgDto.getProfile_image());
			if(file.exists()) {file.delete();}
		}
	}
	public void deleteImage(String s, HttpServletRequest req, String delColumn) {
		insertDto imgDto = insaServiceImpl.selectImg(s.trim());
		String root = req.getSession().getServletContext().getRealPath("/"); 
		String path = root+"\\upload\\";
		if(imgDto!=null) {	
			File file;
			file= new File(path+delColumn);
			if(file.exists()) {file.delete();}

		}
	}
	
	@RequestMapping(value="/delete")
	@ResponseBody
	public int delete(String delArr, HttpServletRequest req) {
		String[] deleteArr = delArr.split(",");
		ArrayList<String> delList = new ArrayList<String>();
		for(String s : deleteArr) {
			delList.add(s.trim());
			deleteImageAll(s, req);	
		}
		
		
		int del = insaServiceImpl.deleteUser(delList);
		
		return del;
		
	}
	
	@RequestMapping(value="/selectOne")
	public ModelAndView selectOne(String sabun) {
		insertDto selectOne = insaServiceImpl.selectOne(sabun);
		String car="";
		String cmp="";
		if(selectOne.getCarrier()!=null) {
			car=selectOne.getCarrier().split("_")[1];
		}
		if(selectOne.getCmp_reg_image()!=null) {
			cmp=selectOne.getCmp_reg_image().split("_")[1];
		}
		String emailArr[] = selectOne.getEmail().split("@");
		
		//이멜도메인
		selectOne.setEmail("@"+emailArr[1]);
		//이메일아이디
		ModelAndView mov = new ModelAndView();
		mov.addObject("car", car);
		mov.addObject("cmp", cmp);
		mov.addObject("email1", emailArr[0]);
		mov.setViewName("modify");
		mov.addObject("list", insaServiceImpl.setService());
		mov.addObject("One", selectOne);
		return mov;
	}
	
	@RequestMapping(value="/modify")
	public ModelAndView modify(insertDto dto, String email1, HttpServletRequest req, HttpSession session, HttpServletResponse response) throws IOException {
		ModelAndView mov = new ModelAndView();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		dto.setEmail(email1+dto.getEmail());//이메일 합쳐주기
	
		//파일업로드 하기 전에 파일 삭제 돼야함
		String a =dto.getProfile_image();
		String b = dto.getCmp_reg_image();
		String c = dto.getCarrier();
		
		
		
		
		
		//파일업로드하는 부분
		String root=req.getSession().getServletContext().getRealPath("/"); 
		String path=root+"\\upload\\";
		dto.fileCheck(dto,path);
		
		//업뎃
		insaServiceImpl.update(dto);
		
		//다시 한명정보를 얻어옴
		//dto = insaServiceImpl.selectOne(dto.getSabun());
		
		//스크립트 내용띄우기
		String htmlCode = "<script> \r\n"//자바스크립트 내용 \ㅜ줄띄우기 
				+ "alert(\"Complete\"); \r\n"
				+ "</script>";
		out.print(htmlCode);
		out.flush();
		
		//페이징처리
		boardDto bDto =(boardDto)session.getAttribute("bDto");
		
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
		
		//검색했던 내용 보존시켜주기위함
		session.setAttribute("bDto", bDto);
		
	
		//mov.setViewName("redirect:/listViewPaging?nowPage=1&cntPerPage=5");
		//업뎃한 내용을 다시 세션에 띄워줌
		session.setAttribute("One", dto);
		
	
		
		return mov;
	}
	
}
