package com.pino.ys.controller;



import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.swing.filechooser.FileSystemView;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pino.ys.dto.insertDto;
import com.pino.ys.dto.setDto;
import com.pino.ys.service.InsaServiceImpl;
import com.pino.ys.validator.RegistValidator;

@Controller
public class RegistController {
	
	@Autowired
	private InsaServiceImpl insaServiceImpl;
	
	
	
	@RequestMapping(value="/idCheck")
	@ResponseBody
	public int idCheck(String input) {
		int cnt = insaServiceImpl.idCheck(input);
		return cnt;
	}
	
	
	
	@RequestMapping(value = "/regist")
	public ModelAndView Step01(ModelAndView mov) {
	 	ArrayList<setDto> list  =  insaServiceImpl.setService();
		mov.addObject("list", list);
		mov.setViewName("regist");
		mov.addObject("cnt",3);
		return mov;
	}
	
	@RequestMapping(value = "/input")
	public ModelAndView input(insertDto dto, String email1, HttpServletRequest req, Errors errors ) throws IllegalStateException, IOException {
		
		ModelAndView mov = new ModelAndView();
		mov.setViewName("redirect:/regist");
		dto.setEmail(email1+dto.getEmail());//이메일주소 합쳐주기
		new RegistValidator().validate(dto, errors);
		if(errors.hasErrors()) {
			return mov;
		}
		
		//파일 업로드
		String root=req.getSession().getServletContext().getRealPath("/"); 
		String path=root+"\\upload\\";
	    
	    //insert객체에 하나씩 저장
		dto.fileCheck(dto,path);
	    insaServiceImpl.input(dto);
	    
		return mov;
	}
	
	
}
