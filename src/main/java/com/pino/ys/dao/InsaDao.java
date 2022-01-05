package com.pino.ys.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Service;

import com.pino.ys.dto.setDto;


@Mapper
public interface InsaDao {
	
	public ArrayList<setDto> setService(); 
	
	public int idCheck(String input);
}
