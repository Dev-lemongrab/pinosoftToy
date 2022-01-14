package com.pino.ys.validator;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.springframework.validation.Errors;

import org.springframework.validation.Validator;

import com.pino.ys.dto.insertDto;


public class RegistValidator implements Validator{

	private static final String nameExp = "^[가-힣]*$";
	private Pattern pattern;
	
	
	public RegistValidator() {
		pattern= Pattern.compile(nameExp);
	}

	@Override
	public boolean supports(Class<?> clazz) {
		
		return insertDto.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		insertDto dto = (insertDto)target;
		
		if(dto.getPwd()==null || dto.getPwd().trim().isEmpty()) {
			errors.rejectValue("pwd", "required");
		}else {
			if(!(dto.getPwd().equals(dto.getPwChk()))) {
				errors.rejectValue("pwd", "match");
			}
		}
		
		if(dto.getEmail()==null || dto.getEmail().trim().isEmpty()) {
			errors.rejectValue("Email", "required");
		}
		
		if(dto.getName()==null || dto.getName().trim().isEmpty()) {
			errors.rejectValue("name","required");
		}else {
			Matcher matcher = pattern.matcher(dto.getName());
			if(!matcher.matches()) {
				errors.rejectValue("name", "bad");
			}
		}
		
		if(dto.getId()==null || dto.getId().trim().isEmpty()) {
			errors.rejectValue("Id", "required");
		}
		
		
		if(dto.getHp()==null || dto.getHp().trim().isEmpty()) {
			errors.rejectValue("hp", "required");
		}
		
		
		if(dto.getReg_no()==null || dto.getReg_no().trim().isEmpty()) {
			errors.rejectValue("reg_no", "required");
		}
		
		
		
		
	}
	
	
}
